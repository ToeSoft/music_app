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

  /// `Song List`
  String get song_list {
    return Intl.message(
      'Song List',
      name: 'song_list',
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

  /// `No search result`
  String get no_search_result {
    return Intl.message(
      'No search result',
      name: 'no_search_result',
      desc: '',
      args: [],
    );
  }

  /// `Please input search content`
  String get please_input_search_content {
    return Intl.message(
      'Please input search content',
      name: 'please_input_search_content',
      desc: '',
      args: [],
    );
  }

  /// `No suggestions available`
  String get no_suggestions_available {
    return Intl.message(
      'No suggestions available',
      name: 'no_suggestions_available',
      desc: '',
      args: [],
    );
  }

  /// `No songs found`
  String get songs_not_find {
    return Intl.message(
      'No songs found',
      name: 'songs_not_find',
      desc: '',
      args: [],
    );
  }

  /// `No album found`
  String get album_not_find {
    return Intl.message(
      'No album found',
      name: 'album_not_find',
      desc: '',
      args: [],
    );
  }

  /// `No singer found`
  String get singer_not_find {
    return Intl.message(
      'No singer found',
      name: 'singer_not_find',
      desc: '',
      args: [],
    );
  }

  /// `No playlist found`
  String get playlist_not_find {
    return Intl.message(
      'No playlist found',
      name: 'playlist_not_find',
      desc: '',
      args: [],
    );
  }

  /// `Album Detail`
  String get album_detail {
    return Intl.message(
      'Album Detail',
      name: 'album_detail',
      desc: '',
      args: [],
    );
  }

  /// `Song Name`
  String get song_name {
    return Intl.message(
      'Song Name',
      name: 'song_name',
      desc: '',
      args: [],
    );
  }

  /// `Singer Name`
  String get singer_name {
    return Intl.message(
      'Singer Name',
      name: 'singer_name',
      desc: '',
      args: [],
    );
  }

  /// `Create Playlist`
  String get create_playlist {
    return Intl.message(
      'Create Playlist',
      name: 'create_playlist',
      desc: '',
      args: [],
    );
  }

  /// `Select Cover`
  String get select_cover {
    return Intl.message(
      'Select Cover',
      name: 'select_cover',
      desc: '',
      args: [],
    );
  }

  /// `Cover uploaded successfully`
  String get upload_cover_success {
    return Intl.message(
      'Cover uploaded successfully',
      name: 'upload_cover_success',
      desc: '',
      args: [],
    );
  }

  /// `Cover upload failed`
  String get upload_cover_fail {
    return Intl.message(
      'Cover upload failed',
      name: 'upload_cover_fail',
      desc: '',
      args: [],
    );
  }

  /// `Tap to select cover`
  String get tap_to_select_cover {
    return Intl.message(
      'Tap to select cover',
      name: 'tap_to_select_cover',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get playlist_title {
    return Intl.message(
      'Title',
      name: 'playlist_title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get playlist_description {
    return Intl.message(
      'Description',
      name: 'playlist_description',
      desc: '',
      args: [],
    );
  }

  /// `Please enter playlist title`
  String get pl_enter_title {
    return Intl.message(
      'Please enter playlist title',
      name: 'pl_enter_title',
      desc: '',
      args: [],
    );
  }

  /// `Please enter playlist description`
  String get pl_enter_description {
    return Intl.message(
      'Please enter playlist description',
      name: 'pl_enter_description',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Title can't be null`
  String get title_cant_not_be_null {
    return Intl.message(
      'Title can\'t be null',
      name: 'title_cant_not_be_null',
      desc: '',
      args: [],
    );
  }

  /// `Please upload cover image`
  String get pl_upload_cover {
    return Intl.message(
      'Please upload cover image',
      name: 'pl_upload_cover',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Create playlist success`
  String get create_playlist_success {
    return Intl.message(
      'Create playlist success',
      name: 'create_playlist_success',
      desc: '',
      args: [],
    );
  }

  /// `Please select the playlist to collect`
  String get pl_select_playlist {
    return Intl.message(
      'Please select the playlist to collect',
      name: 'pl_select_playlist',
      desc: '',
      args: [],
    );
  }

  /// `Already collected`
  String get already_collected {
    return Intl.message(
      'Already collected',
      name: 'already_collected',
      desc: '',
      args: [],
    );
  }

  /// `Collect success`
  String get collect_success {
    return Intl.message(
      'Collect success',
      name: 'collect_success',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
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
