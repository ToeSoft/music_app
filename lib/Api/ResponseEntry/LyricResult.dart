import 'package:json_annotation/json_annotation.dart';

part 'LyricResult.g.dart';

@JsonSerializable()
class LyricResult {
  final bool? sgc;
  final bool? sfy;
  final bool? qfy;
  final Lrc? lrc;
  final Klyric? klyric;
  final Tlyric? tlyric;
  final Romalrc? romalrc;
  final int? code;

  const LyricResult({
    this.sgc,
    this.sfy,
    this.qfy,
    this.lrc,
    this.klyric,
    this.tlyric,
    this.romalrc,
    this.code,
  });

  factory LyricResult.fromJson(Map<String, dynamic> json) =>
      _$LyricResultFromJson(json);

  Map<String, dynamic> toJson() => _$LyricResultToJson(this);

  LyricResult copyWith({
    bool? sgc,
    bool? sfy,
    bool? qfy,
    Lrc? lrc,
    Klyric? klyric,
    Tlyric? tlyric,
    Romalrc? romalrc,
    int? code,
  }) {
    return LyricResult(
      sgc: sgc ?? this.sgc,
      sfy: sfy ?? this.sfy,
      qfy: qfy ?? this.qfy,
      lrc: lrc ?? this.lrc,
      klyric: klyric ?? this.klyric,
      tlyric: tlyric ?? this.tlyric,
      romalrc: romalrc ?? this.romalrc,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class Lrc {
  final int? version;
  final String? lyric;

  const Lrc({
    this.version,
    this.lyric,
  });

  factory Lrc.fromJson(Map<String, dynamic> json) =>
      _$LrcFromJson(json);

  Map<String, dynamic> toJson() => _$LrcToJson(this);

  Lrc copyWith({
    int? version,
    String? lyric,
  }) {
    return Lrc(
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
    );
  }
}

@JsonSerializable()
class Klyric {
  final int? version;
  final String? lyric;

  const Klyric({
    this.version,
    this.lyric,
  });

  factory Klyric.fromJson(Map<String, dynamic> json) =>
      _$KlyricFromJson(json);

  Map<String, dynamic> toJson() => _$KlyricToJson(this);

  Klyric copyWith({
    int? version,
    String? lyric,
  }) {
    return Klyric(
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
    );
  }
}

@JsonSerializable()
class Tlyric {
  final int? version;
  final String? lyric;

  const Tlyric({
    this.version,
    this.lyric,
  });

  factory Tlyric.fromJson(Map<String, dynamic> json) =>
      _$TlyricFromJson(json);

  Map<String, dynamic> toJson() => _$TlyricToJson(this);

  Tlyric copyWith({
    int? version,
    String? lyric,
  }) {
    return Tlyric(
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
    );
  }
}

@JsonSerializable()
class Romalrc {
  final int? version;
  final String? lyric;

  const Romalrc({
    this.version,
    this.lyric,
  });

  factory Romalrc.fromJson(Map<String, dynamic> json) =>
      _$RomalrcFromJson(json);

  Map<String, dynamic> toJson() => _$RomalrcToJson(this);

  Romalrc copyWith({
    int? version,
    String? lyric,
  }) {
    return Romalrc(
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
    );
  }
}
