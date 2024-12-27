import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Player/PlayerController.dart';
import 'package:music_app/utils/DialogUtils.dart';

import 'Api/HttpClient.dart';
import 'Api/ResponseEntry/PlaylistDetailResult.dart' hide Ar, Al;
import 'Api/ResponseEntry/PlaylistSongsResult.dart';
import 'Api/ResponseEntry/Song.dart' as SingleSong;
import 'Database/AppDataBase.dart';
import 'Player/MusicPlayerBloc.dart';
import 'Player/MusicPlayerState.dart';
import 'Player/PlayerBar.dart';
import 'component/CardMusicListItem.dart';
import 'component/CustomPagination.dart';
import 'component/DetailTopBar.dart';
import 'component/ImageNet.dart';
import 'generated/l10n.dart';
import 'main.dart';

class PlayListDetailPage extends StatefulWidget {
  final int id; // 传递列表项索引
  final VoidCallback onBack; // 返回到列表的回调函数
  final double top;
  final bool isNet;

  const PlayListDetailPage(
      {this.top = 10,
      super.key,
      required this.id,
      required this.onBack,
      this.isNet = false});

  @override
  State<PlayListDetailPage> createState() => _PlaylistDetailPageState();
}

class _PlaylistDetailPageState extends State<PlayListDetailPage> {
  double _topBarHeight = 200; // 默认顶部栏高度
  final ScrollController _scrollController = ScrollController();
  final http = HTTP.getClient<RetrofitClient>();
  PlaylistDetailResult? playlistDetail;
  int page = 0;
  bool isLoadingMore = false;
  bool loaded = false;
  bool hasMoreData = false;
  List<Songs> dataList = [];
  int itemCount = 0;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    if (widget.isNet) {
      loadFirst();
      getPlayList();
    } else {
      loadFromDatabase();
    }

