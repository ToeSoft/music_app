import 'package:json_annotation/json_annotation.dart';

part 'PlaylistDetailResult.g.dart';

@JsonSerializable()
class PlaylistDetailResult {
  final int? code;
  final dynamic relatedVideos;
  final Playlist? playlist;
  final dynamic urls;
  final List<Privileges>? privileges;
  final dynamic sharedPrivilege;
  final dynamic resEntrance;
  final dynamic fromUsers;
  final int? fromUserCount;
  final dynamic songFromUsers;

  const PlaylistDetailResult({
    this.code,
    this.relatedVideos,
    this.playlist,
    this.urls,
    this.privileges,
    this.sharedPrivilege,
    this.resEntrance,
    this.fromUsers,
    this.fromUserCount,
    this.songFromUsers,
  });

  factory PlaylistDetailResult.fromJson(Map<String, dynamic> json) =>
      _$PlaylistDetailResultFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistDetailResultToJson(this);

  PlaylistDetailResult copyWith({
    int? code,
    dynamic relatedVideos,
    Playlist? playlist,
    dynamic urls,
    List<Privileges>? privileges,
    dynamic sharedPrivilege,
    dynamic resEntrance,
    dynamic fromUsers,
    int? fromUserCount,
    dynamic songFromUsers,
  }) {
    return PlaylistDetailResult(
      code: code ?? this.code,
      relatedVideos: relatedVideos ?? this.relatedVideos,
      playlist: playlist ?? this.playlist,
      urls: urls ?? this.urls,
      privileges: privileges ?? this.privileges,
      sharedPrivilege: sharedPrivilege ?? this.sharedPrivilege,
      resEntrance: resEntrance ?? this.resEntrance,
      fromUsers: fromUsers ?? this.fromUsers,
      fromUserCount: fromUserCount ?? this.fromUserCount,
      songFromUsers: songFromUsers ?? this.songFromUsers,
    );
  }
}

@JsonSerializable()
class Playlist {
  final int? id;
  final String? name;
  final int? coverImgId;
  final String? coverImgUrl;
  final String? coverimgidStr;
  final int? adType;
  final int? userId;
  final int? createTime;
  final int? status;
  final bool? opRecommend;
  final bool? highQuality;
  final bool? newImported;
  final int? updateTime;
  final int? trackCount;
  final int? specialType;
  final int? privacy;
  final int? trackUpdateTime;
  final String? commentThreadId;
  final int? playCount;
  final int? trackNumberUpdateTime;
  final int? subscribedCount;
  final int? cloudTrackCount;
  final bool? ordered;
  final String? description;
  final List<String>? tags;
  final int? backgroundCoverId;
  final int? titleImage;
  final bool? copied;
  final int? coverStatus;
  final List<Subscribers>? subscribers;
  final Creator? creator;
  final List<Tracks>? tracks;
  final List<TrackIds>? trackIds;
  final int? shareCount;
  final int? commentCount;
  final String? gradeStatus;
  final List<String>? algTags;
  final List<dynamic>? distributeTags;
  final int? trialMode;
  final bool? displayUserInfoAsTagOnly;
  final String? playlistType;

