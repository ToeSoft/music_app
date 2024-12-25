import 'package:json_annotation/json_annotation.dart';

part 'ArtistDescResult.g.dart';

@JsonSerializable()
class ArtistDescResult {
  final List<Introduction>? introduction;
  final String? briefDesc;
  final int? count;
  final dynamic topicData;
  final int? code;

  const ArtistDescResult({
    this.introduction,
    this.briefDesc,
    this.count,
    this.topicData,
    this.code,
  });

  factory ArtistDescResult.fromJson(Map<String, dynamic> json) =>
      _$ArtistDescResultFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDescResultToJson(this);

  ArtistDescResult copyWith({
    List<Introduction>? introduction,
    String? briefDesc,
    int? count,
    dynamic topicData,
    int? code,
  }) {
    return ArtistDescResult(
      introduction: introduction ?? this.introduction,
      briefDesc: briefDesc ?? this.briefDesc,
      count: count ?? this.count,
      topicData: topicData ?? this.topicData,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class Introduction {
  final String? ti;
  final String? txt;

  const Introduction({
    this.ti,
    this.txt,
  });

  factory Introduction.fromJson(Map<String, dynamic> json) =>
      _$IntroductionFromJson(json);

  Map<String, dynamic> toJson() => _$IntroductionToJson(this);

  Introduction copyWith({
    String? ti,
    String? txt,
  }) {
    return Introduction(
      ti: ti ?? this.ti,
      txt: txt ?? this.txt,
    );
  }
}
