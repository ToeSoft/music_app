import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/PlaylistDialogContent.dart';
import '../main.dart';
import 'AlbumInfo.dart';
import 'ControlButtons.dart';
import 'MusicPlayerBloc.dart';
import 'MusicPlayerState.dart';
import 'PlayerController.dart';
import 'ProgressBar.dart';
import 'RightMenuButton.dart';
final player = AudioPlayer();
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
        // 判断当前页面是否为弹窗页面，如果是，则弹出弹窗
        if (state.showPlaylistDialog) {
          // 判断当前页面是顶部页面
          if (ModalRoute.of(context)?.isCurrent == true) {
            final result = await showGeneralDialog<bool>(
              context: context,
              barrierColor: Colors.black.withOpacity(0.3),
              barrierDismissible: true,
              barrierLabel: '关闭',
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (context, animation, secondaryAnimation) {
                return Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Material(
                        color: Colors.transparent,
                        child: PlaylistDialogContent(
                          onClose: () {
                            Navigator.of(context).pop(true);
                            togglePlaylistDialog(context);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
              transitionBuilder:
                  (context, animation, secondaryAnimation, child) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
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

            if (result == null) {
              togglePlaylistDialog(context);
            }
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
                                          toggleShuffle(context);
                                        },
                                        onPlayPausePressed: () {
                                          togglePlayPause(context);
                                        },
                                        onLoopPressed: () {
                                          changeLoopMode(context);
                                        },
                                        onPreviousPressed: () {
                                          previousTrack(context);
                                        },
                                        onNextPressed: () {
                                          nextTrack(context);
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
                                          updateProgress(context, value);
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
                              togglePlayPause(context);
                            },
                            onPlaylistPressed: () {
                              togglePlaylistDialog(context);
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
