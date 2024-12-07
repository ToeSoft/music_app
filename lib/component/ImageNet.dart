import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNet extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final double radius;

  const ImageNet({
    this.radius = 8.0, // 默认圆角
    this.height = 60.0, // 默认高度
    this.width = 60.0,  // 默认宽度
    required this.imageUrl,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image),
        ),
      ),
    );
  }
}
