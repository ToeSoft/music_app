// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      picUrl: json['picUrl'] as String?,
      alias: json['alias'] as List<dynamic>?,
      albumSize: (json['albumSize'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      img1v1Url: json['img1v1Url'] as String?,
      img1v1Id: (json['img1v1Id'] as num?)?.toInt(),
      briefDesc: json['briefDesc'] as String?,
      trans: json['trans'] as String?,
      musicSize: (json['musicSize'] as num?)?.toInt(),
      topicPerson: (json['topicPerson'] as num?)?.toInt(),
      picidStr: json['picidStr'] as String?,
      transNames: (json['transNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followed: json['followed'] as bool?,
      img1v1idStr: json['img1v1idStr'] as String?,
      mvSize: (json['mvSize'] as num?)?.toInt(),
      img1v1: (json['img1v1'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'picId': instance.picId,
      'img1v1Id': instance.img1v1Id,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'albumSize': instance.albumSize,
      'alias': instance.alias,
      'trans': instance.trans,
      'musicSize': instance.musicSize,
      'topicPerson': instance.topicPerson,
      'picidStr': instance.picidStr,
      'transNames': instance.transNames,
      'followed': instance.followed,
      'img1v1idStr': instance.img1v1idStr,
      'img1v1': instance.img1v1,
      'mvSize': instance.mvSize,
    };
