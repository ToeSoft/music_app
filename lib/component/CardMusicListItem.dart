import 'package:flutter/material.dart';

import 'ImageNet.dart';

class CardMusicListItem extends StatefulWidget {
  final String imageUrl; // 图片 URL
  final String title;
  final String description; // 描述文字
  final VoidCallback? onCollectingPressed; // 第一个按钮的点击事件
  final VoidCallback? onRemovePressed;
  final VoidCallback? onAddPressed;
  final bool showCollecting; // 是否显示第一个按钮
  final bool showRemove;
  final bool showAdd;
  final VoidCallback onTap; // 点击事件

  const CardMusicListItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.onCollectingPressed,
    this.onRemovePressed,
    this.onAddPressed,
    required this.onTap,
    this.showCollecting = false,
    this.showRemove = false,
    this.showAdd = false,
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
                const SizedBox(width: 5),
                // 中间描述文字固定在左上角
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // 高度由内容决定
                    crossAxisAlignment: CrossAxisAlignment.start, // 向左对齐
                    children: [
                      Text(
                        widget.title,
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
                Column(
                  children: [
                    if (widget.showCollecting)
                      SizedBox(
                          width: 35,
                          height: 30,
                          child: IconButton(
                            color: Theme.of(context).colorScheme.primary,
                            icon: const Icon(Icons.favorite),
                            iconSize: 20,
                            onPressed: widget.onCollectingPressed,
                          )),
                    if (widget.showRemove)
                      SizedBox(
                          width: 35,
                          height: 30,
                          child: IconButton(
                            color: Theme.of(context).colorScheme.primary,
                            icon: const Icon(Icons.delete_sweep),
                            iconSize: 20,
                            onPressed: widget.onRemovePressed,
                          )),
                    if (widget.showAdd)
                      SizedBox(
                          width: 35,
                          height: 30,
                          child: IconButton(
                            color: Theme.of(context).colorScheme.primary,
                            icon: const Icon(Icons.add),
                            iconSize: 20,
                            onPressed: widget.onAddPressed,
                          )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
