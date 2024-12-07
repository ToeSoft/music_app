import 'dart:math';
import 'dart:ui';

String formatDuration(double seconds) {
  final int minutes = (seconds ~/ 60);
  final int remainingSeconds = (seconds % 60).toInt();
  return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
}

Color getHighestContrastColor(List<Color> colors) {
  if (colors.length <= 3) {
    throw ArgumentError("The colors list must contain at least 4 colors.");
  }

  double calculateColorDistance(Color color1, Color color2) {
    return sqrt(
      pow(color2.red - color1.red, 2) +
          pow(color2.green - color1.green, 2) +
          pow(color2.blue - color1.blue, 2),
    );
  }

  double calculateTotalDistance(Color targetColor, List<Color> referenceColors) {
    return referenceColors.fold(
      0.0,
          (sum, refColor) => sum + calculateColorDistance(targetColor, refColor),
    );
  }

  // 获取前三个参考颜色
  final referenceColors = colors.take(3).toList();

  // 找到与前三个颜色差异最大的颜色
  Color? highestContrastColor;
  double highestDistance = 0;

  for (var color in colors) {
    if (referenceColors.contains(color)) {
      continue; // 跳过参考颜色
    }

    final distance = calculateTotalDistance(color, referenceColors);
    if (distance > highestDistance) {
      highestDistance = distance;
      highestContrastColor = color;
    }
  }

  return highestContrastColor ?? colors.last;
}
