// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Music App`
  String get title {
    return Intl.message(
      'Music App',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `App Font Size`
  String get appConfig_FontSize {
    return Intl.message(
      'App Font Size',
      name: 'appConfig_FontSize',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appConfig_Language {
    return Intl.message(
      'App Language',
      name: 'appConfig_Language',
      desc: '',
      args: [],
    );
  }

  /// `App Theme`
  String get appConfig_Theme {
    return Intl.message(
      'App Theme',
      name: 'appConfig_Theme',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get appConfig_Version {
    return Intl.message(
      'App Version',
      name: 'appConfig_Version',
      desc: '',
      args: [],
    );
  }

  /// `Switch Language`
  String get appConfig_switchLanguage {
    return Intl.message(
      'Switch Language',
      name: 'appConfig_switchLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Switch Theme`
  String get appConfig_switchTheme {
    return Intl.message(
      'Switch Theme',
      name: 'appConfig_switchTheme',
      desc: '',
      args: [],
    );
  }

  /// `App Configuration`
  String get appConfig_title {
    return Intl.message(
      'App Configuration',
      name: 'appConfig_title',
      desc: '',
      args: [],
    );
  }

  /// `test`
  String get appConfig_test {
    return Intl.message(
      'test',
      name: 'appConfig_test',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting_title {
    return Intl.message(
      'Setting',
      name: 'setting_title',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting_description {
    return Intl.message(
      'Setting',
      name: 'setting_description',
      desc: '',
      args: [],
    );
  }

  /// `Please enter search content`
  String get search_hint {
    return Intl.message(
      'Please enter search content',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Playlist`
  String get playlist {
    return Intl.message(
      'Playlist',
      name: 'playlist',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Playlist is empty`
  String get playlist_empty {
    return Intl.message(
      'Playlist is empty',
      name: 'playlist_empty',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get no_data {
    return Intl.message(
      'No Data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `No More Data`
  String get no_more_data {
    return Intl.message(
      'No More Data',
      name: 'no_more_data',
      desc: '',
      args: [],
    );
  }

  /// `Songs`
  String get songs {
    return Intl.message(
      'Songs',
      name: 'songs',
      desc: '',
      args: [],
    );
  }

  /// `Singer`
  String get singer {
    return Intl.message(
      'Singer',
      name: 'singer',
      desc: '',
      args: [],
    );
  }

  /// `Album`
  String get album {
    return Intl.message(
      'Album',
      name: 'album',
      desc: '',
      args: [],
    );
  }

  /// `'s search result`
  String get search_tip {
    return Intl.message(
      '\'s search result',
      name: 'search_tip',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
