import 'package:json_annotation/json_annotation.dart';

part 'ArtistAlbumsResult.g.dart';

@JsonSerializable()
class ArtistAlbumsResult {
  final Artist? artist;
  final List<HotAlbums>? hotAlbums;
  final bool? more;
  final int? code;

  const ArtistAlbumsResult({
    this.artist,
    this.hotAlbums,
    this.more,
    this.code,
  });

  factory ArtistAlbumsResult.fromJson(Map<String, dynamic> json) =>
      _$ArtistAlbumsResultFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistAlbumsResultToJson(this);

  ArtistAlbumsResult copyWith({
    Artist? artist,
    List<HotAlbums>? hotAlbums,
    bool? more,
    int? code,
  }) {
    return ArtistAlbumsResult(
      artist: artist ?? this.artist,
      hotAlbums: hotAlbums ?? this.hotAlbums,
      more: more ?? this.more,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class Artist {
  final int? img1v1Id;
  final int? topicPerson;
  final int? picId;
  final int? musicSize;
  final int? albumSize;
  final String? briefDesc;
  final String? picUrl;
  final String? img1v1Url;
  final bool? followed;
  final String? trans;
  final List<dynamic>? alias;
  final String? name;
  final int? id;
  final String? picidStr;
  final String? img1v1idStr;

  const Artist({
    this.img1v1Id,
    this.topicPerson,
    this.picId,
    this.musicSize,
    this.albumSize,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.followed,
    this.trans,
    this.alias,
    this.name,
    this.id,
    this.picidStr,
    this.img1v1idStr,
  });

  factory Artist.fromJson(Map<String, dynamic> json) =>
      _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);

  Artist copyWith({
    int? img1v1Id,
    int? topicPerson,
    int? picId,
    int? musicSize,
    int? albumSize,
    String? briefDesc,
    String? picUrl,
    String? img1v1Url,
    bool? followed,
    String? trans,
    List<dynamic>? alias,
    String? name,
    int? id,
    String? picidStr,
    String? img1v1idStr,
  }) {
    return Artist(
      img1v1Id: img1v1Id ?? this.img1v1Id,
      topicPerson: topicPerson ?? this.topicPerson,
      picId: picId ?? this.picId,
      musicSize: musicSize ?? this.musicSize,
      albumSize: albumSize ?? this.albumSize,
      briefDesc: briefDesc ?? this.briefDesc,
      picUrl: picUrl ?? this.picUrl,
      img1v1Url: img1v1Url ?? this.img1v1Url,
      followed: followed ?? this.followed,
      trans: trans ?? this.trans,
      alias: alias ?? this.alias,
      name: name ?? this.name,
      id: id ?? this.id,
      picidStr: picidStr ?? this.picidStr,
      img1v1idStr: img1v1idStr ?? this.img1v1idStr,
    );
  }
}

@JsonSerializable()
class HotAlbums {
  final List<dynamic>? songs;
  final bool? paid;
  final bool? onSale;
  final int? mark;
  final List<Artists>? artists;
  final int? copyrightId;
  final int? picId;
  final Artist? artist;
  final int? publishTime;
  final String? company;
  final String? briefDesc;
  final String? picUrl;
  final String? commentThreadId;
  final String? blurPicUrl;
  final int? companyId;
  final int? pic;
  final int? status;
  final String? subType;
  final List<String>? alias;
  final String? description;
  final String? tags;
  final String? name;
  final int? id;
  final String? type;
  final int? size;
  final String? picidStr;

  const HotAlbums({
    this.songs,
    this.paid,
    this.onSale,
    this.mark,
    this.artists,
    this.copyrightId,
    this.picId,
    this.artist,
    this.publishTime,
    this.company,
    this.briefDesc,
    this.picUrl,
    this.commentThreadId,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.status,
    this.subType,
    this.alias,
    this.description,
    this.tags,
    this.name,
    this.id,
    this.type,
    this.size,
    this.picidStr,
  });

  factory HotAlbums.fromJson(Map<String, dynamic> json) =>
      _$HotAlbumsFromJson(json);

  Map<String, dynamic> toJson() => _$HotAlbumsToJson(this);

  HotAlbums copyWith({
    List<dynamic>? songs,
    bool? paid,
    bool? onSale,
    int? mark,
    List<Artists>? artists,
    int? copyrightId,
    int? picId,
    Artist? artist,
    int? publishTime,
    String? company,
    String? briefDesc,
    String? picUrl,
    String? commentThreadId,
    String? blurPicUrl,
    int? companyId,
    int? pic,
    int? status,
    String? subType,
    List<String>? alias,
    String? description,
    String? tags,
    String? name,
    int? id,
    String? type,
    int? size,
    String? picidStr,
  }) {
    return HotAlbums(
      songs: songs ?? this.songs,
      paid: paid ?? this.paid,
      onSale: onSale ?? this.onSale,
      mark: mark ?? this.mark,
      artists: artists ?? this.artists,
      copyrightId: copyrightId ?? this.copyrightId,
      picId: picId ?? this.picId,
      artist: artist ?? this.artist,
      publishTime: publishTime ?? this.publishTime,
      company: company ?? this.company,
      briefDesc: briefDesc ?? this.briefDesc,
      picUrl: picUrl ?? this.picUrl,
      commentThreadId: commentThreadId ?? this.commentThreadId,
      blurPicUrl: blurPicUrl ?? this.blurPicUrl,
      companyId: companyId ?? this.companyId,
      pic: pic ?? this.pic,
      status: status ?? this.status,
      subType: subType ?? this.subType,
      alias: alias ?? this.alias,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      name: name ?? this.name,
      id: id ?? this.id,
      type: type ?? this.type,
      size: size ?? this.size,
      picidStr: picidStr ?? this.picidStr,
    );
  }
}

@JsonSerializable()
class Artists {
  final int? img1v1Id;
  final int? topicPerson;
  final int? picId;
  final int? musicSize;
  final int? albumSize;
  final String? briefDesc;
  final String? picUrl;
  final String? img1v1Url;
  final bool? followed;
  final String? trans;
  final List<dynamic>? alias;
  final String? name;
  final int? id;
  final String? img1v1idStr;

  const Artists({
    this.img1v1Id,
    this.topicPerson,
    this.picId,
    this.musicSize,
    this.albumSize,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.followed,
    this.trans,
    this.alias,
    this.name,
    this.id,
    this.img1v1idStr,
  });

  factory Artists.fromJson(Map<String, dynamic> json) =>
      _$ArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);

  Artists copyWith({
    int? img1v1Id,
    int? topicPerson,
    int? picId,
    int? musicSize,
    int? albumSize,
    String? briefDesc,
    String? picUrl,
    String? img1v1Url,
    bool? followed,
    String? trans,
    List<dynamic>? alias,
    String? name,
    int? id,
    String? img1v1idStr,
  }) {
    return Artists(
      img1v1Id: img1v1Id ?? this.img1v1Id,
      topicPerson: topicPerson ?? this.topicPerson,
      picId: picId ?? this.picId,
      musicSize: musicSize ?? this.musicSize,
      albumSize: albumSize ?? this.albumSize,
      briefDesc: briefDesc ?? this.briefDesc,
      picUrl: picUrl ?? this.picUrl,
      img1v1Url: img1v1Url ?? this.img1v1Url,
      followed: followed ?? this.followed,
      trans: trans ?? this.trans,
      alias: alias ?? this.alias,
      name: name ?? this.name,
      id: id ?? this.id,
      img1v1idStr: img1v1idStr ?? this.img1v1idStr,
    );
  }
}
