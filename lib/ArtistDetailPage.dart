import 'package:flutter/material.dart';
import 'package:music_app/utils/DialogUtils.dart';

import 'AlbumDetailPage.dart';
import 'Api/HttpClient.dart';
import 'Api/ResponseEntry/ArtistAlbumsResult.dart';
import 'Api/ResponseEntry/ArtistDescResult.dart';
import 'Api/ResponseEntry/ArtistDetailResult.dart';
import 'Api/ResponseEntry/Song.dart' as SingleSong;
import 'Player/PlayerBar.dart';
import 'Player/PlayerController.dart';
import 'component/CardMusicListItem.dart';
import 'component/CustomPagination.dart';
import 'component/DetailTopBar.dart';
import 'component/ImageNet.dart';
import 'generated/l10n.dart';

class ArtistDetailPage extends StatefulWidget {
  final int id; // 传递列表项索引
  final VoidCallback onBack; // 返回到列表的回调函数
  final double top;

  const ArtistDetailPage({
    this.top = 10,
    super.key,
    required this.id,
    required this.onBack,
  });

  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  double _topBarHeight = 200; // 默认顶部栏高度
  final http = HTTP.getClient<RetrofitClient>();
  ArtistDescResult? artistDescResult;
  ArtistDetailResult? artistDetailResult;
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> _refresh() async {
    var descResult = await http.artistDesc(widget.id.toString());
    var detailResult = await http.artistDetail(widget.id.toString());

    setState(() {
      artistDescResult = descResult;
      artistDetailResult = detailResult;
      loaded = true;
    });
  }

  Future<void> load() async {
    await _refresh();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded || artistDescResult == null) {
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
                showDetailButton: false,
                showFavoriteButton: false,
                height: _topBarHeight,
                top: widget.top,
                url: '${artistDetailResult?.data?.artist?.avatar}',
                title: '${artistDetailResult?.data?.artist?.name}',
                subtitle:
                    '${artistDetailResult?.data?.artist?.alias?.join(",")}',
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
                                  imageUrl:
                                      '${artistDetailResult?.data?.artist?.avatar}',
                                  width: 45,
                                  height: 45,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${artistDetailResult?.data?.artist?.name}',
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
                return DefaultTabController(
                  length: 2, // Tab 项的数量
                  child: Scaffold(
                    body: Column(
                      children: [
                        TabBar(
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: S.current.songs),
                            Tab(text: S.current.album),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SongsView(id: widget.id),
                              AlbumView(id: widget.id),
                            ],
                          ),
                        ),
                      ],
                    ),
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
}

class SongsView extends StatefulWidget {
  final int id;

  const SongsView({Key? key, required this.id}) : super(key: key);

