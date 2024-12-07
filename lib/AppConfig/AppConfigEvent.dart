import 'package:flutter/material.dart';

abstract class AppConfigEvent {}

class ChangeLanguageEvent extends AppConfigEvent {
  final Locale newLocale;

  ChangeLanguageEvent(this.newLocale);
}

class ChangeThemeEvent extends AppConfigEvent {
  final ThemeMode newThemeMode;

  ChangeThemeEvent(this.newThemeMode);
}


class InitializeAppEvent extends AppConfigEvent {
  InitializeAppEvent();
}