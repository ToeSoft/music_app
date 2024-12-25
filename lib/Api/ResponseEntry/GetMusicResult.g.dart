// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetMusicResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMusicResult _$GetMusicResultFromJson(Map<String, dynamic> json) =>
    GetMusicResult(
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      songInfo: json['song_info'] == null
          ? null
          : SongInfo.fromJson(json['song_info'] as Map<String, dynamic>),
      lrc: json['lrc'] == null
          ? null
          : Lrc.fromJson(json['lrc'] as Map<String, dynamic>),
      yrc: json['yrc'] == null
          ? null
          : Yrc.fromJson(json['yrc'] as Map<String, dynamic>),
      urlInfo: json['url_info'] == null
          ? null
          : UrlInfo.fromJson(json['url_info'] as Map<String, dynamic>),
      mvInfo: json['mv_info'] == null
          ? null
          : MvInfo.fromJson(json['mv_info'] as Map<String, dynamic>),
      copyright: json['copyright'] == null
          ? null
          : Copyright.fromJson(json['copyright'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMusicResultToJson(GetMusicResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'song_info': instance.songInfo,
      'lrc': instance.lrc,
      'yrc': instance.yrc,
      'url_info': instance.urlInfo,
      'mv_info': instance.mvInfo,
      'copyright': instance.copyright,
    };

SongInfo _$SongInfoFromJson(Map<String, dynamic> json) => SongInfo(
      name: json['name'] as String?,
      alia: json['alia'] as String?,
      artist: json['artist'] as String?,
      album: json['album'] as String?,
      level: json['level'] as String?,
      cover: json['cover'] as String?,
    );

Map<String, dynamic> _$SongInfoToJson(SongInfo instance) => <String, dynamic>{
      'name': instance.name,
      'alia': instance.alia,
      'artist': instance.artist,
      'album': instance.album,
      'level': instance.level,
      'cover': instance.cover,
    };

Lrc _$LrcFromJson(Map<String, dynamic> json) => Lrc(
      lyric: json['lyric'] as String?,
      tlyric: json['tlyric'] as String?,
    );

Map<String, dynamic> _$LrcToJson(Lrc instance) => <String, dynamic>{
      'lyric': instance.lyric,
      'tlyric': instance.tlyric,
    };

Yrc _$YrcFromJson(Map<String, dynamic> json) => Yrc(
      lyric: json['lyric'] as String?,
    );

Map<String, dynamic> _$YrcToJson(Yrc instance) => <String, dynamic>{
      'lyric': instance.lyric,
    };

UrlInfo _$UrlInfoFromJson(Map<String, dynamic> json) => UrlInfo(
      url: json['url'] as String?,
      size: json['size'] as String?,
      interval: json['interval'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UrlInfoToJson(UrlInfo instance) => <String, dynamic>{
      'url': instance.url,
      'size': instance.size,
      'interval': instance.interval,
      'type': instance.type,
    };

MvInfo _$MvInfoFromJson(Map<String, dynamic> json) => MvInfo(
      url: json['url'] as String?,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$MvInfoToJson(MvInfo instance) => <String, dynamic>{
      'url': instance.url,
      'size': instance.size,
    };

Copyright _$CopyrightFromJson(Map<String, dynamic> json) => Copyright(
      msg: json['msg'] as String?,
      apiVers: json['api_vers'] as String?,
      type: json['type'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$CopyrightToJson(Copyright instance) => <String, dynamic>{
      'msg': instance.msg,
      'api_vers': instance.apiVers,
      'type': instance.type,
      'token': instance.token,
    };
