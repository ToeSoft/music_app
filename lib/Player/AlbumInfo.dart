import 'package:flutter/material.dart';

import '../component/ImageNet.dart';

class AlbumInfo extends StatelessWidget {
  final String imageUrl;
  final String songName;
  final String artistName;
  final Color textColor;

  const AlbumInfo({
    required this.imageUrl,
    required this.songName,
    required this.artistName,
    required this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ImageNet(
            imageUrl: imageUrl,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songName,
                style: TextStyle(color: textColor, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                artistName,
                style:
                    TextStyle(color: textColor.withOpacity(0.7), fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