  const Playlist({
    this.id,
    this.name,
    this.coverImgId,
    this.coverImgUrl,
    this.coverimgidStr,
    this.adType,
    this.userId,
    this.createTime,
    this.status,
    this.opRecommend,
    this.highQuality,
    this.newImported,
    this.updateTime,
    this.trackCount,
    this.specialType,
    this.privacy,
    this.trackUpdateTime,
    this.commentThreadId,
    this.playCount,
    this.trackNumberUpdateTime,
    this.subscribedCount,
    this.cloudTrackCount,
    this.ordered,
    this.description,
    this.tags,
    this.backgroundCoverId,
    this.titleImage,
    this.copied,
    this.coverStatus,
    this.subscribers,
    this.creator,
    this.tracks,
    this.trackIds,
    this.shareCount,
    this.commentCount,
    this.gradeStatus,
    this.algTags,
    this.distributeTags,
    this.trialMode,
    this.displayUserInfoAsTagOnly,
    this.playlistType,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  Playlist copyWith({
    int? id,
    String? name,
    int? coverImgId,
    String? coverImgUrl,
    String? coverimgidStr,
    int? adType,
    int? userId,
    int? createTime,
    int? status,
    bool? opRecommend,
    bool? highQuality,
    bool? newImported,
    int? updateTime,
    int? trackCount,
    int? specialType,
    int? privacy,
    int? trackUpdateTime,
    String? commentThreadId,
    int? playCount,
    int? trackNumberUpdateTime,
    int? subscribedCount,
    int? cloudTrackCount,
    bool? ordered,
    String? description,
    List<String>? tags,
    int? backgroundCoverId,
    int? titleImage,
    bool? copied,
    int? coverStatus,
    List<Subscribers>? subscribers,
    Creator? creator,
    List<Tracks>? tracks,
    List<TrackIds>? trackIds,
    int? shareCount,
    int? commentCount,
    String? gradeStatus,
    List<String>? algTags,
    List<dynamic>? distributeTags,
    int? trialMode,
    bool? displayUserInfoAsTagOnly,
    String? playlistType,
  }) {
    return Playlist(
      id: id ?? this.id,
      name: name ?? this.name,
      coverImgId: coverImgId ?? this.coverImgId,
      coverImgUrl: coverImgUrl ?? this.coverImgUrl,
      coverimgidStr: coverimgidStr ?? this.coverimgidStr,
      adType: adType ?? this.adType,
      userId: userId ?? this.userId,
      createTime: createTime ?? this.createTime,
      status: status ?? this.status,
      opRecommend: opRecommend ?? this.opRecommend,
      highQuality: highQuality ?? this.highQuality,
      newImported: newImported ?? this.newImported,
      updateTime: updateTime ?? this.updateTime,
      trackCount: trackCount ?? this.trackCount,
      specialType: specialType ?? this.specialType,
      privacy: privacy ?? this.privacy,
      trackUpdateTime: trackUpdateTime ?? this.trackUpdateTime,
      commentThreadId: commentThreadId ?? this.commentThreadId,
      playCount: playCount ?? this.playCount,
      trackNumberUpdateTime: trackNumberUpdateTime ?? this.trackNumberUpdateTime,
      subscribedCount: subscribedCount ?? this.subscribedCount,
      cloudTrackCount: cloudTrackCount ?? this.cloudTrackCount,
      ordered: ordered ?? this.ordered,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      backgroundCoverId: backgroundCoverId ?? this.backgroundCoverId,
      titleImage: titleImage ?? this.titleImage,
      copied: copied ?? this.copied,
      coverStatus: coverStatus ?? this.coverStatus,
      subscribers: subscribers ?? this.subscribers,
      creator: creator ?? this.creator,
      tracks: tracks ?? this.tracks,
      trackIds: trackIds ?? this.trackIds,
      shareCount: shareCount ?? this.shareCount,
      commentCount: commentCount ?? this.commentCount,
      gradeStatus: gradeStatus ?? this.gradeStatus,
      algTags: algTags ?? this.algTags,
      distributeTags: distributeTags ?? this.distributeTags,
      trialMode: trialMode ?? this.trialMode,
      displayUserInfoAsTagOnly: displayUserInfoAsTagOnly ?? this.displayUserInfoAsTagOnly,
      playlistType: playlistType ?? this.playlistType,
    );
  }
}

@JsonSerializable()
class Subscribers {
  final bool? defaultAvatar;
  final int? province;
  final int? authStatus;
  final bool? followed;
  final String? avatarUrl;
  final int? accountStatus;
  final int? gender;
  final int? city;
  final int? birthday;
  final int? userId;
  final int? userType;
  final String? nickname;
  final String? signature;
  final String? description;
  final String? detailDescription;
  final int? avatarImgId;
  final int? backgroundImgId;
  final String? backgroundUrl;
  final int? authority;
  final bool? mutual;
  final int? djStatus;
  final int? vipType;
  final int? authenticationTypes;
  final String? avatarImgIdStr;
  final String? backgroundImgIdStr;
  final bool? anchor;
  final String? avatarimgidStr;

  const Subscribers({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.djStatus,
    this.vipType,
    this.authenticationTypes,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.anchor,
    this.avatarimgidStr,
  });

  factory Subscribers.fromJson(Map<String, dynamic> json) =>
      _$SubscribersFromJson(json);

  Map<String, dynamic> toJson() => _$SubscribersToJson(this);

  Subscribers copyWith({
    bool? defaultAvatar,
    int? province,
    int? authStatus,
    bool? followed,
    String? avatarUrl,
    int? accountStatus,
    int? gender,
    int? city,
    int? birthday,
    int? userId,
    int? userType,
    String? nickname,
    String? signature,
    String? description,
    String? detailDescription,
    int? avatarImgId,
    int? backgroundImgId,
    String? backgroundUrl,
    int? authority,
    bool? mutual,
    int? djStatus,
    int? vipType,
    int? authenticationTypes,
    String? avatarImgIdStr,
    String? backgroundImgIdStr,
    bool? anchor,
    String? avatarimgidStr,
  }) {
    return Subscribers(
      defaultAvatar: defaultAvatar ?? this.defaultAvatar,
      province: province ?? this.province,
      authStatus: authStatus ?? this.authStatus,
      followed: followed ?? this.followed,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      accountStatus: accountStatus ?? this.accountStatus,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      birthday: birthday ?? this.birthday,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      nickname: nickname ?? this.nickname,
      signature: signature ?? this.signature,
      description: description ?? this.description,
      detailDescription: detailDescription ?? this.detailDescription,
      avatarImgId: avatarImgId ?? this.avatarImgId,
      backgroundImgId: backgroundImgId ?? this.backgroundImgId,
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
      authority: authority ?? this.authority,
      mutual: mutual ?? this.mutual,
      djStatus: djStatus ?? this.djStatus,
      vipType: vipType ?? this.vipType,
      authenticationTypes: authenticationTypes ?? this.authenticationTypes,
      avatarImgIdStr: avatarImgIdStr ?? this.avatarImgIdStr,
      backgroundImgIdStr: backgroundImgIdStr ?? this.backgroundImgIdStr,
      anchor: anchor ?? this.anchor,
      avatarimgidStr: avatarimgidStr ?? this.avatarimgidStr,
    );
  }
}

@JsonSerializable()
class Creator {
  final bool? defaultAvatar;
  final int? province;
  final int? authStatus;
  final bool? followed;
  final String? avatarUrl;
  final int? accountStatus;
  final int? gender;
  final int? city;
  final int? birthday;
  final int? userId;
  final int? userType;
  final String? nickname;
  final String? signature;
  final String? description;
  final String? detailDescription;
  final int? avatarImgId;
  final int? backgroundImgId;
  final String? backgroundUrl;
  final int? authority;
  final bool? mutual;
  final int? djStatus;
  final int? vipType;
  final int? authenticationTypes;
  final AvatarDetail? avatarDetail;
  final String? avatarImgIdStr;
  final String? backgroundImgIdStr;
  final bool? anchor;
  final String? avatarimgidStr;

  const Creator({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.djStatus,
    this.vipType,
    this.authenticationTypes,
    this.avatarDetail,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.anchor,
    this.avatarimgidStr,
  });

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);

  Creator copyWith({
    bool? defaultAvatar,
    int? province,
    int? authStatus,
    bool? followed,
    String? avatarUrl,
    int? accountStatus,
    int? gender,
    int? city,
    int? birthday,
    int? userId,
    int? userType,
    String? nickname,
    String? signature,
    String? description,
    String? detailDescription,
    int? avatarImgId,
    int? backgroundImgId,
    String? backgroundUrl,
    int? authority,
    bool? mutual,
    int? djStatus,
    int? vipType,
    int? authenticationTypes,
    AvatarDetail? avatarDetail,
    String? avatarImgIdStr,
    String? backgroundImgIdStr,
    bool? anchor,
    String? avatarimgidStr,
  }) {
    return Creator(
      defaultAvatar: defaultAvatar ?? this.defaultAvatar,
      province: province ?? this.province,
      authStatus: authStatus ?? this.authStatus,
      followed: followed ?? this.followed,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      accountStatus: accountStatus ?? this.accountStatus,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      birthday: birthday ?? this.birthday,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      nickname: nickname ?? this.nickname,
      signature: signature ?? this.signature,
      description: description ?? this.description,
      detailDescription: detailDescription ?? this.detailDescription,
      avatarImgId: avatarImgId ?? this.avatarImgId,
      backgroundImgId: backgroundImgId ?? this.backgroundImgId,
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
      authority: authority ?? this.authority,
      mutual: mutual ?? this.mutual,
      djStatus: djStatus ?? this.djStatus,
      vipType: vipType ?? this.vipType,
      authenticationTypes: authenticationTypes ?? this.authenticationTypes,
      avatarDetail: avatarDetail ?? this.avatarDetail,
      avatarImgIdStr: avatarImgIdStr ?? this.avatarImgIdStr,
      backgroundImgIdStr: backgroundImgIdStr ?? this.backgroundImgIdStr,
      anchor: anchor ?? this.anchor,
      avatarimgidStr: avatarimgidStr ?? this.avatarimgidStr,
    );
  }
}

@JsonSerializable()
class AvatarDetail {
  final int? userType;
  final int? identityLevel;
  final String? identityIconUrl;

