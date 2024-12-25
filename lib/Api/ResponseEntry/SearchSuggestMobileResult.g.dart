// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchSuggestMobileResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestMobileResult _$SearchSuggestMobileResultFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestMobileResult(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchSuggestMobileResultToJson(
        SearchSuggestMobileResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      allMatch: (json['allMatch'] as List<dynamic>?)
          ?.map((e) => AllMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'allMatch': instance.allMatch,
    };

AllMatch _$AllMatchFromJson(Map<String, dynamic> json) => AllMatch(
      keyword: json['keyword'] as String?,
      type: (json['type'] as num?)?.toInt(),
      alg: json['alg'] as String?,
      lastKeyword: json['lastKeyword'] as String?,
      feature: json['feature'] as String?,
    );

Map<String, dynamic> _$AllMatchToJson(AllMatch instance) => <String, dynamic>{
      'keyword': instance.keyword,
      'type': instance.type,
      'alg': instance.alg,
      'lastKeyword': instance.lastKeyword,
      'feature': instance.feature,
    };
