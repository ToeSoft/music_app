import 'package:flutter/material.dart';

import 'ImageNet.dart';

class DetailTopBar extends StatelessWidget {
  final double height;
  final double top;
  final int index;

  const DetailTopBar({
    required this.height,
    required this.index,
    required this.top,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // 动态调整高度和透明度的顶部栏
    return AnimatedOpacity(
      opacity: height / 220.0,
      duration: const Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        padding: EdgeInsets.only(
          left: top == 10 ? 50 : 30,
          top: top == 10 ? 0 : 30,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Align(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // 背景图片
                  ImageNet(
                    imageUrl: 'https://picsum.photos/300/300?random=$index',
                    width: top == 10 ? height * 0.8 : height * 0.65,
                    height: top == 10 ? height * 0.8 : height * 0.65,
                  ),
                  const SizedBox(width: 10),
                  if (110 <= height)
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Left $index',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              'Left $index',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
