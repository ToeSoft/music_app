import 'package:flutter/material.dart';

import 'ImageNet.dart';

class CardMusicListItem extends StatefulWidget {
  final String imageUrl; // 图片 URL
  final String description; // 描述文字
  final VoidCallback onFirstButtonPressed; // 第一个按钮的点击事件
  final VoidCallback onSecondButtonPressed; // 第二个按钮的点击事件
  final bool isGrid; // 是否显示为网格布局
  final VoidCallback onTap; // 点击事件

  const CardMusicListItem({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.onFirstButtonPressed,
    required this.onSecondButtonPressed,
    required this.onTap,
    required this.isGrid,
  });

  @override
  State<CardMusicListItem> createState() => _CardMusicListItemState();
}

class _CardMusicListItemState extends State<CardMusicListItem> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95; // 缩小效果
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0; // 恢复大小
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0; // 取消时恢复大小
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        widget.onTap();
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Card(
          color: Theme.of(context).cardColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start, // 从顶部对齐
              children: [
                // 左侧图片
                ImageNet(imageUrl: widget.imageUrl),
                const SizedBox(width: 12),
                // 中间描述文字固定在左上角
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // 高度由内容决定
                    crossAxisAlignment: CrossAxisAlignment.start, // 向左对齐
                    children: [
                      Text(
                        widget.description,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.description,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (!widget.isGrid)
                  Row(
                    children: [
                      // 第一个按钮
                      TextButton(
                        onPressed: widget.onFirstButtonPressed,
                        child: const Text('按钮1'),
                      ),
                      const SizedBox(width: 8),
                      // 第二个按钮
                      TextButton(
                        onPressed: widget.onSecondButtonPressed,
                        child: const Text('按钮2'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
