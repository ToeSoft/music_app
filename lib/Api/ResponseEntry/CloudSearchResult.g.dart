// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CloudSearchResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloudSearchResult _$CloudSearchResultFromJson(Map<String, dynamic> json) =>
    CloudSearchResult(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CloudSearchResultToJson(CloudSearchResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      playlists: (json['playlists'] as List<dynamic>?)
          ?.map((e) => Playlists.fromJson(e as Map<String, dynamic>))
          .toList(),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      songs: (json['songs'] as List<dynamic>?)
          ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      albums: (json['albums'] as List<dynamic>?)
          ?.map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
      songCount: (json['songCount'] as num?)?.toInt(),
      albumCount: (json['albumCount'] as num?)?.toInt(),
      artistCount: (json['artistCount'] as num?)?.toInt(),
      playlistCount: (json['playlistCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'playlists': instance.playlists,
      'artists': instance.artists,
      'songs': instance.songs,
      'albums': instance.albums,
      'songCount': instance.songCount,
      'albumCount': instance.albumCount,
      'artistCount': instance.artistCount,
      'playlistCount': instance.playlistCount,
    };
