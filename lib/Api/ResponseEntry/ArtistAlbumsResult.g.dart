// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtistAlbumsResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistAlbumsResult _$ArtistAlbumsResultFromJson(Map<String, dynamic> json) =>
    ArtistAlbumsResult(
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      hotAlbums: (json['hotAlbums'] as List<dynamic>?)
          ?.map((e) => HotAlbums.fromJson(e as Map<String, dynamic>))
          .toList(),
      more: json['more'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArtistAlbumsResultToJson(ArtistAlbumsResult instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'hotAlbums': instance.hotAlbums,
      'more': instance.more,
      'code': instance.code,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      img1v1Id: (json['img1v1Id'] as num?)?.toInt(),
      topicPerson: (json['topicPerson'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      musicSize: (json['musicSize'] as num?)?.toInt(),
      albumSize: (json['albumSize'] as num?)?.toInt(),
      briefDesc: json['briefDesc'] as String?,
      picUrl: json['picUrl'] as String?,
      img1v1Url: json['img1v1Url'] as String?,
      followed: json['followed'] as bool?,
      trans: json['trans'] as String?,
      alias: json['alias'] as List<dynamic>?,
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      picidStr: json['picidStr'] as String?,
      img1v1idStr: json['img1v1idStr'] as String?,
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'img1v1Id': instance.img1v1Id,
      'topicPerson': instance.topicPerson,
      'picId': instance.picId,
      'musicSize': instance.musicSize,
      'albumSize': instance.albumSize,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'followed': instance.followed,
      'trans': instance.trans,
      'alias': instance.alias,
      'name': instance.name,
      'id': instance.id,
      'picidStr': instance.picidStr,
      'img1v1idStr': instance.img1v1idStr,
    };

HotAlbums _$HotAlbumsFromJson(Map<String, dynamic> json) => HotAlbums(
      songs: json['songs'] as List<dynamic>?,
      paid: json['paid'] as bool?,
      onSale: json['onSale'] as bool?,
      mark: (json['mark'] as num?)?.toInt(),
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artists.fromJson(e as Map<String, dynamic>))
          .toList(),
      copyrightId: (json['copyrightId'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      publishTime: (json['publishTime'] as num?)?.toInt(),
      company: json['company'] as String?,
      briefDesc: json['briefDesc'] as String?,
      picUrl: json['picUrl'] as String?,
      commentThreadId: json['commentThreadId'] as String?,
      blurPicUrl: json['blurPicUrl'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      pic: (json['pic'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      subType: json['subType'] as String?,
      alias:
          (json['alias'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      tags: json['tags'] as String?,
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      size: (json['size'] as num?)?.toInt(),
      picidStr: json['picidStr'] as String?,
    );

Map<String, dynamic> _$HotAlbumsToJson(HotAlbums instance) => <String, dynamic>{
      'songs': instance.songs,
      'paid': instance.paid,
      'onSale': instance.onSale,
      'mark': instance.mark,
      'artists': instance.artists,
      'copyrightId': instance.copyrightId,
      'picId': instance.picId,
      'artist': instance.artist,
      'publishTime': instance.publishTime,
      'company': instance.company,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'commentThreadId': instance.commentThreadId,
      'blurPicUrl': instance.blurPicUrl,
      'companyId': instance.companyId,
      'pic': instance.pic,
      'status': instance.status,
      'subType': instance.subType,
      'alias': instance.alias,
      'description': instance.description,
      'tags': instance.tags,
      'name': instance.name,
      'id': instance.id,
      'type': instance.type,
      'size': instance.size,
      'picidStr': instance.picidStr,
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) => Artists(
      img1v1Id: (json['img1v1Id'] as num?)?.toInt(),
      topicPerson: (json['topicPerson'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      musicSize: (json['musicSize'] as num?)?.toInt(),
      albumSize: (json['albumSize'] as num?)?.toInt(),
      briefDesc: json['briefDesc'] as String?,
      picUrl: json['picUrl'] as String?,
      img1v1Url: json['img1v1Url'] as String?,
      followed: json['followed'] as bool?,
      trans: json['trans'] as String?,
      alias: json['alias'] as List<dynamic>?,
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      img1v1idStr: json['img1v1idStr'] as String?,
    );

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'img1v1Id': instance.img1v1Id,
      'topicPerson': instance.topicPerson,
      'picId': instance.picId,
      'musicSize': instance.musicSize,
      'albumSize': instance.albumSize,
      'briefDesc': instance.briefDesc,
      'picUrl': instance.picUrl,
      'img1v1Url': instance.img1v1Url,
      'followed': instance.followed,
      'trans': instance.trans,
      'alias': instance.alias,
      'name': instance.name,
      'id': instance.id,
      'img1v1idStr': instance.img1v1idStr,
    };
