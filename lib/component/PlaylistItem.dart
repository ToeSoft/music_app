import 'package:flutter/material.dart';
import 'package:music_app/component/ImageNet.dart';

class PlaylistItem extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final String title;
  final String description;

  const PlaylistItem({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    const double imageSize = 60.0; // 正方形边长

    return InkWell(
      onTap: onTap, // 点击事件
      borderRadius: BorderRadius.circular(8), // 点击时的圆角效果
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          children: [
            // 图片组件
            ImageNet(
              imageUrl: imageUrl,
              height: imageSize,
              width: imageSize,
            ),
            const SizedBox(width: 16), // 图片和文字间的间距
            // 文本内容区域
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 内容向左对齐
                mainAxisSize: MainAxisSize.min, // 避免垂直方向拉伸
                children: [
                  // 主标题（带省略号）
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge, // 主标题样式
                    maxLines: 1, // 限制为单行显示
                    overflow: TextOverflow.ellipsis, // 超出部分显示省略号
                  ),
                  const SizedBox(height: 4), // 标题和副标题间距
                  // 副标题（隐藏超长内容）
                  Text(
                    description,
                    style: Theme.of(context).textTheme.titleSmall, // 副标题样式
                    maxLines: 1, // 限制为单行显示
                    overflow: TextOverflow.ellipsis, // 超出部分显示省略号
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}