  const AvatarDetail({
    this.userType,
    this.identityLevel,
    this.identityIconUrl,
  });

  factory AvatarDetail.fromJson(Map<String, dynamic> json) =>
      _$AvatarDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarDetailToJson(this);

  AvatarDetail copyWith({
    int? userType,
    int? identityLevel,
    String? identityIconUrl,
  }) {
    return AvatarDetail(
      userType: userType ?? this.userType,
      identityLevel: identityLevel ?? this.identityLevel,
      identityIconUrl: identityIconUrl ?? this.identityIconUrl,
    );
  }
}

@JsonSerializable()
class Tracks {
  final String? name;
  final int? id;
  final int? pst;
  final int? t;
  final List<Ar>? ar;
  final List<dynamic>? alia;
  final int? pop;
  final int? st;
  final String? rt;
  final int? fee;
  final int? v;
  final String? cf;
  final Al? al;
  final int? dt;
  final H? h;
  final M? m;
  final L? l;
  final Sq? sq;
  final String? cd;
  final int? no;
  final int? ftype;
  final List<dynamic>? rtUrls;
  final int? djId;
  final int? copyright;
  final int? sId;
  final int? mark;
  final int? originCoverType;
  final bool? resourceState;
  final int? version;
  final int? single;
  final int? rtype;
  final int? mst;
  final int? cp;
  final int? mv;
  final int? publishTime;

