import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'AppConfigEvent.dart';
import 'AppConfigState.dart';

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
      emit(state.copyWith(locale: event.newLocale));
    });

    // 注册主题切换事件处理
    on<ChangeThemeEvent>((event, emit) {
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
    emit(state.copyWith(appVersion: '$version+$buildNumber'));
  }
}