import 'package:flutter/material.dart';
import 'package:music_app/Api/ResponseEntry/Album.dart';
import 'package:music_app/Api/ResponseEntry/Song.dart';
import 'package:music_app/utils/DialogUtils.dart';

import 'Api/HttpClient.dart';
import 'Player/PlayerBar.dart';
import 'Player/PlayerController.dart';
import 'component/CardMusicListItem.dart';
import 'component/DetailTopBar.dart';
import 'component/ImageNet.dart';
import 'generated/l10n.dart';

class AlbumDetailPage extends StatefulWidget {
  final int id; // 传递列表项索引
  final VoidCallback onBack; // 返回到列表的回调函数
  final double top;

  const AlbumDetailPage({
    this.top = 10,
    super.key,
    required this.id,
    required this.onBack,
  });

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  double _topBarHeight = 200; // 默认顶部栏高度
  final ScrollController _scrollController = ScrollController();
  final http = HTTP.getClient<RetrofitClient>();
  List<Song> _items = []; // 通用数据列表
  Album? _album;
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    load();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // 检查当前是否是大屏模式
    if (MediaQuery.of(context).size.width > 600) {
      return; // 在大屏幕设备上禁用 _onScroll
    }

    final newHeight = (200 - _scrollController.offset).clamp(0.0, 200.0);
    if (newHeight != _topBarHeight) {
      setState(() {
        _topBarHeight = newHeight;
      });
    }
  }

  Future<void> _refresh() async {
    var albumResult = await http.album(widget.id.toString());
    setState(() {
      _items = albumResult.songs ?? [];
      _album = albumResult.album;
      loaded = true;
    });
  }

  Future<void> load() async {
    await _refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded || _album == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          // 顶部栏和返回按钮
          Stack(
            children: [
              DetailTopBar(
                isFavorite: false,
                showDeleteButton: false,
                showDetailButton: true,
                showFavoriteButton: false,
                height: _topBarHeight,
                top: widget.top,
                url: _album?.picUrl ?? "",
                title: _album?.name ?? "",
                subtitle: _album?.description ?? "",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 25),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onBack,
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_back_ios_new, size: 24),
                          const SizedBox(width: 10),
                          AnimatedOpacity(
                            opacity:
                                (1.0 - (_topBarHeight / 200.0)).clamp(0.0, 1.0),
                            duration: const Duration(milliseconds: 200),
                            child: Row(
                              children: [
                                ImageNet(
                                  imageUrl: _album?.picUrl ?? "",
                                  width: 45,
                                  height: 45,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  _album?.name ?? "",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 主内容区
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool useGrid = MediaQuery.of(context).size.width > 600;
                int crossAxisCount = useGrid
                    ? (MediaQuery.of(context).size.width / 250).floor()
                    : 1;
                return Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverPadding(
                        padding:
                            EdgeInsets.only(top: _topBarHeight < 110 ? 65 : 5),
                        sliver: _buildContent(useGrid, crossAxisCount),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: widget.top != 10 ? const MusicPlayerBar() : null,
    );
  }

  Widget _buildGridItem(int index, int crossAxisCount) {
    var item = _items[index];
    return Container(
      margin: EdgeInsets.only(
        left: index % crossAxisCount == 0 ? 10 : 0,
        right: index % crossAxisCount == crossAxisCount - 1 ? 10 : 0,
        bottom: 5,
      ),
      child: CardMusicListItem(
        showAdd: true,
        onAddPressed: () {
          addToList(context, item);
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, '${S.current.add} ${item.name}'));
        },
        title: item.name ?? '',
        onTap: () {
          addPlaylist(context, _items, index);
        },
        onCollectingPressed: () {
          showCollectionDialog(context, item);
        },
        showCollecting: true,
        imageUrl: item.al?.picUrl ?? "",
        description: item.ar?.map((e) => e.name).join(",") ?? "",
      ),
    );
  }

  Widget _buildListItem(int index) {
    var item = _items[index];
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: CardMusicListItem(
        title: item.name ?? '',
        showAdd: true,
        onAddPressed: () {
          addToList(context, item);
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, '${S.current.add} ${item.name}'));
        },
        onTap: () {
          addPlaylist(context, _items, index);
        },
        onCollectingPressed: () {
          showCollectionDialog(context, item);
        },
        showCollecting: true,
        imageUrl: item.al?.picUrl ?? "",
        description: item.ar?.map((e) => e.name).join(",") ?? "",
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