  const Tracks({
    this.name,
    this.id,
    this.pst,
    this.t,
    this.ar,
    this.alia,
    this.pop,
    this.st,
    this.rt,
    this.fee,
    this.v,
    this.cf,
    this.al,
    this.dt,
    this.h,
    this.m,
    this.l,
    this.sq,
    this.cd,
    this.no,
    this.ftype,
    this.rtUrls,
    this.djId,
    this.copyright,
    this.sId,
    this.mark,
    this.originCoverType,
    this.resourceState,
    this.version,
    this.single,
    this.rtype,
    this.mst,
    this.cp,
    this.mv,
    this.publishTime,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) =>
      _$TracksFromJson(json);

  Map<String, dynamic> toJson() => _$TracksToJson(this);

  Tracks copyWith({
    String? name,
    int? id,
    int? pst,
    int? t,
    List<Ar>? ar,
    List<dynamic>? alia,
    int? pop,
    int? st,
    String? rt,
    int? fee,
    int? v,
    String? cf,
    Al? al,
    int? dt,
    H? h,
    M? m,
    L? l,
    Sq? sq,
    String? cd,
    int? no,
    int? ftype,
    List<dynamic>? rtUrls,
    int? djId,
    int? copyright,
    int? sId,
    int? mark,
    int? originCoverType,
    bool? resourceState,
    int? version,
    int? single,
    int? rtype,
    int? mst,
    int? cp,
    int? mv,
    int? publishTime,
  }) {
    return Tracks(
      name: name ?? this.name,
      id: id ?? this.id,
      pst: pst ?? this.pst,
      t: t ?? this.t,
      ar: ar ?? this.ar,
      alia: alia ?? this.alia,
      pop: pop ?? this.pop,
      st: st ?? this.st,
      rt: rt ?? this.rt,
      fee: fee ?? this.fee,
      v: v ?? this.v,
      cf: cf ?? this.cf,
      al: al ?? this.al,
      dt: dt ?? this.dt,
      h: h ?? this.h,
      m: m ?? this.m,
      l: l ?? this.l,
      sq: sq ?? this.sq,
      cd: cd ?? this.cd,
      no: no ?? this.no,
      ftype: ftype ?? this.ftype,
      rtUrls: rtUrls ?? this.rtUrls,
      djId: djId ?? this.djId,
      copyright: copyright ?? this.copyright,
      sId: sId ?? this.sId,
      mark: mark ?? this.mark,
      originCoverType: originCoverType ?? this.originCoverType,
      resourceState: resourceState ?? this.resourceState,
      version: version ?? this.version,
      single: single ?? this.single,
      rtype: rtype ?? this.rtype,
      mst: mst ?? this.mst,
      cp: cp ?? this.cp,
      mv: mv ?? this.mv,
      publishTime: publishTime ?? this.publishTime,
    );
  }
}

@JsonSerializable()
class Ar {
  final int? id;
  final String? name;
  final List<dynamic>? tns;
  final List<dynamic>? alias;

