import 'package:flutter/material.dart';

/// 定义显示位置的枚举
enum ToastPosition {
  top,
  center,
  bottom,
}

class Toast {
  static void show(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 2),
        ToastPosition position = ToastPosition.center, // 默认位置为底部
      }) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    final overlayEntry = OverlayEntry(
      builder: (context) {
        double topPosition;
        switch (position) {
          case ToastPosition.top:
            topPosition = MediaQuery.of(context).size.height * 0.1;
            break;
          case ToastPosition.center:
            topPosition = MediaQuery.of(context).size.height * 0.5 - 50;
            break;
          case ToastPosition.bottom:
          default:
            topPosition = MediaQuery.of(context).size.height * 0.8;
        }

        return Positioned(
          top: topPosition,
          left: MediaQuery.of(context).size.width * 0.2,
          right: MediaQuery.of(context).size.width * 0.2,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}