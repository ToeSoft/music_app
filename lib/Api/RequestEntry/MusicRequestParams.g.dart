// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MusicRequestParams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicRequestParams _$MusicRequestParamsFromJson(Map<String, dynamic> json) =>
    MusicRequestParams(
      level: json['level'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$MusicRequestParamsToJson(MusicRequestParams instance) =>
    <String, dynamic>{
      'level': instance.level,
      'type': instance.type,
      'url': instance.url,
      'token': instance.token,
    };
