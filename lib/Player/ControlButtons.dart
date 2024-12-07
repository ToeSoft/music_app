import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final bool isShuffleActive;
  final bool isPlaying;
  final int loopMode;
  final Color shuffleActiveColor;
  final Color disableColor;
  final Color iconColor;
  final VoidCallback onShufflePressed;
  final VoidCallback onPreviousPressed;
  final VoidCallback onPlayPausePressed;
  final VoidCallback onNextPressed;
  final VoidCallback onLoopPressed;
  final bool isBig;

  const ControlButtons({
    required this.isShuffleActive,
    required this.isPlaying,
    required this.loopMode,
    required this.shuffleActiveColor,
    required this.disableColor,
    required this.iconColor,
    required this.onShufflePressed,
    required this.onPreviousPressed,
    required this.onPlayPausePressed,
    required this.onNextPressed,
    required this.onLoopPressed,
    this.isBig = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: isBig ? 25 : 27,
          icon: Icon(
            Icons.shuffle,
            color: isShuffleActive ? shuffleActiveColor : disableColor,
          ),
          onPressed: onShufflePressed,
        ),
        IconButton(
          iconSize: isBig ? 45 : 27,
          icon: Icon(Icons.skip_previous, color: iconColor),
          onPressed: onPreviousPressed,
        ),
        IconButton(
          iconSize: isBig ? 55 : 27,
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
              color: iconColor),
          onPressed: onPlayPausePressed,
        ),
        IconButton(
          iconSize: isBig ? 45 : 27,
          icon: Icon(Icons.skip_next, color: iconColor),
          onPressed: onNextPressed,
        ),
        IconButton(
          iconSize: isBig ? 25 : 27,
          icon: Icon(
            loopMode == 0
                ? Icons.repeat
                : loopMode == 1
                    ? Icons.repeat
                    : Icons.repeat_one,
            color: loopMode == 0 ? disableColor : shuffleActiveColor,
          ),
          onPressed: onLoopPressed,
        ),
      ],
    );
  }
}
