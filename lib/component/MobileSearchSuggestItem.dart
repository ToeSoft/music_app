import 'package:flutter/material.dart';

class MobileSearchSuggestItem extends StatefulWidget {
  final String title;
  final String description; // 描述文字
  final VoidCallback onTap; // 点击事件
  final int type; //1 歌曲 2 专辑 3 歌手 4 消费

  const MobileSearchSuggestItem({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.type,
  });

  @override
  State<MobileSearchSuggestItem> createState() =>
      _MobileSearchSuggestItemState();
}

class _MobileSearchSuggestItemState extends State<MobileSearchSuggestItem> {
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
        child: Padding(
          // 在 Card 外部添加 Padding
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          // 左右添加 margin
          child: Card(
            color: Theme.of(context).colorScheme.onPrimary,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // 从顶部对齐
                children: [
                  Icon(
                    widget.type == 1
                        ? Icons.music_note
                        : widget.type == 2
                            ? Icons.album
                            : widget.type == 3
                                ? Icons.person
                                : Icons.playlist_play,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 40,
                  ),
                  const SizedBox(width: 5),
                  Flexible(
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
                        if (widget.description.isNotEmpty) // 描述文字不为空时显示
                          Text(
                            widget.description,
                            style: Theme.of(context).textTheme.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
