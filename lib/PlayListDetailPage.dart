import 'package:flutter/material.dart';

import 'Player/PlayerBar.dart';
import 'component/CardMusicListItem.dart';
import 'component/DetailTopBar.dart';
import 'component/ImageNet.dart';
import 'generated/l10n.dart';

class PlayListDetailPage extends StatefulWidget {
  final int index; // 传递列表项索引
  final VoidCallback onBack; // 返回到列表的回调函数
  final double top;

  const PlayListDetailPage({
    this.top = 10,
    super.key,
    required this.index,
    required this.onBack,
  });

  @override
  State<PlayListDetailPage> createState() => _PlayListDetailPageState();
}

class _PlayListDetailPageState extends State<PlayListDetailPage> {
  double _topBarHeight = 220; // 默认顶部栏高度
  final ScrollController _scrollController = ScrollController();

  List<int> _items = List.generate(40, (index) => index); // 初始数据
  bool _isLoadingMore = false; // 是否正在加载更多数据
  bool _hasMore = true; // 是否还有更多数据可加载

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final newHeight = (220 - _scrollController.offset).clamp(0.0, 220.0);
    if (newHeight != _topBarHeight) {
      setState(() {
        _topBarHeight = newHeight;
      });
    }

    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        !_isLoadingMore &&
        _hasMore) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    setState(() {
      _isLoadingMore = true;
    });

    // 模拟网络加载
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoadingMore = false;
      // if (_items.length < 100) {
      _items.addAll(List.generate(40, (index) => _items.length + index));
      // } else {
      //   _hasMore = false; // 无更多数据
      // }
    });
  }

  Future<void> _refresh() async {
    // 模拟网络刷新
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _items = List.generate(40, (index) => index); // 重新加载数据
      _hasMore = true; // 重置加载状态
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              DetailTopBar(
                  height: _topBarHeight, index: widget.index, top: widget.top),
              // 主内容区，添加下拉刷新和滚动加载逻辑
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh, // 下拉刷新
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      bool useGrid = MediaQuery.of(context).size.width > 600;
                      int crossAxisCount = useGrid
                          ? (MediaQuery.of(context).size.width / 250).floor()
                          : 1;
                      return Padding(
                          padding: EdgeInsets.only(
                              top: _topBarHeight < 110 ? 65 : 5),
                          child: CustomScrollView(
                            controller: _scrollController,
                            slivers: [
                              SliverPadding(
                                padding: EdgeInsets.only(
                                    top: _topBarHeight < 110 ? 65 : 5),
                                sliver: _buildContent(useGrid, crossAxisCount),
                              ),
                              SliverToBoxAdapter(
                                child: _buildLoadMoreIndicator(),
                              ),
                            ],
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: widget.top,
            left: 5,
            child: GestureDetector(
              onTap: widget.onBack,
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new, size: 24),
                  const SizedBox(width: 10),
                  AnimatedOpacity(
                    opacity: (1.0 - (_topBarHeight / 220.0)).clamp(0.0, 1.0),
                    duration: const Duration(milliseconds: 200),
                    child: Row(
                      children: [
                        ImageNet(
                          imageUrl:
                              'https://picsum.photos/300/300?random=${widget.index}',
                          width: 45,
                          height: 45,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Left ${widget.index}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: widget.top != 10 ? const MusicPlayerBar() : null,
    );
  }

  Widget _buildLoadMoreIndicator() {
    if (_isLoadingMore) {
      return const SizedBox(
        height: 80,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    if (!_hasMore) {
      return SizedBox(
        height: 50,
        child: Center(
          child: Text(
            S.current.no_more_data,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildGridItem(int index, int crossAxisCount) {
    return Container(
      margin: EdgeInsets.only(
        left: index % crossAxisCount == 0 ? 10 : 0,
        right: index % crossAxisCount == crossAxisCount - 1 ? 10 : 0,
        bottom: 5,
      ),
      child: CardMusicListItem(
        onTap: () {},
        isGrid: true,
        imageUrl: 'https://picsum.photos/100/100?random=${_items[index]}',
        description: "description",
        onFirstButtonPressed: () => {},
        onSecondButtonPressed: () => {},
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: CardMusicListItem(
        onTap: () {},
        isGrid: true,
        imageUrl: 'https://picsum.photos/100/100?random=${_items[index]}',
        description: "description",
        onFirstButtonPressed: () => {},
        onSecondButtonPressed: () => {},
      ),
    );
  }

  Widget _buildContent(bool useGrid, int crossAxisCount) {
    return useGrid
        ? SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildGridItem(index, crossAxisCount),
              childCount: _items.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisExtent: 85,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildListItem(index),
              childCount: _items.length,
            ),
          );
  }
}