  const Ar({
    this.id,
    this.name,
    this.tns,
    this.alias,
  });

  factory Ar.fromJson(Map<String, dynamic> json) =>
      _$ArFromJson(json);

  Map<String, dynamic> toJson() => _$ArToJson(this);

  Ar copyWith({
    int? id,
    String? name,
    List<dynamic>? tns,
    List<dynamic>? alias,
  }) {
    return Ar(
      id: id ?? this.id,
      name: name ?? this.name,
      tns: tns ?? this.tns,
      alias: alias ?? this.alias,
    );
  }
}

@JsonSerializable()
class Al {
  final int? id;
  final String? name;
  final String? picUrl;
  final List<dynamic>? tns;
  final String? picStr;
  final int? pic;

  const Al({
    this.id,
    this.name,
    this.picUrl,
    this.tns,
    this.picStr,
    this.pic,
  });

  factory Al.fromJson(Map<String, dynamic> json) =>
      _$AlFromJson(json);

  Map<String, dynamic> toJson() => _$AlToJson(this);

  Al copyWith({
    int? id,
    String? name,
    String? picUrl,
    List<dynamic>? tns,
    String? picStr,
    int? pic,
  }) {
    return Al(
      id: id ?? this.id,
      name: name ?? this.name,
      picUrl: picUrl ?? this.picUrl,
      tns: tns ?? this.tns,
      picStr: picStr ?? this.picStr,
      pic: pic ?? this.pic,
    );
  }
}

@JsonSerializable()
class H {
  final int? br;
  final int? fid;
  final int? size;
  final int? vd;
  final int? sr;

  const H({
    this.br,
    this.fid,
    this.size,
    this.vd,
    this.sr,
  });

  factory H.fromJson(Map<String, dynamic> json) =>
      _$HFromJson(json);

  Map<String, dynamic> toJson() => _$HToJson(this);

  H copyWith({
    int? br,
    int? fid,
    int? size,
    int? vd,
    int? sr,
  }) {
    return H(
      br: br ?? this.br,
      fid: fid ?? this.fid,
      size: size ?? this.size,
      vd: vd ?? this.vd,
      sr: sr ?? this.sr,
    );
  }
}

@JsonSerializable()
class M {
  final int? br;
  final int? fid;
  final int? size;
  final int? vd;
  final int? sr;

  const M({
    this.br,
    this.fid,
    this.size,
    this.vd,
    this.sr,
  });

  factory M.fromJson(Map<String, dynamic> json) =>
      _$MFromJson(json);

  Map<String, dynamic> toJson() => _$MToJson(this);

