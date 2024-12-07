import 'package:flutter/material.dart';
import 'package:music_app/component/ImageNet.dart';

class DesktopPlaylistItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;

  const DesktopPlaylistItem({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 点击时调用传入的回调函数
      child: Stack(
        children: [
          // 背景图片
          ImageNet(
            imageUrl: 'https://picsum.photos/300/300?random=$index',
            width: double.infinity, // 使图片填充整个容器
            height: double.infinity, // 保持高度自适应
          ),
          // 底部视图
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6), // 半透明背景
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ), // 底部视图的圆角
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 左边的文本
                  Text(
                    'Left $index',
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                  ),
                  // 右边的文本
                  Text(
                    'Right $index',
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
