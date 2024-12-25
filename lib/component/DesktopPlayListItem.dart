import 'package:flutter/material.dart';
import 'package:music_app/component/ImageNet.dart';

class DesktopPlaylistItem extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final String title;
  final String description;

  const DesktopPlaylistItem({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 点击时调用传入的回调函数
      child: Stack(
        children: [
          // 背景图片
          ImageNet(
            imageUrl: imageUrl,
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
                  // 左边的文本（省略号显示）
                  Flexible(
                    flex: 2,
                    child: Text(
                      title,
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis, // 超出时显示省略号
                      maxLines: 1, // 限制为单行显示
                    ),
                  ),
                  const SizedBox(width: 8), // 添加间距
                  // 右边的文本（隐藏）
                  Flexible(
                    flex: 1,
                    child: Text(
                      description,
                      style: Theme.of(context).primaryTextTheme.bodyMedium,
                      overflow: TextOverflow.clip, // 超出部分直接裁剪
                      maxLines: 1, // 限制为单行显示
                      textAlign: TextAlign.right, // 右对齐
                    ),
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
