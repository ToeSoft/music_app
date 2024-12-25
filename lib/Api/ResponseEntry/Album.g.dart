// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      idStr: json['idStr'] as String?,
      type: json['type'] as String?,
      size: (json['size'] as num?)?.toInt(),
      picId: (json['picId'] as num?)?.toInt(),
      blurPicUrl: json['blurPicUrl'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      pic: (json['pic'] as num?)?.toInt(),
      picUrl: json['picUrl'] as String?,
      publishTime: (json['publishTime'] as num?)?.toInt(),
      description: json['description'] as String?,
      tags: json['tags'] as String?,
      company: json['company'] as String?,
      briefDesc: json['briefDesc'] as String?,
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      songs: json['songs'] as List<dynamic>?,
      alias: json['alias'] as List<dynamic>?,
      status: (json['status'] as num?)?.toInt(),
      copyrightId: (json['copyrightId'] as num?)?.toInt(),
      commentThreadId: json['commentThreadId'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      onSale: json['onSale'] as bool?,
      picidStr: json['picidStr'] as String?,
      isSub: json['isSub'] as bool?,
      paid: json['paid'] as bool?,
      mark: (json['mark'] as num?)?.toInt(),
      subType: json['subType'] as String?,
      info: json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'idStr': instance.idStr,
      'type': instance.type,
      'size': instance.size,
      'picId': instance.picId,
      'blurPicUrl': instance.blurPicUrl,
      'companyId': instance.companyId,
      'pic': instance.pic,
      'picUrl': instance.picUrl,
      'publishTime': instance.publishTime,
      'description': instance.description,
      'tags': instance.tags,
      'company': instance.company,
      'briefDesc': instance.briefDesc,
      'artist': instance.artist,
      'songs': instance.songs,
      'alias': instance.alias,
      'status': instance.status,
      'copyrightId': instance.copyrightId,
      'commentThreadId': instance.commentThreadId,
      'artists': instance.artists,
      'onSale': instance.onSale,
      'picidStr': instance.picidStr,
      'isSub': instance.isSub,
      'paid': instance.paid,
      'mark': instance.mark,
      'subType': instance.subType,
      'info': instance.info,
    };

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      commentThread: json['commentThread'] == null
          ? null
          : CommentThread.fromJson(
              json['commentThread'] as Map<String, dynamic>),
      liked: json['liked'] as bool?,
      resourceType: (json['resourceType'] as num?)?.toInt(),
      resourceId: (json['resourceId'] as num?)?.toInt(),
      commentCount: (json['commentCount'] as num?)?.toInt(),
      likedCount: (json['likedCount'] as num?)?.toInt(),
      shareCount: (json['shareCount'] as num?)?.toInt(),
      threadId: json['threadId'] as String?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'commentThread': instance.commentThread,
      'liked': instance.liked,
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'threadId': instance.threadId,
    };

CommentThread _$CommentThreadFromJson(Map<String, dynamic> json) =>
    CommentThread(
      id: json['id'] as String?,
      resourceInfo: json['resourceInfo'] == null
          ? null
          : ResourceInfo.fromJson(json['resourceInfo'] as Map<String, dynamic>),
      resourceType: (json['resourceType'] as num?)?.toInt(),
      commentCount: (json['commentCount'] as num?)?.toInt(),
      likedCount: (json['likedCount'] as num?)?.toInt(),
      shareCount: (json['shareCount'] as num?)?.toInt(),
      hotCount: (json['hotCount'] as num?)?.toInt(),
      resourceId: (json['resourceId'] as num?)?.toInt(),
      resourceOwnerId: (json['resourceOwnerId'] as num?)?.toInt(),
      resourceTitle: json['resourceTitle'] as String?,
    );

Map<String, dynamic> _$CommentThreadToJson(CommentThread instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resourceInfo': instance.resourceInfo,
      'resourceType': instance.resourceType,
      'commentCount': instance.commentCount,
      'likedCount': instance.likedCount,
      'shareCount': instance.shareCount,
      'hotCount': instance.hotCount,
      'resourceId': instance.resourceId,
      'resourceOwnerId': instance.resourceOwnerId,
      'resourceTitle': instance.resourceTitle,
    };

ResourceInfo _$ResourceInfoFromJson(Map<String, dynamic> json) => ResourceInfo(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      name: json['name'] as String?,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$ResourceInfoToJson(ResourceInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
    };