  M copyWith({
    int? br,
    int? fid,
    int? size,
    int? vd,
    int? sr,
  }) {
    return M(
      br: br ?? this.br,
      fid: fid ?? this.fid,
      size: size ?? this.size,
      vd: vd ?? this.vd,
      sr: sr ?? this.sr,
    );
  }
}

@JsonSerializable()
class L {
  final int? br;
  final int? fid;
  final int? size;
  final int? vd;
  final int? sr;

  const L({
    this.br,
    this.fid,
    this.size,
    this.vd,
    this.sr,
  });

  factory L.fromJson(Map<String, dynamic> json) =>
      _$LFromJson(json);

  Map<String, dynamic> toJson() => _$LToJson(this);

  L copyWith({
    int? br,
    int? fid,
    int? size,
    int? vd,
    int? sr,
  }) {
    return L(
      br: br ?? this.br,
      fid: fid ?? this.fid,
      size: size ?? this.size,
      vd: vd ?? this.vd,
      sr: sr ?? this.sr,
    );
  }
}

@JsonSerializable()
class Sq {
  final int? br;
  final int? fid;
  final int? size;
  final int? vd;
  final int? sr;

  const Sq({
    this.br,
    this.fid,
    this.size,
    this.vd,
    this.sr,
  });

  factory Sq.fromJson(Map<String, dynamic> json) =>
      _$SqFromJson(json);

  Map<String, dynamic> toJson() => _$SqToJson(this);

  Sq copyWith({
    int? br,
    int? fid,
    int? size,
    int? vd,
    int? sr,
  }) {
    return Sq(
      br: br ?? this.br,
      fid: fid ?? this.fid,
      size: size ?? this.size,
      vd: vd ?? this.vd,
      sr: sr ?? this.sr,
    );
  }
}

@JsonSerializable()
class TrackIds {
  final int? id;
  final int? v;
  final int? t;
  final int? at;
  final int? uid;
  final String? rcmdReason;
  final String? rcmdReasonTitle;

  const TrackIds({
    this.id,
    this.v,
    this.t,
    this.at,
    this.uid,
    this.rcmdReason,
    this.rcmdReasonTitle,
  });

  factory TrackIds.fromJson(Map<String, dynamic> json) =>
      _$TrackIdsFromJson(json);

  Map<String, dynamic> toJson() => _$TrackIdsToJson(this);

  TrackIds copyWith({
    int? id,
    int? v,
    int? t,
    int? at,
    int? uid,
    String? rcmdReason,
    String? rcmdReasonTitle,
  }) {
    return TrackIds(
      id: id ?? this.id,
      v: v ?? this.v,
      t: t ?? this.t,
      at: at ?? this.at,
      uid: uid ?? this.uid,
      rcmdReason: rcmdReason ?? this.rcmdReason,
      rcmdReasonTitle: rcmdReasonTitle ?? this.rcmdReasonTitle,
    );
  }
}



@JsonSerializable()
class Privileges {
  final int? id;
  final int? fee;
  final int? payed;
  final int? realPayed;
  final int? st;
  final int? pl;
  final int? dl;
  final int? sp;
  final int? cp;
  final int? subp;
  final bool? cs;
  final int? maxbr;
  final int? fl;
  final bool? toast;
  final int? flag;
  final bool? paidBigBang;
  final bool? preSell;
  final int? playMaxbr;
  final int? downloadMaxbr;
  final String? maxBrLevel;
  final String? playMaxBrLevel;
  final String? downloadMaxBrLevel;
  final String? plLevel;
  final String? dlLevel;
  final String? flLevel;
  final int? rscl;
  final FreeTrialPrivilege? freeTrialPrivilege;
  final int? rightSource;
  final List<ChargeInfoList>? chargeInfoList;
  final int? code;

  const Privileges({
    this.id,
    this.fee,
    this.payed,
    this.realPayed,
    this.st,
    this.pl,
    this.dl,
    this.sp,
    this.cp,
    this.subp,
    this.cs,
    this.maxbr,
    this.fl,
    this.toast,
    this.flag,
    this.paidBigBang,
    this.preSell,
    this.playMaxbr,
    this.downloadMaxbr,
    this.maxBrLevel,
    this.playMaxBrLevel,
    this.downloadMaxBrLevel,
    this.plLevel,
    this.dlLevel,
    this.flLevel,
    this.rscl,
    this.freeTrialPrivilege,
    this.rightSource,
    this.chargeInfoList,
    this.code,
  });

