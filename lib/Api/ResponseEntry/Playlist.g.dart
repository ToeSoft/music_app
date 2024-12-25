// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlists _$PlaylistsFromJson(Map<String, dynamic> json) => Playlists(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      coverImgUrl: json['coverImgUrl'] as String?,
      creator: json['creator'] == null
          ? null
          : Creator.fromJson(json['creator'] as Map<String, dynamic>),
      subscribed: json['subscribed'] as bool?,
      trackCount: (json['trackCount'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      playCount: (json['playCount'] as num?)?.toInt(),
      bookCount: (json['bookCount'] as num?)?.toInt(),
      specialType: (json['specialType'] as num?)?.toInt(),
      description: json['description'] as String?,
      highQuality: json['highQuality'] as bool?,
    );

Map<String, dynamic> _$PlaylistsToJson(Playlists instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverImgUrl': instance.coverImgUrl,
      'creator': instance.creator,
      'subscribed': instance.subscribed,
      'trackCount': instance.trackCount,
      'userId': instance.userId,
      'playCount': instance.playCount,
      'bookCount': instance.bookCount,
      'specialType': instance.specialType,
      'description': instance.description,
      'highQuality': instance.highQuality,
    };
