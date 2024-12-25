// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchSuggestDesktopResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestDesktopResult _$SearchSuggestDesktopResultFromJson(
        Map<String, dynamic> json) =>
    SearchSuggestDesktopResult(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchSuggestDesktopResultToJson(
        SearchSuggestDesktopResult instance) =>
    <String, dynamic>{
      'result': instance.result,
      'code': instance.code,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      albums: (json['albums'] as List<dynamic>?)
          ?.map((e) => Albums.fromJson(e as Map<String, dynamic>))
          .toList(),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      songs: (json['songs'] as List<dynamic>?)
          ?.map((e) => Songs.fromJson(e as Map<String, dynamic>))
          .toList(),
      order:
          (json['order'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'albums': instance.albums,
      'artists': instance.artists,
      'songs': instance.songs,
      'order': instance.order,
    };

Albums _$AlbumsFromJson(Map<String, dynamic> json) => Albums(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      publishTime: (json['publishTime'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      copyrightId: (json['copyrightId'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      mark: (json['mark'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AlbumsToJson(Albums instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artist': instance.artist,
      'publishTime': instance.publishTime,
      'size': instance.size,
      'copyrightId': instance.copyrightId,
      'status': instance.status,
      'picId': instance.picId,
      'mark': instance.mark,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      alias: json['alias'] as List<dynamic>?,
      albumSize: (json['albumSize'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      img1v1Url: json['img1v1Url'] as String?,
      img1v1: (json['img1v1'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alias': instance.alias,
      'albumSize': instance.albumSize,
      'picId': instance.picId,
      'img1v1Url': instance.img1v1Url,
      'img1v1': instance.img1v1,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) => Artists(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      alias: json['alias'] as List<dynamic>?,
      albumSize: (json['albumSize'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      img1v1Url: json['img1v1Url'] as String?,
      img1v1: (json['img1v1'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alias': instance.alias,
      'albumSize': instance.albumSize,
      'picId': instance.picId,
      'img1v1Url': instance.img1v1Url,
      'img1v1': instance.img1v1,
    };

Songs _$SongsFromJson(Map<String, dynamic> json) => Songs(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      duration: (json['duration'] as num?)?.toInt(),
      copyrightId: (json['copyrightId'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      alias: json['alias'] as List<dynamic>?,
      rtype: (json['rtype'] as num?)?.toInt(),
      ftype: (json['ftype'] as num?)?.toInt(),
      mvid: (json['mvid'] as num?)?.toInt(),
      fee: (json['fee'] as num?)?.toInt(),
      mark: (json['mark'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SongsToJson(Songs instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artists': instance.artists,
      'album': instance.album,
      'duration': instance.duration,
      'copyrightId': instance.copyrightId,
      'status': instance.status,
      'alias': instance.alias,
      'rtype': instance.rtype,
      'ftype': instance.ftype,
      'mvid': instance.mvid,
      'fee': instance.fee,
      'mark': instance.mark,
    };

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      publishTime: (json['publishTime'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      copyrightId: (json['copyrightId'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      mark: (json['mark'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artist': instance.artist,
      'publishTime': instance.publishTime,
      'size': instance.size,
      'copyrightId': instance.copyrightId,
      'status': instance.status,
      'picId': instance.picId,
      'mark': instance.mark,
    };