    _scrollController.addListener(_onScroll);
  }

  void loadFromDatabase() async {
    var query = database.select(database.playListDetailItems)
      ..where((tql) => tql.id.equals(widget.id));
    PlayListDetailItem? item = await query.getSingleOrNull();
    if (item != null) {
      setState(() {
        playlistDetail = PlaylistDetailResult(
          playlist: Playlist(
            name: item.title,
            description: item.description,
            coverImgUrl: item.imgUrl,
          ),
        );
      });
    }

    var query2 = database.select(database.playListItem)
      ..where((tql) => tql.listId.equals(widget.id));

    List<PlayListItemData> items = await query2.get();

    setState(() {
      dataList = items
          .map((e) => Songs(
                id: e.netId,
                name: e.title,
                ar: [Ar(name: e.description)],
                al: Al(picUrl: e.imgUrl),
              ))
          .toList();
      itemCount = items.length;
      loaded = true;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (MediaQuery.of(context).size.width > 600) {
      return; // 在大屏幕设备上禁用 _onScroll
    }

    // 检查是否需要加载更多
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isLoadingMore &&
        hasMoreData) {
      loadMoreData(); // 加载更多数据
    }

    final newHeight = (200 - _scrollController.offset).clamp(0.0, 200.0);
    if (newHeight != _topBarHeight) {
      setState(() {
        _topBarHeight = newHeight;
      });
    }
  }

  void loadFirst() {
    http.playlistDetail(widget.id.toString()).then((value) {
      setState(() {
        playlistDetail = value;
      });
    });

    http.playlistTrackAll(widget.id.toString(), 30, page).then((value) {
      setState(() {
        loaded = true; // 数据加载完成
        isLoadingMore = false;

        // 仅当数据加载完成时更新 dataList
        dataList = value.songs ?? [];
        itemCount = playlistDetail?.playlist?.trackCount ?? 0;
        hasMoreData = dataList.length != itemCount;
      });
    }).catchError((e) {
      setState(() {
        loaded = true;
        isLoadingMore = false;
      });
      print('Error loading data: $e');
    });
  }

  Future<void> _refresh() async {
    setState(() {
      page = 0;
      dataList.clear(); // 清空列表数据
      loaded = false;
      hasMoreData = true; // 重新允许加载更多
    });
    loadFirst(); // 重新加载第一页数据
  }

  // 加载数据
  void loadData() {
    // 如果已经在加载，直接返回
    if (!loaded) return;

    setState(() {
      loaded = false; // 设置加载中状态
    });

    loadFirst();
  }

  // 加载更多数据
  void loadMoreData() {
    if (isLoadingMore || !hasMoreData) return;

    setState(() {
      isLoadingMore = true;
    });
    page += 30;
    http.playlistTrackAll(widget.id.toString(), 30, page).then((value) {
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

  savePlayList() {
    if (playlistDetail != null) {
      database
          .into(database.playListDetailItems)
          .insert(PlayListDetailItemsCompanion.insert(
            title: '${playlistDetail?.playlist?.name}',
            description: '${playlistDetail?.playlist?.description}',
            imgUrl: '${playlistDetail?.playlist?.coverImgUrl}',
            netId: Value(widget.id),
            isNet: Value(widget.isNet),
          ));
    }

    getPlayList();
  }

  deletePlayList() {
    // 构建删除条件
    final condition = widget.isNet
        ? (database.playListDetailItems.netId.equals(widget.id))
        : (database.playListDetailItems.id.equals(widget.id));

    // 执行删除操作
    database.delete(database.playListDetailItems)
      ..where((tql) => condition)
      ..go().then((_) {
        setState(() {
          isFavorite = false; // 更新状态
        });
      });
  }

  getPlayList() async {
    // 根据条件构造查询
    final query = database.select(database.playListDetailItems)
      ..where((tbl) => widget.isNet
          ? tbl.netId.equals(widget.id) // 如果是网络 ID
          : tbl.id.equals(widget.id)); // 如果是本地 ID

    // 执行查询并获取结果
    final result = await query.get();

    // 根据查询结果更新状态
    if (result.isNotEmpty) {
      setState(() {
        isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
        builder: (context, state) {
      if (!loaded && playlistDetail == null) {
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
                  isFavorite: isFavorite,
                  showDetailButton: true,
                  showFavoriteButton: widget.isNet,
                  showDeleteButton: !widget.isNet,
                  onFavoriteButtonPressed: () {
                    if (!isFavorite) {
                      savePlayList();
                    } else {
                      deletePlayList();
                    }
                  },
                  onDeleteButtonPressed: () {
                    deletePlayList();
                    //返回上一页
                    widget.onBack();
                  },
                  height: _topBarHeight,
                  top: widget.top,
                  url: '${playlistDetail?.playlist?.coverImgUrl}',
                  title: '${playlistDetail?.playlist?.name}',
                  subtitle: '${playlistDetail?.playlist?.description}',
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
                              opacity: (1.0 - (_topBarHeight / 200.0))
                                  .clamp(0.0, 1.0),
                              duration: const Duration(milliseconds: 200),
                              child: Row(
                                children: [
                                  ImageNet(
                                    imageUrl:
                                        '${playlistDetail?.playlist?.coverImgUrl}',
                                    width: 45,
                                    height: 45,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${playlistDetail?.playlist?.name}',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
                    child: Column(
                      children: [
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: _refresh, // 调用下拉刷新的方法
                            child: !useGrid
                                ? CustomScrollView(
                                    controller: _scrollController,
                                    slivers: [
                                      SliverPadding(
                                        padding: EdgeInsets.only(
                                            top: _topBarHeight < 110 ? 65 : 5),
                                        sliver: _buildContent(
                                            useGrid, crossAxisCount),
                                      ),
                                      // 添加上拉加载的指示器
                                      SliverToBoxAdapter(
                                        child: isLoadingMore
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )
                                            : SizedBox.shrink(),
                                      ),
                                    ],
                                  )
                                : AnimatedSwitcher(
                                    duration: const Duration(
                                        milliseconds: 200), // 动画时长
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(1, 0), // 从右往左滑入
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    },
                                    child: loaded
                                        ? CustomScrollView(
                                            key: ValueKey<int>(
                                                page), // 使用页码作为唯一标识
                                            controller: _scrollController,
                                            slivers: [
                                              SliverPadding(
                                                padding: EdgeInsets.only(
                                                    top: _topBarHeight < 110
                                                        ? 65
                                                        : 5),
                                                sliver: _buildContent(
                                                    useGrid, crossAxisCount),
                                              ),
                                              // 添加上拉加载的指示器
                                              SliverToBoxAdapter(
                                                child: isLoadingMore
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 10),
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                      )
                                                    : SizedBox.shrink(),
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                  ),
                          ),
                        ),
                        // 添加分页组件
                        if (useGrid)
                          CustomPagination(
                            totalPages: (itemCount / 30).ceil(),
                            onPageChanged: (newPage) {
                              setState(() {
                                page = (newPage - 1) * 30; // 更新当前页码
                              });

                              // 重新加载数据
                              loadData();
                            },
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
    });
  }

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
          if (widget.isNet) {
            var song = SingleSong.Song(
              id: item.id,
              name: item.name,
              ar: [
                SingleSong.Ar(
                    name: item.ar?.map((e) => e.name).join(' / ') ?? "")
              ],
              al: SingleSong.Al(
                  picUrl: '${item.al?.picUrl}', name: '${item.al?.name}'),
            );
            showCollectionDialog(context, song);
          } else {
            //从收藏列表中删除
            database.delete(database.playListItem)
              ..where((t) => t.id.equals(item.id!))
              ..go().then((_) {
                setState(() {
                  dataList.removeAt(index);
                });
              });
          }
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
          if (widget.isNet) {
            var song = SingleSong.Song(
              id: item.id,
              name: item.name,
              ar: [
                SingleSong.Ar(
                    name: item.ar?.map((e) => e.name).join(' / ') ?? "")
              ],
              al: SingleSong.Al(
                  picUrl: '${item.al?.picUrl}', name: '${item.al?.name}'),
            );
            showCollectionDialog(context, song);
          } else {
            //从收藏列表中删除
            database.delete(database.playListItem)
              ..where((t) => t.id.equals(item.id!))
              ..go().then((_) {
                setState(() {
                  dataList.removeAt(index);
                });
              });
          }
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
