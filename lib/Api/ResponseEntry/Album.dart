import 'package:json_annotation/json_annotation.dart';

import 'Artist.dart';

part 'Album.g.dart';

@JsonSerializable()
class Album {
  final String? name;
  final int? id;
  final String? idStr;
  final String? type;
  final int? size;
  final int? picId;
  final String? blurPicUrl;
  final int? companyId;
  final int? pic;
  final String? picUrl;
  final int? publishTime;
  final String? description;
  final String? tags;
  final String? company;
  final String? briefDesc;
  final Artist? artist;
  final List<dynamic>? songs;
  final List<dynamic>? alias;
  final int? status;
  final int? copyrightId;
  final String? commentThreadId;
  final List<Artist>? artists;
  final bool? onSale;
  final String? picidStr;
  final bool? isSub;
  final bool? paid;
  final int? mark;
  final String? subType;
  final Info? info;

  const Album({
    this.name,
    this.id,
    this.idStr,
    this.type,
    this.size,
    this.picId,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.picUrl,
    this.publishTime,
    this.description,
    this.tags,
    this.company,
    this.briefDesc,
    this.artist,
    this.songs,
    this.alias,
    this.status,
    this.copyrightId,
    this.commentThreadId,
    this.artists,
    this.onSale,
    this.picidStr,
    this.isSub,
    this.paid,
    this.mark,
    this.subType,
    this.info,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  Album copyWith({
    String? name,
    int? id,
    String? idStr,
    String? type,
    int? size,
    int? picId,
    String? blurPicUrl,
    int? companyId,
    int? pic,
    String? picUrl,
    int? publishTime,
    String? description,
    String? tags,
    String? company,
    String? briefDesc,
    Artist? artist,
    List<dynamic>? songs,
    List<dynamic>? alias,
    int? status,
    int? copyrightId,
    String? commentThreadId,
    List<Artist>? artists,
    bool? onSale,
    String? picidStr,
    bool? isSub,
    bool? paid,
    int? mark,
    String? subType,
    Info? info,
  }) {
    return Album(
      name: name ?? this.name,
      id: id ?? this.id,
      idStr: idStr ?? this.idStr,
      type: type ?? this.type,
      size: size ?? this.size,
      picId: picId ?? this.picId,
      blurPicUrl: blurPicUrl ?? this.blurPicUrl,
      companyId: companyId ?? this.companyId,
      pic: pic ?? this.pic,
      picUrl: picUrl ?? this.picUrl,
      publishTime: publishTime ?? this.publishTime,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      company: company ?? this.company,
      briefDesc: briefDesc ?? this.briefDesc,
      artist: artist ?? this.artist,
      songs: songs ?? this.songs,
      alias: alias ?? this.alias,
      status: status ?? this.status,
      copyrightId: copyrightId ?? this.copyrightId,
      commentThreadId: commentThreadId ?? this.commentThreadId,
      artists: artists ?? this.artists,
      onSale: onSale ?? this.onSale,
      picidStr: picidStr ?? this.picidStr,
      isSub: isSub ?? this.isSub,
      paid: paid ?? this.paid,
      mark: mark ?? this.mark,
      subType: subType ?? this.subType,
      info: info ?? this.info,
    );
  }
}

@JsonSerializable()
class Info {
  final CommentThread? commentThread;
  final bool? liked;
  final int? resourceType;
  final int? resourceId;
  final int? commentCount;
  final int? likedCount;
  final int? shareCount;
  final String? threadId;

  const Info({
    this.commentThread,
    this.liked,
    this.resourceType,
    this.resourceId,
    this.commentCount,
    this.likedCount,
    this.shareCount,
    this.threadId,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  Info copyWith({
    CommentThread? commentThread,
    bool? liked,
    int? resourceType,
    int? resourceId,
    int? commentCount,
    int? likedCount,
    int? shareCount,
    String? threadId,
  }) {
    return Info(
      commentThread: commentThread ?? this.commentThread,
      liked: liked ?? this.liked,
      resourceType: resourceType ?? this.resourceType,
      resourceId: resourceId ?? this.resourceId,
      commentCount: commentCount ?? this.commentCount,
      likedCount: likedCount ?? this.likedCount,
      shareCount: shareCount ?? this.shareCount,
      threadId: threadId ?? this.threadId,
    );
  }
}

@JsonSerializable()
class CommentThread {
  final String? id;
  final ResourceInfo? resourceInfo;
  final int? resourceType;
  final int? commentCount;
  final int? likedCount;
  final int? shareCount;
  final int? hotCount;
  final int? resourceId;
  final int? resourceOwnerId;
  final String? resourceTitle;

  const CommentThread({
    this.id,
    this.resourceInfo,
    this.resourceType,
    this.commentCount,
    this.likedCount,
    this.shareCount,
    this.hotCount,
    this.resourceId,
    this.resourceOwnerId,
    this.resourceTitle,
  });

  factory CommentThread.fromJson(Map<String, dynamic> json) =>
      _$CommentThreadFromJson(json);

  Map<String, dynamic> toJson() => _$CommentThreadToJson(this);

  CommentThread copyWith({
    String? id,
    ResourceInfo? resourceInfo,
    int? resourceType,
    int? commentCount,
    int? likedCount,
    int? shareCount,
    int? hotCount,
    int? resourceId,
    int? resourceOwnerId,
    String? resourceTitle,
  }) {
    return CommentThread(
      id: id ?? this.id,
      resourceInfo: resourceInfo ?? this.resourceInfo,
      resourceType: resourceType ?? this.resourceType,
      commentCount: commentCount ?? this.commentCount,
      likedCount: likedCount ?? this.likedCount,
      shareCount: shareCount ?? this.shareCount,
      hotCount: hotCount ?? this.hotCount,
      resourceId: resourceId ?? this.resourceId,
      resourceOwnerId: resourceOwnerId ?? this.resourceOwnerId,
      resourceTitle: resourceTitle ?? this.resourceTitle,
    );
  }
}

@JsonSerializable()
class ResourceInfo {
  final int? id;
  final int? userId;
  final String? name;
  final String? imgUrl;

  const ResourceInfo({
    this.id,
    this.userId,
    this.name,
    this.imgUrl,
  });

  factory ResourceInfo.fromJson(Map<String, dynamic> json) =>
      _$ResourceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceInfoToJson(this);

  ResourceInfo copyWith({
    int? id,
    int? userId,
    String? name,
    String? imgUrl,
  }) {
    return ResourceInfo(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }
}
