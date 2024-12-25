import 'package:json_annotation/json_annotation.dart';

import 'Creator.dart';

part 'Playlist.g.dart';

@JsonSerializable()
class Playlists {
  final int? id;
  final String? name;
  final String? coverImgUrl;
  final Creator? creator;
  final bool? subscribed;
  final int? trackCount;
  final int? userId;
  final int? playCount;
  final int? bookCount;
  final int? specialType;
  final String? description;
  final bool? highQuality;

  const Playlists({
    this.id,
    this.name,
    this.coverImgUrl,
    this.creator,
    this.subscribed,
    this.trackCount,
    this.userId,
    this.playCount,
    this.bookCount,
    this.specialType,
    this.description,
    this.highQuality,
  });

  factory Playlists.fromJson(Map<String, dynamic> json) =>
      _$PlaylistsFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistsToJson(this);

  Playlists copyWith({
    int? id,
    String? name,
    String? coverImgUrl,
    Creator? creator,
    bool? subscribed,
    int? trackCount,
    int? userId,
    int? playCount,
    int? bookCount,
    int? specialType,
    String? description,
    bool? highQuality,
  }) {
    return Playlists(
      id: id ?? this.id,
      name: name ?? this.name,
      coverImgUrl: coverImgUrl ?? this.coverImgUrl,
      creator: creator ?? this.creator,
      subscribed: subscribed ?? this.subscribed,
      trackCount: trackCount ?? this.trackCount,
      userId: userId ?? this.userId,
      playCount: playCount ?? this.playCount,
      bookCount: bookCount ?? this.bookCount,
      specialType: specialType ?? this.specialType,
      description: description ?? this.description,
      highQuality: highQuality ?? this.highQuality,
    );
  }
}
