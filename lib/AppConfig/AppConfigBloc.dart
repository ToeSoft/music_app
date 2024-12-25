import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppConfigEvent.dart';
import 'AppConfigState.dart';

final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  AppConfigBloc()
      : super(AppConfigState(
          locale: const Locale('zh', 'CN'),
          themeMode: ThemeMode.light,
          appVersion: '获取中...', // 初始为“获取中...”
        )) {
    // 注册初始化事件处理
    on<InitializeAppEvent>(_onInitializeApp);

    // 注册语言切换事件处理
    on<ChangeLanguageEvent>((event, emit) {
      asyncPrefs.setString('locale_languageCode', event.newLocale.languageCode);
      asyncPrefs.setString(
          'locale_countryCode', event.newLocale.countryCode ?? '');
      emit(state.copyWith(locale: event.newLocale));
    });

    // 注册主题切换事件处理
    on<ChangeThemeEvent>((event, emit) {
      asyncPrefs.setBool('themeMode', event.newThemeMode == ThemeMode.dark);
      emit(state.copyWith(themeMode: event.newThemeMode));
    });

    // 延迟触发初始化事件以确保构造完成后再调用
    Future.microtask(() => add(InitializeAppEvent()));
  }

  // 处理初始化事件，获取版本信息
  Future<void> _onInitializeApp(
      InitializeAppEvent event, Emitter<AppConfigState> emit) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;

    final bool? themeMode =
        await asyncPrefs.getBool('themeMode'); //true 为 dark false 为 light

    final String? localeLanguageCode = await asyncPrefs
        .getString('locale_languageCode'); //true 为 dark false 为 light
    final String? localeCountryCode = await asyncPrefs
        .getString('locale_countryCode'); //true 为 dark false 为 light

    emit(state.copyWith(
        appVersion: '$version+$buildNumber',
        themeMode: themeMode == true ? ThemeMode.dark : ThemeMode.light,
        locale: Locale(localeLanguageCode ?? 'zh', localeCountryCode ?? 'CN')));
  }
}
