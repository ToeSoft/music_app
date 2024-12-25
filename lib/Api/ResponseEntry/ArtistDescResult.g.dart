// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtistDescResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDescResult _$ArtistDescResultFromJson(Map<String, dynamic> json) =>
    ArtistDescResult(
      introduction: (json['introduction'] as List<dynamic>?)
          ?.map((e) => Introduction.fromJson(e as Map<String, dynamic>))
          .toList(),
      briefDesc: json['briefDesc'] as String?,
      count: (json['count'] as num?)?.toInt(),
      topicData: json['topicData'],
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArtistDescResultToJson(ArtistDescResult instance) =>
    <String, dynamic>{
      'introduction': instance.introduction,
      'briefDesc': instance.briefDesc,
      'count': instance.count,
      'topicData': instance.topicData,
      'code': instance.code,
    };

Introduction _$IntroductionFromJson(Map<String, dynamic> json) => Introduction(
      ti: json['ti'] as String?,
      txt: json['txt'] as String?,
    );

Map<String, dynamic> _$IntroductionToJson(Introduction instance) =>
    <String, dynamic>{
      'ti': instance.ti,
      'txt': instance.txt,
    };
