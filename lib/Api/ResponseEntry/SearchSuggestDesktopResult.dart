import 'package:json_annotation/json_annotation.dart';

part 'SearchSuggestDesktopResult.g.dart';

@JsonSerializable()
class SearchSuggestDesktopResult {
  final Result? result;
  final int? code;

  const SearchSuggestDesktopResult({
    this.result,
    this.code,
  });

  factory SearchSuggestDesktopResult.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestDesktopResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestDesktopResultToJson(this);

  SearchSuggestDesktopResult copyWith({
    Result? result,
    int? code,
  }) {
    return SearchSuggestDesktopResult(
      result: result ?? this.result,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class Result {
  final List<Albums>? albums;
  final List<Artists>? artists;
  final List<Songs>? songs;
  final List<String>? order;

  const Result({
    this.albums,
    this.artists,
    this.songs,
    this.order,
  });

  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Result copyWith({
    List<Albums>? albums,
    List<Artists>? artists,
    List<Songs>? songs,
    List<String>? order,
  }) {
    return Result(
      albums: albums ?? this.albums,
      artists: artists ?? this.artists,
      songs: songs ?? this.songs,
      order: order ?? this.order,
    );
  }
}

@JsonSerializable()
class Albums {
  final int? id;
  final String? name;
  final Artist? artist;
  final int? publishTime;
  final int? size;
  final int? copyrightId;
  final int? status;
  final int? picId;
  final int? mark;

  const Albums({
    this.id,
    this.name,
    this.artist,
    this.publishTime,
    this.size,
    this.copyrightId,
    this.status,
    this.picId,
    this.mark,
  });

  factory Albums.fromJson(Map<String, dynamic> json) =>
      _$AlbumsFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsToJson(this);

  Albums copyWith({
    int? id,
    String? name,
    Artist? artist,
    int? publishTime,
    int? size,
    int? copyrightId,
    int? status,
    int? picId,
    int? mark,
  }) {
    return Albums(
      id: id ?? this.id,
      name: name ?? this.name,
      artist: artist ?? this.artist,
      publishTime: publishTime ?? this.publishTime,
      size: size ?? this.size,
      copyrightId: copyrightId ?? this.copyrightId,
      status: status ?? this.status,
      picId: picId ?? this.picId,
      mark: mark ?? this.mark,
    );
  }
}

@JsonSerializable()
class Artist {
  final int? id;
  final String? name;
  final List<dynamic>? alias;
  final int? albumSize;
  final int? picId;
  final String? img1v1Url;
  final int? img1v1;

  const Artist({
    this.id,
    this.name,
    this.alias,
    this.albumSize,
    this.picId,
    this.img1v1Url,
    this.img1v1,
  });

  factory Artist.fromJson(Map<String, dynamic> json) =>
      _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);

  Artist copyWith({
    int? id,
    String? name,
    List<dynamic>? alias,
    int? albumSize,
    int? picId,
    String? img1v1Url,
    int? img1v1,
  }) {
    return Artist(
      id: id ?? this.id,
      name: name ?? this.name,
      alias: alias ?? this.alias,
      albumSize: albumSize ?? this.albumSize,
      picId: picId ?? this.picId,
      img1v1Url: img1v1Url ?? this.img1v1Url,
      img1v1: img1v1 ?? this.img1v1,
    );
  }
}

@JsonSerializable()
class Artists {
  final int? id;
  final String? name;
  final List<dynamic>? alias;
  final int? albumSize;
  final int? picId;
  final String? img1v1Url;
  final int? img1v1;

  const Artists({
    this.id,
    this.name,
    this.alias,
    this.albumSize,
    this.picId,
    this.img1v1Url,
    this.img1v1,
  });

  factory Artists.fromJson(Map<String, dynamic> json) =>
      _$ArtistsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);

  Artists copyWith({
    int? id,
    String? name,
    List<dynamic>? alias,
    int? albumSize,
    int? picId,
    String? img1v1Url,
    int? img1v1,
  }) {
    return Artists(
      id: id ?? this.id,
      name: name ?? this.name,
      alias: alias ?? this.alias,
      albumSize: albumSize ?? this.albumSize,
      picId: picId ?? this.picId,
      img1v1Url: img1v1Url ?? this.img1v1Url,
      img1v1: img1v1 ?? this.img1v1,
    );
  }
}

@JsonSerializable()
class Songs {
  final int? id;
  final String? name;
  final List<Artists>? artists;
  final Album? album;
  final int? duration;
  final int? copyrightId;
  final int? status;
  final List<dynamic>? alias;
  final int? rtype;
  final int? ftype;
  final int? mvid;
  final int? fee;
  final int? mark;

  const Songs({
    this.id,
    this.name,
    this.artists,
    this.album,
    this.duration,
    this.copyrightId,
    this.status,
    this.alias,
    this.rtype,
    this.ftype,
    this.mvid,
    this.fee,
    this.mark,
  });

  factory Songs.fromJson(Map<String, dynamic> json) =>
      _$SongsFromJson(json);

  Map<String, dynamic> toJson() => _$SongsToJson(this);

  Songs copyWith({
    int? id,
    String? name,
    List<Artists>? artists,
    Album? album,
    int? duration,
    int? copyrightId,
    int? status,
    List<dynamic>? alias,
    int? rtype,
    int? ftype,
    int? mvid,
    int? fee,
    int? mark,
  }) {
    return Songs(
      id: id ?? this.id,
      name: name ?? this.name,
      artists: artists ?? this.artists,
      album: album ?? this.album,
      duration: duration ?? this.duration,
      copyrightId: copyrightId ?? this.copyrightId,
      status: status ?? this.status,
      alias: alias ?? this.alias,
      rtype: rtype ?? this.rtype,
      ftype: ftype ?? this.ftype,
      mvid: mvid ?? this.mvid,
      fee: fee ?? this.fee,
      mark: mark ?? this.mark,
    );
  }
}

@JsonSerializable()
class Album {
  final int? id;
  final String? name;
  final Artist? artist;
  final int? publishTime;
  final int? size;
  final int? copyrightId;
  final int? status;
  final int? picId;
  final int? mark;

  const Album({
    this.id,
    this.name,
    this.artist,
    this.publishTime,
    this.size,
    this.copyrightId,
    this.status,
    this.picId,
    this.mark,
  });

  factory Album.fromJson(Map<String, dynamic> json) =>
      _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  Album copyWith({
    int? id,
    String? name,
    Artist? artist,
    int? publishTime,
    int? size,
    int? copyrightId,
    int? status,
    int? picId,
    int? mark,
  }) {
    return Album(
      id: id ?? this.id,
      name: name ?? this.name,
      artist: artist ?? this.artist,
      publishTime: publishTime ?? this.publishTime,
      size: size ?? this.size,
      copyrightId: copyrightId ?? this.copyrightId,
      status: status ?? this.status,
      picId: picId ?? this.picId,
      mark: mark ?? this.mark,
    );
  }
}
