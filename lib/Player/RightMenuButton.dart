import 'package:flutter/material.dart';

class RightMenuButton extends StatelessWidget {
  final bool isPlaying;
  final bool showPlayButton;
  final VoidCallback onPlayPausePressed;
  final VoidCallback onPlaylistPressed;
  final VoidCallback onBigPlayerPressed;
  final Color? iconColor;

  const RightMenuButton({
    super.key,
    required this.isPlaying,
    required this.showPlayButton,
    required this.onPlayPausePressed,
    required this.onPlaylistPressed,
    required this.onBigPlayerPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showPlayButton)
          IconButton(
            iconSize: 35,
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: iconColor ?? Theme.of(context).iconTheme.color,
            ),
            onPressed: onPlayPausePressed,
          ),
        if (!showPlayButton)
          IconButton(
            iconSize: 35,
            icon: Icon(
              Icons.graphic_eq,
              color: iconColor ?? Theme.of(context).iconTheme.color,
            ),
            onPressed: onBigPlayerPressed,
          ),
        IconButton(
          icon: Icon(
            Icons.playlist_play,
            color: iconColor ?? Theme.of(context).iconTheme.color,
          ),
          iconSize: 35,
          onPressed: onPlaylistPressed,
        ),
      ],
    );
  }
}
