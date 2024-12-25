import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Api/HttpClient.dart';
import 'package:music_app/Api/RequestEntry/MusicRequestParams.dart';
import 'package:music_app/Player/MusicPlayerBloc.dart';
import 'package:music_app/Player/MusicPlayerState.dart';

import '../Player/PlayerBar.dart';
import '../generated/l10n.dart';
import 'CardMusicListItem.dart';

class PlaylistDialogContent extends StatelessWidget {
  final VoidCallback onClose;

  const PlaylistDialogContent({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
      builder: (context, state) {
        final queue = state.queue; // 确保 queue 不为 null

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          width: 400,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 40, // 最大高度限制
            maxWidth: MediaQuery.of(context).size.width - 40, // 最大宽度限制
          ),
          child: Column(
            children: [
              // 标题
              Text(
                S.current.playlist,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // 播放列表
              queue.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: queue.length,
                        itemBuilder: (context, index) {
                          return CardMusicListItem(
                            title: "${queue[index].name}",
                            onTap: () async {
                              final http = HTTP.getClient<MusicClient>();
                              var result = await http.getMusic(
                                  getMusicParams("${queue[index].id}"));
                              print("${result.urlInfo?.url}");

                              player.pause();

                              player.play(UrlSource(result.urlInfo?.url ?? ""));

                              final snackBar = SnackBar(
                                content: Text('播放 ${queue[index].name}'),
                                backgroundColor: Colors.black54,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            imageUrl: "${queue[index].al?.picUrl}",
                            description:
                                "${queue[index].ar?.map((e) => e.name).join(",")}",
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text(
                          S.current.playlist_empty,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ),

              const SizedBox(height: 16),

              // 关闭按钮固定在底部
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onClose,
                  child: Text(S.current.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