  @override
  _SongsViewState createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView>
    with AutomaticKeepAliveClientMixin<SongsView> {
  final ScrollController _scrollController = ScrollController();
  final http = HTTP.getClient<RetrofitClient>();

  List<dynamic> dataList = []; // 通用数据列表
  int itemCount = 0;
  int page = 0;
  bool loaded = false;
  bool isLoadingMore = false; // 加载更多状态
  bool hasMoreData = true; // 是否有更多数据

  String orderType = "hot";

  @override
  void initState() {
    loadData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

  // 加载数据
  void loadData() {
    // hot ,time 按照热门或者时间排序
    http.artistSongs(widget.id.toString(), orderType, 30, page).then((value) {
      setState(() {
        loaded = true;
        isLoadingMore = false;

        dataList = value.songs ?? [];
        itemCount = value.total ?? 0;
        hasMoreData = dataList.length != itemCount; // 判断是否还有更多数据
      });
    }).catchError((e) {
      setState(() {
        loaded = true;
        isLoadingMore = false;
      });
      print('Error loading data: $e');
    });
  }

  // 加载更多数据
  void loadMoreData() {
    if (isLoadingMore || !hasMoreData) return;

    setState(() {
      isLoadingMore = true;
    });

    page += 30;
    http.artistSongs(widget.id.toString(), orderType, 30, page).then((value) {
      setState(() {
        isLoadingMore = false;

        dataList.addAll(value.songs ?? []);
        hasMoreData = dataList.length != itemCount; // 判断是否还有更多数据
      });
    }).catchError((e) {
      setState(() {
        isLoadingMore = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool useGrid = MediaQuery.of(context).size.width > 600;
    int crossAxisCount =
        useGrid ? (MediaQuery.of(context).size.width / 250).floor() : 1;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // 使用 Expanded 包裹 CustomScrollView
          !loaded
              ? Expanded(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : Expanded(
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      _buildContent(useGrid, crossAxisCount),
                      if (isLoadingMore)
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
          // 分页控件
          if (useGrid)
            CustomPagination(
              totalPages: (itemCount / 30).ceil(),
              onPageChanged: (page) {
                setState(() {
                  loaded = false;
                });

                // 更新当前页码并重新加载数据
                this.page = (page - 1) * 30;
                loadData();
              },
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildGridItem(int index, int crossAxisCount) {
    var item = dataList[index];
    return Container(
      margin: EdgeInsets.only(
        left: index % crossAxisCount == 0 ? 10 : 0,
        right: index % crossAxisCount == crossAxisCount - 1 ? 10 : 0,
        bottom: 5,
      ),
      child: CardMusicListItem(
        title: item.name ?? '',
        showAdd: true,
        onAddPressed: () {
          addToList(context, item);
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, '${S.current.add} ${item.name}'));
        },
        onTap: () {
          addPlaylist(context, dataList, index);
        },
        onCollectingPressed: () {
          var song = SingleSong.Song(
            id: item.id,
            name: item.name,
            ar: [
              SingleSong.Ar(name: item.ar?.map((e) => e.name).join(' / ') ?? "")
            ],
            al: SingleSong.Al(
                picUrl: '${item.al?.picUrl}', name: '${item.al?.name}'),
          );
          showCollectionDialog(context, song);
        },
        showCollecting: true,
        imageUrl: item.al?.picUrl ?? "",
        description: item.ar?.map((e) => e.name).join(",") ?? "",
      ),
    );
  }

  Widget _buildListItem(int index) {
    var item = dataList[index];
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: CardMusicListItem(
        showAdd: true,
        onAddPressed: () {
          addToList(context, item);
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, '${S.current.add} ${item.name}'));
        },
        title: item.name ?? '',
        onTap: () {
          addPlaylist(context, dataList, index);
        },
        onCollectingPressed: () {
          var song = SingleSong.Song(
            id: item.id,
            name: item.name,
            ar: [
              SingleSong.Ar(name: item.ar?.map((e) => e.name).join(' / ') ?? "")
            ],
            al: SingleSong.Al(
                picUrl: '${item.al?.picUrl}', name: '${item.al?.name}'),
          );
          showCollectionDialog(context, song);
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
              childCount: dataList.length,
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
              childCount: dataList.length,
            ),
          );
  }
}

class AlbumView extends StatefulWidget {
  final int id;

  const AlbumView({Key? key, required this.id}) : super(key: key);

  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView>
    with AutomaticKeepAliveClientMixin<AlbumView> {
  final ScrollController _scrollController = ScrollController();
  final http = HTTP.getClient<RetrofitClient>();

  List<HotAlbums> dataList = []; // 通用数据列表
  int itemCount = 0;
  int page = 0;
  bool loaded = false;
  bool isLoadingMore = false; // 加载更多状态
  bool hasMoreData = true; // 是否有更多数据

  @override
  void initState() {
    loadData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

  // 加载数据
  void loadData() {
    http.artistAlbum(widget.id.toString(), 30, page).then((value) {
      setState(() {
        loaded = true;
        isLoadingMore = false;

        dataList = value.hotAlbums ?? [];
        itemCount = dataList.length;
        hasMoreData = dataList.length != itemCount; // 判断是否还有更多数据
      });
    }).catchError((e) {
      setState(() {
        loaded = true;
        isLoadingMore = false;
      });
      print('Error loading data: $e');
    });
  }

  // 加载更多数据
  void loadMoreData() {
    if (isLoadingMore || !hasMoreData) return;

    setState(() {
      isLoadingMore = true;
    });

    page += 30;
    http.artistAlbum(widget.id.toString(), 30, page).then((value) {
      setState(() {
        isLoadingMore = false;

        dataList.addAll(value.hotAlbums ?? []);
        hasMoreData = dataList.length != itemCount; // 判断是否还有更多数据
      });
    }).catchError((e) {
      setState(() {
        isLoadingMore = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool useGrid = MediaQuery.of(context).size.width > 600;
    int crossAxisCount =
        useGrid ? (MediaQuery.of(context).size.width / 250).floor() : 1;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // 使用 Expanded 包裹 CustomScrollView
          !loaded
              ? Expanded(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
              : Expanded(
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      _buildContent(useGrid, crossAxisCount),
                      if (isLoadingMore)
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
          // 分页控件
          if (useGrid)
            CustomPagination(
              totalPages: (itemCount / 30).ceil(),
              onPageChanged: (page) {
                setState(() {
                  loaded = false;
                });

                // 更新当前页码并重新加载数据
                this.page = (page - 1) * 30;
                loadData();
              },
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildGridItem(int index, int crossAxisCount) {
    var item = dataList[index];
    return Container(
      margin: EdgeInsets.only(
        left: index % crossAxisCount == 0 ? 10 : 0,
        right: index % crossAxisCount == crossAxisCount - 1 ? 10 : 0,
        bottom: 5,
      ),
      child: CardMusicListItem(
        title: item.name ?? '',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetailPage(
                top: 30,
                id: item.id ?? 0,
                onBack: () => Navigator.pop(context),
              ),
            ),
          );
        },
        imageUrl: item.picUrl ?? "",
        description: item.artists?.map((e) => e.name).join(",") ?? "",
        showCollecting: false,
      ),
    );
  }

  Widget _buildListItem(int index) {
    var item = dataList[index];
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: CardMusicListItem(
        title: item.name ?? '',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetailPage(
                top: 30,
                id: item.id ?? 0,
                onBack: () => Navigator.pop(context),
              ),
            ),
          );
        },
        showCollecting: false,
        imageUrl: item.picUrl ?? "",
        description: item.artists?.map((e) => e.name).join(",") ?? "",
      ),
    );
  }

  Widget _buildContent(bool useGrid, int crossAxisCount) {
    return useGrid
        ? SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildGridItem(index, crossAxisCount),
              childCount: dataList.length,
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
              childCount: dataList.length,
            ),
          );
  }
}
