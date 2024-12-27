import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/utils/DialogUtils.dart';

import 'AlbumDetailPage.dart';
import 'Api/HttpClient.dart';
import 'ArtistDetailPage.dart';
import 'PlayListDetailPage.dart';
import 'Player/MusicPlayerBloc.dart';
import 'Player/MusicPlayerState.dart';
import 'Player/PlayerController.dart';
import 'component/CardMusicListItem.dart';
import 'component/CustomPagination.dart';
import 'generated/l10n.dart';

class TabContent extends StatefulWidget {
  final String content;
  final String query;
  final int type;
  final bool isBig;

  const TabContent({
    super.key,
    required this.content,
    required this.query,
    required this.type,
    required this.isBig,
  });

  @override
  _TabContentState createState() => _TabContentState();
}

class _TabContentState extends State<TabContent>
    with AutomaticKeepAliveClientMixin<TabContent> {
  final ScrollController _scrollController = ScrollController();
  late final http = HTTP.getClient<RetrofitClient>();
  late final musicHttp = HTTP.getClient<MusicClient>();
  List<dynamic> dataList = []; // 通用数据列表
  int itemCount = 0;
  int page = 0;
  bool loaded = false;
  bool isLoadingMore = false; // 加载更多状态
  bool hasMoreData = true; // 是否有更多数据

  @override
  void initState() {
    super.initState();
    loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (MediaQuery.of(context).size.width > 600) {
          return; // 在大屏幕设备上禁用 _onScroll
        }

        loadMoreData();
      }
    });
  }

  // 加载数据
  void loadData() {
    http.cloudsearch(widget.query, 30, page, widget.type).then((value) {
      setState(() {
        loaded = true;
        isLoadingMore = false;

        if (value.result != null) {
          dataList = getDataList(value);
          itemCount = getItemCount(value);
          hasMoreData = dataList.length != itemCount; // 判断是否还有更多数据
        }
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
    http.cloudsearch(widget.query, 30, page, widget.type).then((value) {
      setState(() {
        isLoadingMore = false;

        if (value.result != null) {
          var newDataList = getDataList(value);
          dataList.addAll(newDataList);
          hasMoreData = dataList.length != itemCount;
        }
      });
    }).catchError((e) {
      setState(() {
        isLoadingMore = false;
      });
      print('Error loading more data: $e');
    });
  }

  // 根据类型获取对应的数据列表
  List<dynamic> getDataList(dynamic value) {
    if (widget.type == 1) return value.result?.songs ?? [];
    if (widget.type == 10) return value.result?.albums ?? [];
    if (widget.type == 100) return value.result?.artists ?? [];
    if (widget.type == 1000) return value.result?.playlists ?? [];
    return [];
  }

  // 根据类型获取对应的总数
  int getItemCount(dynamic value) {
    if (widget.type == 1) return value.result?.songCount ?? 0;
    if (widget.type == 10) return value.result?.albumCount ?? 0;
    if (widget.type == 100) return value.result?.artistCount ?? 0;
    if (widget.type == 1000) return value.result?.playlistCount ?? 0;
    return 0;
  }

  // 构建列表项
  Widget buildItem(int index) {
    if (index == dataList.length && !widget.isBig) {
      return _buildLoadingMore();
    }

    var item = dataList[index];

    if (widget.type == 1) {
      return CardMusicListItem(
        title: '${item.name}',
        imageUrl: '${item.al?.picUrl}',
        showAdd: true,
        onAddPressed: () {
          addToList(context, item);
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, '${S.current.add} ${item.name}'));
        },
        description:
            '${item.ar?.map((e) => e.name).join(' / ')} - ${item.al?.name}',
        onTap: () async => {
          ScaffoldMessenger.of(context).showSnackBar(
              getSnackBar(context, '${S.current.play} ${item.name}')),
          addSong(context, item),
        },
        onCollectingPressed: () => {showCollectionDialog(context, item)},
        showCollecting: true,
      );
    } else if (widget.type == 10) {
      return CardMusicListItem(
        title: '${item.name}',
        imageUrl: '${item.picUrl}',
        description: '${item.artist?.name}',
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
      );
    } else if (widget.type == 100) {
      return CardMusicListItem(
        title: '${item.name}',
        imageUrl: '${item.img1v1Url}',
        description: '${item.alias?.join(' / ')}',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArtistDetailPage(
                id: item.id ?? 0,
                top: 30,
                onBack: () => Navigator.pop(context),
              ),
            ),
          );
        },
      );
    } else if (widget.type == 1000) {
      return CardMusicListItem(
        title: '${item.name}',
        imageUrl: '${item.coverImgUrl}',
        description: '${item.trackCount} ${S.of(context).songs}',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayListDetailPage(
                id: item.id,
                isNet: true,
                top: 30,
                onBack: () => Navigator.pop(context),
              ),
            ),
          );
        },
      );
    }
    return SizedBox.shrink();
  }

  // 构建加载更多的 Widget
  Widget _buildLoadingMore() {
    if (!hasMoreData) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(S.of(context).no_more_data)),
      );
    } else if (isLoadingMore) {
      return const Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(child: Text("")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
        builder: (context, state) {
      if (dataList.isEmpty && loaded) {
        return Center(
          child: Text(S.of(context).no_more_data), // 通用空数据提示
        );
      }

      return LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 600;
          if (isWideScreen) {
            return Column(
              children: [
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: loaded
                        ? GridView.builder(
                            key: ValueKey<int>(page),
                            // 用页码区分不同状态，确保动画触发
                            controller: _scrollController,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (constraints.maxWidth / 250).floor(),
                              mainAxisExtent: 85,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: dataList.length + (widget.isBig ? 0 : 1),
                            itemBuilder: (context, index) => buildItem(index),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                ),
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
            );
          } else {
            if (!loaded) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                controller: _scrollController,
                itemCount: dataList.length + (widget.isBig ? 0 : 1),
                itemBuilder: (context, index) => buildItem(index),
              );
            }
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
