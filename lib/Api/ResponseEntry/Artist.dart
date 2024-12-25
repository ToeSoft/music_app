import 'package:json_annotation/json_annotation.dart';

part 'Artist.g.dart';

@JsonSerializable()
class Artist {
  final String? name;
  final int? id;
  final int? picId;
  final int? img1v1Id;
  final String? briefDesc;
  final String? picUrl;
  final String? img1v1Url;
  final int? albumSize;
  final List<dynamic>? alias;
  final String? trans;
  final int? musicSize;
  final int? topicPerson;
  final String? picidStr;
  final List<String>? transNames;
  final bool? followed;
  final String? img1v1idStr;
  final int? img1v1;
  final int? mvSize;

  const Artist({
    this.id,
    this.name,
    this.picUrl,
    this.alias,
    this.albumSize,
    this.picId,
    this.img1v1Url,
    this.img1v1Id,
    this.briefDesc,
    this.trans,
    this.musicSize,
    this.topicPerson,
    this.picidStr,
    this.transNames,
    this.followed,
    this.img1v1idStr,
    this.mvSize,
    this.img1v1,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);

  Artist copyWith({
    String? name,
    int? id,
    int? picId,
    int? img1v1Id,
    String? briefDesc,
    String? picUrl,
    String? img1v1Url,
    int? albumSize,
    List<dynamic>? alias,
    String? trans,
    int? musicSize,
    int? topicPerson,
    String? picidStr,
    List<String>? transNames,
    bool? followed,
    String? img1v1idStr,
    int? mvSize,
    int? img1v1,
  }) {
    return Artist(
      name: name ?? this.name,
      id: id ?? this.id,
      picId: picId ?? this.picId,
      img1v1Id: img1v1Id ?? this.img1v1Id,
      briefDesc: briefDesc ?? this.briefDesc,
      picUrl: picUrl ?? this.picUrl,
      img1v1Url: img1v1Url ?? this.img1v1Url,
      albumSize: albumSize ?? this.albumSize,
      alias: alias ?? this.alias,
      trans: trans ?? this.trans,
      musicSize: musicSize ?? this.musicSize,
      topicPerson: topicPerson ?? this.topicPerson,
      picidStr: picidStr ?? this.picidStr,
      transNames: transNames ?? this.transNames,
      followed: followed ?? this.followed,
      img1v1idStr: img1v1idStr ?? this.img1v1idStr,
      mvSize: mvSize ?? this.mvSize,
      img1v1: img1v1 ?? this.img1v1,
    );
  }
}
