import 'package:flutter/material.dart';
import 'package:music_app/component/ImageNet.dart';

class PlaylistItem extends StatelessWidget {
  final int index;
  final VoidCallback onTap;

  const PlaylistItem({
    super.key,
    required this.index,
    required this.onTap,
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
            ImageNet(
              imageUrl: 'https://picsum.photos/300/300?random=$index',
              height: imageSize,
              width: imageSize,
            ),
            const SizedBox(width: 16), // 图片和文字间的间距
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 内容向左对齐
                mainAxisSize: MainAxisSize.min, // 避免垂直方向拉伸
                children: [
                  Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.titleLarge, // 主标题样式
                  ),
                  const SizedBox(height: 4), // 标题和副标题间距
                  Text(
                    'Subtext $index', // 副标题
                    style: Theme.of(context).textTheme.titleSmall, // 副标题样式
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
