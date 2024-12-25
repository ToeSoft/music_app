import 'package:json_annotation/json_annotation.dart';

part 'SearchSuggestMobileResult.g.dart';

@JsonSerializable()
class SearchSuggestMobileResult {
  final Result? result;
  final int? code;

  const SearchSuggestMobileResult({
    this.result,
    this.code,
  });

  factory SearchSuggestMobileResult.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestMobileResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestMobileResultToJson(this);

  SearchSuggestMobileResult copyWith({
    Result? result,
    int? code,
  }) {
    return SearchSuggestMobileResult(
      result: result ?? this.result,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class Result {
  final List<AllMatch>? allMatch;

  const Result({
    this.allMatch,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Result copyWith({
    List<AllMatch>? allMatch,
  }) {
    return Result(
      allMatch: allMatch ?? this.allMatch,
    );
  }
}

@JsonSerializable()
class AllMatch {
  final String? keyword;
  final int? type;
  final String? alg;
  final String? lastKeyword;
  final String? feature;

  const AllMatch({
    this.keyword,
    this.type,
    this.alg,
    this.lastKeyword,
    this.feature,
  });

  factory AllMatch.fromJson(Map<String, dynamic> json) =>
      _$AllMatchFromJson(json);

  Map<String, dynamic> toJson() => _$AllMatchToJson(this);

  AllMatch copyWith({
    String? keyword,
    int? type,
    String? alg,
    String? lastKeyword,
    String? feature,
  }) {
    return AllMatch(
      keyword: keyword ?? this.keyword,
      type: type ?? this.type,
      alg: alg ?? this.alg,
      lastKeyword: lastKeyword ?? this.lastKeyword,
      feature: feature ?? this.feature,
    );
  }
}
