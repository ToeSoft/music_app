import 'package:json_annotation/json_annotation.dart';

import 'Album.dart';
import 'Song.dart';

part 'AlbumResult.g.dart';

@JsonSerializable()
class AlbumResult {
  final bool? resourceState;
  final List<Song>? songs;
  final int? code;
  final Album? album;

  const AlbumResult({
    this.resourceState,
    this.songs,
    this.code,
    this.album,
  });

  factory AlbumResult.fromJson(Map<String, dynamic> json) =>
      _$AlbumResultFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumResultToJson(this);

  AlbumResult copyWith({
    bool? resourceState,
    List<Song>? songs,
    int? code,
    Album? album,
  }) {
    return AlbumResult(
      resourceState: resourceState ?? this.resourceState,
      songs: songs ?? this.songs,
      code: code ?? this.code,
      album: album ?? this.album,
    );
  }
}
