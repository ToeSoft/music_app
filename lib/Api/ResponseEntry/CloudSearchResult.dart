import 'package:json_annotation/json_annotation.dart';

import 'Album.dart';
import 'Artist.dart';
import 'Playlist.dart';
import 'Song.dart';

part 'CloudSearchResult.g.dart';

@JsonSerializable()
class CloudSearchResult {
  final Result? result;
  final int? code;

  const CloudSearchResult({
    this.result,
    this.code,
  });

  factory CloudSearchResult.fromJson(Map<String, dynamic> json) =>
      _$CloudSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$CloudSearchResultToJson(this);

  CloudSearchResult copyWith({
    Result? result,
    int? code,
  }) {
    return CloudSearchResult(
      result: result ?? this.result,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class Result {
  final List<Playlists>? playlists;
  final List<Artist>? artists;
  final List<Song>? songs;
  final List<Album>? albums;
  final int? songCount;
  final int? albumCount;
  final int? artistCount;
  final int? playlistCount;

  const Result({
    this.playlists,
    this.artists,
    this.songs,
    this.albums,
    this.songCount,
    this.albumCount,
    this.artistCount,
    this.playlistCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Result copyWith({
    List<Playlists>? playlists,
    List<Artist>? artists,
    List<Song>? songs,
    List<Album>? albums,
    int? songCount,
    int? albumCount,
    int? artistCount,
    int? playlistCount,
  }) {
    return Result(
      songs: songs ?? this.songs,
      songCount: songCount ?? this.songCount,
      albums: albums ?? this.albums,
      albumCount: albumCount ?? this.albumCount,
      artists: artists ?? this.artists,
      artistCount: artistCount ?? this.artistCount,
      playlists: playlists ?? this.playlists,
      playlistCount: playlistCount ?? this.playlistCount,
    );
  }
}