  factory Privileges.fromJson(Map<String, dynamic> json) =>
      _$PrivilegesFromJson(json);

  Map<String, dynamic> toJson() => _$PrivilegesToJson(this);

  Privileges copyWith({
    int? id,
    int? fee,
    int? payed,
    int? realPayed,
    int? st,
    int? pl,
    int? dl,
    int? sp,
    int? cp,
    int? subp,
    bool? cs,
    int? maxbr,
    int? fl,
    bool? toast,
    int? flag,
    bool? paidBigBang,
    bool? preSell,
    int? playMaxbr,
    int? downloadMaxbr,
    String? maxBrLevel,
    String? playMaxBrLevel,
    String? downloadMaxBrLevel,
    String? plLevel,
    String? dlLevel,
    String? flLevel,
    int? rscl,
    FreeTrialPrivilege? freeTrialPrivilege,
    int? rightSource,
    List<ChargeInfoList>? chargeInfoList,
    int? code,
  }) {
    return Privileges(
      id: id ?? this.id,
      fee: fee ?? this.fee,
      payed: payed ?? this.payed,
      realPayed: realPayed ?? this.realPayed,
      st: st ?? this.st,
      pl: pl ?? this.pl,
      dl: dl ?? this.dl,
      sp: sp ?? this.sp,
      cp: cp ?? this.cp,
      subp: subp ?? this.subp,
      cs: cs ?? this.cs,
      maxbr: maxbr ?? this.maxbr,
      fl: fl ?? this.fl,
      toast: toast ?? this.toast,
      flag: flag ?? this.flag,
      paidBigBang: paidBigBang ?? this.paidBigBang,
      preSell: preSell ?? this.preSell,
      playMaxbr: playMaxbr ?? this.playMaxbr,
      downloadMaxbr: downloadMaxbr ?? this.downloadMaxbr,
      maxBrLevel: maxBrLevel ?? this.maxBrLevel,
      playMaxBrLevel: playMaxBrLevel ?? this.playMaxBrLevel,
      downloadMaxBrLevel: downloadMaxBrLevel ?? this.downloadMaxBrLevel,
      plLevel: plLevel ?? this.plLevel,
      dlLevel: dlLevel ?? this.dlLevel,
      flLevel: flLevel ?? this.flLevel,
      rscl: rscl ?? this.rscl,
      freeTrialPrivilege: freeTrialPrivilege ?? this.freeTrialPrivilege,
      rightSource: rightSource ?? this.rightSource,
      chargeInfoList: chargeInfoList ?? this.chargeInfoList,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class FreeTrialPrivilege {
  final bool? resConsumable;
  final bool? userConsumable;

  const FreeTrialPrivilege({
    this.resConsumable,
    this.userConsumable,
  });

  factory FreeTrialPrivilege.fromJson(Map<String, dynamic> json) =>
      _$FreeTrialPrivilegeFromJson(json);

  Map<String, dynamic> toJson() => _$FreeTrialPrivilegeToJson(this);

  FreeTrialPrivilege copyWith({
    bool? resConsumable,
    bool? userConsumable,
  }) {
    return FreeTrialPrivilege(
      resConsumable: resConsumable ?? this.resConsumable,
      userConsumable: userConsumable ?? this.userConsumable,
    );
  }
}

@JsonSerializable()
class ChargeInfoList {
  final int? rate;
  final int? chargeType;

  const ChargeInfoList({
    this.rate,
    this.chargeType,
  });

  factory ChargeInfoList.fromJson(Map<String, dynamic> json) =>
      _$ChargeInfoListFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeInfoListToJson(this);

  ChargeInfoList copyWith({
    int? rate,
    int? chargeType,
  }) {
    return ChargeInfoList(
      rate: rate ?? this.rate,
      chargeType: chargeType ?? this.chargeType,
    );
  }
}
