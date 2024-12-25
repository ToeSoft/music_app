// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AlbumResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumResult _$AlbumResultFromJson(Map<String, dynamic> json) => AlbumResult(
      resourceState: json['resourceState'] as bool?,
      songs: (json['songs'] as List<dynamic>?)
          ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num?)?.toInt(),
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumResultToJson(AlbumResult instance) =>
    <String, dynamic>{
      'resourceState': instance.resourceState,
      'songs': instance.songs,
      'code': instance.code,
      'album': instance.album,
    };
