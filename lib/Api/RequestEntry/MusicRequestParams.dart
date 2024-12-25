import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:json_annotation/json_annotation.dart';

part 'MusicRequestParams.g.dart';

@JsonSerializable()
class MusicRequestParams {
  final String? level;
  final String? type;
  final String? url;
  final String? token;

  const MusicRequestParams({this.level, this.type, this.url, this.token});

  factory MusicRequestParams.fromJson(Map<String, dynamic> json) =>
      _$MusicRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$MusicRequestParamsToJson(this);
}

getMusicParams(String id) {
  final level = "exhigh";
  final type = "song";
  final url = "https://music.163.com/#/song?id=$id";

  // 对 token 进行 MD5 运算
  final md5Token =
      md5.convert(utf8.encode(dotenv.get("NETEASE_MUSIC_TOKEN"))).toString();

  return MusicRequestParams(
    level: level,
    type: type,
    url: url,
    token: md5Token,
  );
}
