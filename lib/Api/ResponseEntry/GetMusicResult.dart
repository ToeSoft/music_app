import 'package:json_annotation/json_annotation.dart';

part 'GetMusicResult.g.dart';

@JsonSerializable()
class GetMusicResult {
  final int? status;
  final String? msg;
  @JsonKey(name: 'song_info')
  final SongInfo? songInfo;
  final Lrc? lrc;
  final Yrc? yrc;
  @JsonKey(name: 'url_info')
  final UrlInfo? urlInfo;
  @JsonKey(name: 'mv_info')
  final MvInfo? mvInfo;
  final Copyright? copyright;

  const GetMusicResult({
    this.status,
    this.msg,
    this.songInfo,
    this.lrc,
    this.yrc,
    this.urlInfo,
    this.mvInfo,
    this.copyright,
  });

  factory GetMusicResult.fromJson(Map<String, dynamic> json) =>
      _$GetMusicResultFromJson(json);

  Map<String, dynamic> toJson() => _$GetMusicResultToJson(this);

  GetMusicResult copyWith({
    int? status,
    String? msg,
    SongInfo? songInfo,
    Lrc? lrc,
    Yrc? yrc,
    UrlInfo? urlInfo,
    MvInfo? mvInfo,
    Copyright? copyright,
  }) {
    return GetMusicResult(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      songInfo: songInfo ?? this.songInfo,
      lrc: lrc ?? this.lrc,
      yrc: yrc ?? this.yrc,
      urlInfo: urlInfo ?? this.urlInfo,
      mvInfo: mvInfo ?? this.mvInfo,
      copyright: copyright ?? this.copyright,
    );
  }
}

@JsonSerializable()
class SongInfo {
  final String? name;
  final String? alia;
  final String? artist;
  final String? album;
  final String? level;
  final String? cover;

  const SongInfo({
    this.name,
    this.alia,
    this.artist,
    this.album,
    this.level,
    this.cover,
  });

  factory SongInfo.fromJson(Map<String, dynamic> json) =>
      _$SongInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SongInfoToJson(this);

  SongInfo copyWith({
    String? name,
    String? alia,
    String? artist,
    String? album,
    String? level,
    String? cover,
  }) {
    return SongInfo(
      name: name ?? this.name,
      alia: alia ?? this.alia,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      level: level ?? this.level,
      cover: cover ?? this.cover,
    );
  }
}

@JsonSerializable()
class Lrc {
  final String? lyric;
  final String? tlyric;

  const Lrc({
    this.lyric,
    this.tlyric,
  });

  factory Lrc.fromJson(Map<String, dynamic> json) =>
      _$LrcFromJson(json);

  Map<String, dynamic> toJson() => _$LrcToJson(this);

  Lrc copyWith({
    String? lyric,
    String? tlyric,
  }) {
    return Lrc(
      lyric: lyric ?? this.lyric,
      tlyric: tlyric ?? this.tlyric,
    );
  }
}

@JsonSerializable()
class Yrc {
  final String? lyric;

  const Yrc({
    this.lyric,
  });

  factory Yrc.fromJson(Map<String, dynamic> json) =>
      _$YrcFromJson(json);

  Map<String, dynamic> toJson() => _$YrcToJson(this);

  Yrc copyWith({
    String? lyric,
  }) {
    return Yrc(
      lyric: lyric ?? this.lyric,
    );
  }
}

@JsonSerializable()
class UrlInfo {
  final String? url;
  final String? size;
  final String? interval;
  final String? type;

  const UrlInfo({
    this.url,
    this.size,
    this.interval,
    this.type,
  });

  factory UrlInfo.fromJson(Map<String, dynamic> json) =>
      _$UrlInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UrlInfoToJson(this);

  UrlInfo copyWith({
    String? url,
    String? size,
    String? interval,
    String? type,
  }) {
    return UrlInfo(
      url: url ?? this.url,
      size: size ?? this.size,
      interval: interval ?? this.interval,
      type: type ?? this.type,
    );
  }
}

@JsonSerializable()
class MvInfo {
  final String? url;
  final String? size;

  const MvInfo({
    this.url,
    this.size,
  });

  factory MvInfo.fromJson(Map<String, dynamic> json) =>
      _$MvInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MvInfoToJson(this);

  MvInfo copyWith({
    String? url,
    String? size,
  }) {
    return MvInfo(
      url: url ?? this.url,
      size: size ?? this.size,
    );
  }
}

@JsonSerializable()
class Copyright {
  final String? msg;
  @JsonKey(name: 'api_vers')
  final String? apiVers;
  final String? type;
  final String? token;

  const Copyright({
    this.msg,
    this.apiVers,
    this.type,
    this.token,
  });

  factory Copyright.fromJson(Map<String, dynamic> json) =>
      _$CopyrightFromJson(json);

  Map<String, dynamic> toJson() => _$CopyrightToJson(this);

  Copyright copyWith({
    String? msg,
    String? apiVers,
    String? type,
    String? token,
  }) {
    return Copyright(
      msg: msg ?? this.msg,
      apiVers: apiVers ?? this.apiVers,
      type: type ?? this.type,
      token: token ?? this.token,
    );
  }
}
