import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music_app/Api/ResponseEntry/CloudSearchResult.dart';
import 'package:music_app/Api/ResponseEntry/SearchSuggestDesktopResult.dart';
import 'package:music_app/Api/ResponseEntry/SearchSuggestMobileResult.dart';
import 'package:retrofit/retrofit.dart';

import 'RequestEntry/MusicRequestParams.dart';
import 'ResponseEntry/AlbumResult.dart';
import 'ResponseEntry/ArtistAlbumsResult.dart';
import 'ResponseEntry/ArtistDescResult.dart';
import 'ResponseEntry/ArtistDetailResult.dart';
import 'ResponseEntry/ArtistSongsResult.dart';
import 'ResponseEntry/GetMusicResult.dart';
import 'ResponseEntry/LyricNewResult.dart';
import 'ResponseEntry/LyricResult.dart';
import 'ResponseEntry/PlaylistDetailResult.dart';
import 'ResponseEntry/PlaylistSongsResult.dart';
import 'ResponseEntry/SmmsUploadResult.dart';

part 'HttpClient.g.dart';

// 请使用 下面命令 生成 g.dart 文件
// dart run  build_runner build

// RetrofitClient 的单例模式实现
class HTTP {
  // 静态私有实例
  static RetrofitClient? _retrofitInstance;
  static SmmsClient? _smmsInstance;
  static MusicClient? _musicInstance;

  // Dio 实例配置
  static Dio _createDio({String? baseUrl, Map<String, dynamic>? headers}) {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        ...?headers, // 合并额外的 headers
      },
    );
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  // 获取 RetrofitClient 实例
  static RetrofitClient getRetrofitClient() {
    _retrofitInstance ??= RetrofitClient(
      _createDio(baseUrl: dotenv.get("WEB_API")),
    );
    return _retrofitInstance!;
  }

  // 获取 SmmsClient 实例
  static SmmsClient getSmmsClient() {
    _smmsInstance ??= SmmsClient(
      _createDio(
        baseUrl: "https://sm.ms/api/v2/",
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': dotenv.get("SMMS_TOKEN"),
        },
      ),
    );
    return _smmsInstance!;
  }

  static MusicClient getMusicClient() {
    _musicInstance ??= MusicClient(
      _createDio(baseUrl: "https://api.toubiec.cn/api/", headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer ${dotenv.get("NETEASE_MUSIC_TOKEN")}",
      }),
    );

    return _musicInstance!;
  }

  // 通用方法，根据类型获取客户端实例
  static T getClient<T>() {
    if (T == RetrofitClient) {
      return getRetrofitClient() as T;
    } else if (T == SmmsClient) {
      return getSmmsClient() as T;
    } else if (T == MusicClient) {
      return getMusicClient() as T;
    } else {
      throw UnsupportedError("Unsupported client type: $T");
    }
  }
}

@RestApi()
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String? baseUrl}) = _RetrofitClient;

  @GET("/artist/detail")
  Future<ArtistDetailResult> artistDetail(@Query("id") String id);

  @GET("/artist/desc")
  Future<ArtistDescResult> artistDesc(@Query("id") String id);

  // order : hot ,time 按照热门或者时间排序
  //
  // limit: 取出歌单数量 , 默认为 50
  //
  // offset: 偏移数量 , 用于分页 , 如 :( 评论页数 -1)*50, 其中 50 为 limit 的值
  @GET("/artist/songs")
  Future<ArtistSongsResult> artistSongs(
      @Query("id") String id,
      @Query("order") String order,
      @Query("limit") int limit,
      @Query("offset") int offset);

  // 必选参数 : id: 歌手 id
  //
  // 可选参数 : limit: 取出数量 , 默认为 30
  //
  // offset: 偏移数量 , 用于分页 , 如 :( 页数 -1)*30, 其中 30 为 limit 的值 , 默认 为 0
  @GET("/artist/album")
  Future<ArtistAlbumsResult> artistAlbum(@Query("id") String id,
      @Query("limit") int limit, @Query("offset") int offset);

  // 必选参数 : id : 歌单 id
  //
  // 可选参数 : limit : 限制获取歌曲的数量，默认值为当前歌单的歌曲数量
  //
  // 可选参数 : offset : 默认值为0
  @GET("/playlist/track/all")
  Future<PlaylistSongsResult> playlistTrackAll(@Query("id") String id,
      @Query("limit") int limit, @Query("offset") int offset);

  @GET("/playlist/detail")
  Future<PlaylistDetailResult> playlistDetail(@Query("id") String id);

  @GET("/album")
  Future<AlbumResult> album(@Query("id") String id);

  @GET("/cloudsearch")
  Future<CloudSearchResult> cloudsearch(
      @Query("keywords") String keywords,
      @Query("limit") int limit,
      @Query("offset") int offset,
      @Query("type") int type);

  @GET("/search/suggest")
  Future<SearchSuggestDesktopResult> suggestDesktop(
      @Query("keywords") String keywords);

  @GET("/search/suggest")
  Future<SearchSuggestMobileResult> suggestMobile(
      @Query("keywords") String keywords, @Query("type") String type);

  //获取歌词
  @GET("/lyric")
  Future<LyricResult> lyric(@Query("id") String id);

  //获取逐字歌词
  @GET("/lyric/new")
  Future<LyricNewResult> lyricNew(@Query("id") String id);
}

@RestApi()
abstract class SmmsClient {
  factory SmmsClient(Dio dio, {String? baseUrl}) = _SmmsClient;

  @POST("/upload")
  Future<SmmsUploadResult> upload(@Part() File smfile);
}

@RestApi()
abstract class MusicClient {
  factory MusicClient(Dio dio, {String? baseUrl}) = _MusicClient;

  @POST("/music_v1.php")
  Future<GetMusicResult> getMusic(@Body() MusicRequestParams params);
}
