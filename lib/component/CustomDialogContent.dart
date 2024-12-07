import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/Player/MusicPlayerBloc.dart';
import 'package:music_app/Player/MusicPlayerState.dart';

import '../generated/l10n.dart';
import 'CardMusicListItem.dart';

class CustomDialogContent extends StatelessWidget {
  final VoidCallback onClose;

  const CustomDialogContent({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
      builder: (context, state) {
        final queue = state.queue ?? []; // 确保 queue 不为 null

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
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
                            onTap: () {
                              final snackBar = SnackBar(
                                content: Text('播放 $index'),
                                backgroundColor: Colors.black54,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            isGrid: false,
                            imageUrl:
                                'https://picsum.photos/300/300?random=$index',
                            description: "description",
                            onFirstButtonPressed: () => {},
                            onSecondButtonPressed: () => {},
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
