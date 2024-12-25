import 'package:flutter/material.dart';

import '../utils/DialogUtils.dart';
import 'ImageNet.dart';

class DetailTopBar extends StatelessWidget {
  final double height;
  final double top;
  final String url;
  final String title;
  final String subtitle;
  final bool showDetailButton;
  final bool showFavoriteButton;
  final bool showDeleteButton;
  final VoidCallback? onDetailButtonPressed;
  final VoidCallback? onFavoriteButtonPressed;
  final VoidCallback? onDeleteButtonPressed;
  final bool isFavorite;

  const DetailTopBar({
    required this.height,
    required this.top,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    this.showDetailButton = false,
    this.showFavoriteButton = false,
    this.showDeleteButton = false,
    this.onDetailButtonPressed,
    this.onFavoriteButtonPressed,
    this.onDeleteButtonPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽度
    double screenWidth = MediaQuery.of(context).size.width;

    // 动态调整宽度
    double dynamicWidth = screenWidth > 600 ? screenWidth * 0.2 : 200;

    return AnimatedOpacity(
      opacity: height / 220.0,
      duration: const Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        padding: EdgeInsets.only(
          left: top == 10 ? 50 : 40,
          top: top == 10 ? 0 : 30,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageNet(
              imageUrl: url,
              width: top == 10 ? height * 0.8 : height * 0.65,
              height: top == 10 ? height * 0.8 : height * 0.65,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 120,
                      width: dynamicWidth, // 使用动态宽度
                      child: Text(
                        subtitle,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 收藏按钮
                  if (showFavoriteButton)
                    IconButton(
                      icon: isFavorite
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: onFavoriteButtonPressed,
                    ),
                  if (showFavoriteButton) const SizedBox(height: 10),
                  // 详情按钮
                  if (showDetailButton)
                    IconButton(
                      icon: const Icon(Icons.info_outline),
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: onDetailButtonPressed ??
                          () => showDetailDialog(context, url, title, subtitle),
                    ),
                  // 删除按钮
                  if (showDeleteButton)
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: onDeleteButtonPressed,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
