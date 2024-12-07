import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/CustomDialogContent.dart';
import '../main.dart';
import 'AlbumInfo.dart';
import 'ControlButtons.dart';
import 'MusicPlayerBloc.dart';
import 'MusicPlayerEvent.dart';
import 'MusicPlayerState.dart';
import 'ProgressBar.dart';
import 'RightMenuButton.dart';

class MusicPlayerBar extends StatelessWidget {
  const MusicPlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primaryContainer;
    final iconColor = Theme.of(context).iconTheme.color ?? Colors.white;
    final textColor =
        Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white;

    void toBigPlayerPage() {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const BigPlayerPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.fastOutSlowIn;

            var slideTween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(slideTween);

            var fadeTween = Tween<double>(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: curve));
            var fadeAnimation = animation.drive(fadeTween);

            var scaleTween = Tween<double>(begin: 0.9, end: 1.0)
                .chain(CurveTween(curve: curve));
            var scaleAnimation = animation.drive(scaleTween);

            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: child,
                ),
              ),
            );
          },
        ),
      );
    }

    return BlocConsumer<MusicPlayerBloc, MusicPlayerState>(
      listener: (context, state) async {
        if (state.showPlaylistDialog) {
          final result = await showGeneralDialog<bool>(
            context: context,
            barrierColor: Colors.black.withOpacity(0.3),
            // 半透明背景
            barrierDismissible: true,
            // 点击背景可关闭
            barrierLabel: '关闭',
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return Stack(
                children: [
                  Positioned(
                    bottom: 20, // 距离屏幕底部的位置
                    right: 20, // 距离屏幕右侧的位置
                    child: Material(
                      color: Colors.transparent,
                      child: CustomDialogContent(
                        onClose: () {
                          Navigator.of(context).pop(true);
                          context
                              .read<MusicPlayerBloc>()
                              .add(TogglePlaylistEvent());
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
            transitionBuilder: (context, animation, secondaryAnimation, child) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(1.0, 0.0), // 从右下角进入
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ));

              return SlideTransition(
                position: offsetAnimation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
          );

          // 当弹窗关闭时触发回调逻辑
          if (result == null) {
            context.read<MusicPlayerBloc>().add(TogglePlaylistEvent());
          }
        }
      },
      builder: (context, state) {
        return Container(
          height: 80,
          color: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;

                    return Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              toBigPlayerPage();
                            },
                            child: AlbumInfo(
                              imageUrl: 'https://picsum.photos/200/200',
                              songName: '歌曲名称',
                              artistName: '歌手名称',
                              textColor: textColor,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: width > 650
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ControlButtons(
                                        isShuffleActive: state.isShuffleActive,
                                        isPlaying: state.isPlaying,
                                        loopMode: state.loopMode,
                                        shuffleActiveColor:
                                            Theme.of(context).primaryColor,
                                        disableColor:
                                            Theme.of(context).disabledColor,
                                        iconColor: iconColor,
                                        onShufflePressed: () {
                                          context
                                              .read<MusicPlayerBloc>()
                                              .add(ToggleShuffleEvent());
                                        },
                                        onPlayPausePressed: () {
                                          context
                                              .read<MusicPlayerBloc>()
                                              .add(TogglePlayPauseEvent());
                                        },
                                        onLoopPressed: () {
                                          context
                                              .read<MusicPlayerBloc>()
                                              .add(ChangeLoopModeEvent());
                                        },
                                        onPreviousPressed: () {
                                          context
                                              .read<MusicPlayerBloc>()
                                              .add(PreviousTrackEvent());
                                        },
                                        onNextPressed: () {
                                          context
                                              .read<MusicPlayerBloc>()
                                              .add(NextTrackEvent());
                                        },
                                      ),
                                      ProgressBar(
                                        gradientColors: [
                                          Theme.of(context).colorScheme.primary,
                                          Theme.of(context).colorScheme.primary
                                        ],
                                        currentPosition: state.currentPosition,
                                        totalDuration: state.totalDuration,
                                        textColor: textColor,
                                        onChanged: (value) {
                                          context
                                              .read<MusicPlayerBloc>()
                                              .add(UpdateProgressEvent(value));
                                        },
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: RightMenuButton(
                            isPlaying: state.isPlaying,
                            onPlayPausePressed: () {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(TogglePlayPauseEvent());
                            },
                            onPlaylistPressed: () {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(TogglePlaylistEvent());
                            },
                            onBigPlayerPressed: () {
                              toBigPlayerPage();
                            },
                            iconColor: Theme.of(context).iconTheme.color,
                            showPlayButton: width <= 650,
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
