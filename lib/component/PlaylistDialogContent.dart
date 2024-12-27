import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Player/MusicPlayerBloc.dart';
import 'package:music_app/Player/MusicPlayerState.dart';

import '../Player/PlayerController.dart';
import '../generated/l10n.dart';
import '../utils/DialogUtils.dart';
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
                            showRemove: true,
                            onRemovePressed: () {
                              removeSong(context, index);
                            },
                            title: "${queue[index].name}",
                            onTap: () async {
                              play(context, queue[index]);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  getSnackBar(context,
                                      '${S.current.play} ${queue[index].name}'));
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
