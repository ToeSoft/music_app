import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_app/utils/TextUtils.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:window_manager/window_manager.dart';

import 'AppConfig/AppConfigBloc.dart';
import 'AppConfig/AppConfigEvent.dart';
import 'AppConfig/AppConfigState.dart';
import 'CustomSearchDelegate.dart';
import 'PlayListDetailPage.dart';
import 'Player/ControlButtons.dart';
import 'Player/MusicPlayerBloc.dart';
import 'Player/MusicPlayerEvent.dart';
import 'Player/MusicPlayerState.dart';
import 'Player/PlayerBar.dart';
import 'Player/ProgressBar.dart';
import 'component/DesktopPlayListItem.dart';
import 'component/MySearchBar.dart';
import 'component/PlaylistItem.dart';
import "generated/l10n.dart";

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 判断是否为 Web、Android 或 iOS 平台，如果是则不初始化 window_manager
  if (!kIsWeb &&
      defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1200, 800),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setMinimumSize(const Size(400, 300)); // 设置最小宽度和最小高度
    });
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppConfigBloc>(
          create: (_) => AppConfigBloc(),
        ),
        BlocProvider<MusicPlayerBloc>(
          create: (_) => MusicPlayerBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigBloc, AppConfigState>(
      builder: (context, configState) {
        return MaterialApp(
          onGenerateTitle: (context) => S.of(context).title,
          locale: configState.locale,
          themeMode: configState.themeMode,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = -1; // 控制当前显示的视图索引，-1 表示显示列表

  @override
  Widget build(BuildContext context) {
    final appConfigBloc = context.read<AppConfigBloc>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // 自定义高度
        child: Container(
          padding: const EdgeInsets.only(top: 20.0), // 顶部内边距
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        S.current.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    if (MediaQuery.of(context).size.width > 650)
                      Expanded(
                        child: MySearchBar(hintText: S.current.search_hint),
                      ),
                    Row(
                      children: [
                        if (MediaQuery.of(context).size.width <= 650)
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: CustomSearchDelegate(),
                              );
                            },
                          ),
                        IconButton(
                          icon: const Icon(Icons.translate),
                          onPressed: () {
                            final newLocale =
                                Localizations.localeOf(context).languageCode ==
                                        'en'
                                    ? const Locale('zh', 'CN')
                                    : const Locale('en', 'US');
                            appConfigBloc.add(ChangeLanguageEvent(newLocale));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.contrast),
                          onPressed: () {
                            final newThemeMode =
                                Theme.of(context).brightness == Brightness.light
                                    ? ThemeMode.dark
                                    : ThemeMode.light;
                            appConfigBloc.add(ChangeThemeEvent(newThemeMode));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isSmallScreen = constraints.maxWidth < 500; // 判断是否为小屏

            return Column(
              children: [
                if (_currentIndex == -1)
                  Expanded(
                    child: isSmallScreen
                        ? ListView.builder(
                            itemCount: 10, // 替换为实际的列表项数
                            itemBuilder: (context, index) {
                              return PlaylistItem(
                                index: index,
                                onTap: () {
                                  if (isSmallScreen) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PlayListDetailPage(
                                          top: 30,
                                          index: index,
                                          onBack: () {
                                            Navigator.pop(context); // 返回上一页面
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    // 大屏幕进入详情页
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  }
                                },
                              );
                            },
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16), // 两边添加 16 像素的边距
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200, // 每个网格项的最大宽度
                                childAspectRatio: 1, // 宽高比
                                crossAxisSpacing: 10, // 列间距
                                mainAxisSpacing: 10, // 行间距
                              ),
                              itemCount: 10, // 替换为实际的列表项数
                              itemBuilder: (context, index) {
                                return DesktopPlaylistItem(
                                  index: index,
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = index; // 点击时更新索引
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                  ),
                if (_currentIndex != -1)
                  Expanded(
                    child: PlayListDetailPage(
                      index: _currentIndex,
                      onBack: () {
                        setState(() {
                          _currentIndex = -1; // 返回到列表页面
                        });
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const MusicPlayerBar(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // 自定义 AppBar 的高度
        child: Container(
          padding: const EdgeInsets.only(top: 10.0), // 顶部内边距
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Navigator.pop(context); // 返回上一页面
                      },
                    ),
                    Text(
                      S.current.setting_title, // 使用传入的 S 实例
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.current.setting_description), // 使用传入的 S 实例
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<AppConfigBloc, AppConfigState>(
          builder: (context, state) {
            return Text(
              '${S.current.appConfig_Version} : ${state.appVersion}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}

class BigPlayerPage extends StatefulWidget {
  const BigPlayerPage({super.key});

  @override
  State<BigPlayerPage> createState() => _BigPlayerPageState();
}

class _BigPlayerPageState extends State<BigPlayerPage> {
  List<Color> gradientColors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.white,
    Colors.white
  ]; // 默认渐变颜色
  final String imageUrl =
      'https://picsum.photos/800/800?random=${Random().nextInt(1000)}'; // 动态网络图片 URL

  @override
  void initState() {
    super.initState();
    _updateGradientColors();
  }

  Future<void> _updateGradientColors() async {
    try {
      final ImageProvider imageProvider = NetworkImage(imageUrl);

      // 确保图片加载完成
      final imageStream = imageProvider.resolve(const ImageConfiguration());
      final completer = Completer<void>();
      imageStream.addListener(
        ImageStreamListener((_, __) => completer.complete()),
      );
      await completer.future;

      // 提取颜色
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        imageProvider,
        size: const Size(500, 500), // 限制分析范围以提升性能
      );

      final colors = paletteGenerator.colors.toList();
      if (colors.isNotEmpty) {
        setState(() {
          gradientColors = colors.take(10).toList();
        });
      }
    } catch (e) {
      // 如果提取颜色失败，保持默认颜色
      debugPrint('Failed to fetch dominant colors: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = getHighestContrastColor(gradientColors);
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth > 600 ? screenWidth * 0.30 : 250.0; // 计算图片大小
    return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              // 渐变背景层
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        gradientColors[0],
                        gradientColors[1],
                        gradientColors[2],
                      ],
                      center: Alignment.center, // 渐变从中心开始
                      radius: 2, // 控制渐变范围
                    ),
                  ),
                ),
              ),
              // 左上角和右上角返回按钮
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: themeColor,
                  onPressed: () {
                    Navigator.pop(context); // 返回上一页面
                  },
                ),
              ),
              Positioned(
                  top: 30,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.playlist_play),
                        color: themeColor,
                        onPressed: () {
                          context
                              .read<MusicPlayerBloc>()
                              .add(TogglePlaylistEvent());
                        },
                      )
                    ],
                  )),
              // 内容层
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // 图片显示
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0), // 圆角图片
                            child: Image.network(
                              imageUrl,
                              width: imageSize, // 动态宽度
                              height: imageSize, // 动态高度
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 16), // 间距
                          // 文本描述
                          Text(
                            'Song Name', // 示例文字
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: themeColor),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Song Name', // 示例文字
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: themeColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ControlButtons(
                            isBig: true,
                            isShuffleActive: state.isShuffleActive,
                            isPlaying: state.isPlaying,
                            loopMode: state.loopMode,
                            shuffleActiveColor: themeColor,
                            disableColor: Theme.of(context).disabledColor,
                            iconColor: themeColor,
                            onShufflePressed: () {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(ToggleShuffleEvent());
                            },
                            onPlayPausePressed: () {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(TogglePlayPauseEvent());
                            },
                            onLoopPressed: () {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(ChangeLoopModeEvent());
                            },
                            onPreviousPressed: () {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(PreviousTrackEvent());
                            },
                            onNextPressed: () {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(NextTrackEvent());
                            },
                          ),
                          ProgressBar(
                            isBig: true,
                            gradientColors: [themeColor, themeColor],
                            currentPosition: state.currentPosition,
                            totalDuration: state.totalDuration,
                            textColor: themeColor,
                            onChanged: (value) {
                              context
                                  .read<MusicPlayerBloc>()
                                  .add(UpdateProgressEvent(value));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class SearchResultsPage extends StatelessWidget {
  final String query;
  final bool showAppBar;

  const SearchResultsPage(
      {super.key, required this.query, required this.showAppBar});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Tab 项的数量
      child: Scaffold(
        body: Stack(
          children: [
            // 返回按钮
            if (showAppBar)
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context); // 返回上一页面
                  },
                ),
              ),
            // 搜索提示和 TabBar
            Positioned(
              top: showAppBar ? 40 : 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  if (showAppBar)
                    Text('$query ${S.current.search_tip}',
                        style: Theme.of(context).textTheme.titleLarge),
                  TabBar(
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(text: S.current.songs),
                      Tab(text: S.current.album),
                      Tab(text: S.current.singer),
                    ],
                  ),
                ],
              ),
            ),
            // TabBarView 内容
            Positioned.fill(
              top: 140, // 内容区域在 TabBar 下面
              child: TabBarView(
                children: [
                  TabContent(content: S.current.songs),
                  TabContent(content: S.current.album),
                  TabContent(content: S.current.singer),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String content;

  const TabContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        content,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
