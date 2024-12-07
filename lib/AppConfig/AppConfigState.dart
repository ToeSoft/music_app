import 'package:flutter/material.dart';

class AppConfigState {
  final Locale locale;
  final ThemeMode themeMode;
  final String appVersion;

  AppConfigState({
    required this.locale,
    required this.themeMode,
    required this.appVersion,
  });

  AppConfigState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
    String? appVersion,
  }) {
    return AppConfigState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      appVersion: appVersion ?? this.appVersion,
    );
  }
}