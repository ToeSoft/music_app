// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LyricNewResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LyricNewResult _$LyricNewResultFromJson(Map<String, dynamic> json) =>
    LyricNewResult(
      sgc: json['sgc'] as bool?,
      sfy: json['sfy'] as bool?,
      qfy: json['qfy'] as bool?,
      lrc: json['lrc'] == null
          ? null
          : Lrc.fromJson(json['lrc'] as Map<String, dynamic>),
      klyric: json['klyric'] == null
          ? null
          : Klyric.fromJson(json['klyric'] as Map<String, dynamic>),
      tlyric: json['tlyric'] == null
          ? null
          : Tlyric.fromJson(json['tlyric'] as Map<String, dynamic>),
      romalrc: json['romalrc'] == null
          ? null
          : Romalrc.fromJson(json['romalrc'] as Map<String, dynamic>),
      yrc: json['yrc'] == null
          ? null
          : Yrc.fromJson(json['yrc'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LyricNewResultToJson(LyricNewResult instance) =>
    <String, dynamic>{
      'sgc': instance.sgc,
      'sfy': instance.sfy,
      'qfy': instance.qfy,
      'lrc': instance.lrc,
      'klyric': instance.klyric,
      'tlyric': instance.tlyric,
      'romalrc': instance.romalrc,
      'yrc': instance.yrc,
      'code': instance.code,
    };

Lrc _$LrcFromJson(Map<String, dynamic> json) => Lrc(
      version: (json['version'] as num?)?.toInt(),
      lyric: json['lyric'] as String?,
    );

Map<String, dynamic> _$LrcToJson(Lrc instance) => <String, dynamic>{
      'version': instance.version,
      'lyric': instance.lyric,
    };

Klyric _$KlyricFromJson(Map<String, dynamic> json) => Klyric(
      version: (json['version'] as num?)?.toInt(),
      lyric: json['lyric'] as String?,
    );

Map<String, dynamic> _$KlyricToJson(Klyric instance) => <String, dynamic>{
      'version': instance.version,
      'lyric': instance.lyric,
    };

Tlyric _$TlyricFromJson(Map<String, dynamic> json) => Tlyric(
      version: (json['version'] as num?)?.toInt(),
      lyric: json['lyric'] as String?,
    );

Map<String, dynamic> _$TlyricToJson(Tlyric instance) => <String, dynamic>{
      'version': instance.version,
      'lyric': instance.lyric,
    };

Romalrc _$RomalrcFromJson(Map<String, dynamic> json) => Romalrc(
      version: (json['version'] as num?)?.toInt(),
      lyric: json['lyric'] as String?,
    );

Map<String, dynamic> _$RomalrcToJson(Romalrc instance) => <String, dynamic>{
      'version': instance.version,
      'lyric': instance.lyric,
    };

Yrc _$YrcFromJson(Map<String, dynamic> json) => Yrc(
      version: (json['version'] as num?)?.toInt(),
      lyric: json['lyric'] as String?,
    );

Map<String, dynamic> _$YrcToJson(Yrc instance) => <String, dynamic>{
      'version': instance.version,
      'lyric': instance.lyric,
    };
