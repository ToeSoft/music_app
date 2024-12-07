import 'package:flutter/material.dart';

import '../../utils/TextUtils.dart';

class ProgressBar extends StatelessWidget {
  final double currentPosition;
  final double totalDuration;
  final Color textColor;
  final ValueChanged<double> onChanged;
  final List<Color> gradientColors; // 接收渐变颜色数组
  final bool isBig;

  const ProgressBar({
    required this.currentPosition,
    required this.totalDuration,
    required this.textColor,
    required this.onChanged,
    required this.gradientColors,
    this.isBig = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formatDuration(currentPosition),
          style: TextStyle(color: textColor, fontSize: 12),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * (isBig ? 0.77 : 0.55),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape:
                      GradientRoundedTrackShape(gradientColors: gradientColors),
                  thumbShape: SliderComponentShape.noThumb,
                  trackHeight: 5,
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 6),
                  inactiveTrackColor: Colors.black12,
                ),
                child: Slider(
                  value: currentPosition,
                  min: 0,
                  max: totalDuration,
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
        ),
        Text(
          formatDuration(totalDuration),
          style: TextStyle(color: textColor, fontSize: 12),
        ),
      ],
    );
  }
}

/// 自定义轨道样式，左右圆角轨道
class GradientRoundedTrackShape extends RoundedRectSliderTrackShape {
  const GradientRoundedTrackShape({
    required this.gradientColors,
  });

  final List<Color> gradientColors; // 接收渐变颜色数组

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required Offset thumbCenter,
      Offset? secondaryOffset,
      bool isDiscrete = false,
      bool isEnabled = false,
      double additionalActiveTrackHeight = 2}) {
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Paint activeTrackPaint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(trackRect);

    final Paint inactiveTrackPaint = Paint()
      ..color = sliderTheme.inactiveTrackColor!;

    final double trackRadius = sliderTheme.trackHeight! / 2;

    // 活动轨道
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        trackRect.top,
        thumbCenter.dx,
        trackRect.bottom,
        topLeft: Radius.circular(trackRadius),
        bottomLeft: Radius.circular(trackRadius),
        topRight: Radius.circular(trackRadius),
        bottomRight: Radius.circular(trackRadius),
      ),
      activeTrackPaint,
    );

    // 非活动轨道
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        trackRect.top,
        trackRect.right,
        trackRect.bottom,
        topLeft: Radius.circular(trackRadius),
        bottomLeft: Radius.circular(trackRadius),
        topRight: Radius.circular(trackRadius),
        bottomRight: Radius.circular(trackRadius),
      ),
      inactiveTrackPaint,
    );
  }
}
