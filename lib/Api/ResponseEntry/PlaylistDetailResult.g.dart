// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlaylistDetailResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistDetailResult _$PlaylistDetailResultFromJson(
        Map<String, dynamic> json) =>
    PlaylistDetailResult(
      code: (json['code'] as num?)?.toInt(),
      relatedVideos: json['relatedVideos'],
      playlist: json['playlist'] == null
          ? null
          : Playlist.fromJson(json['playlist'] as Map<String, dynamic>),
      urls: json['urls'],
      privileges: (json['privileges'] as List<dynamic>?)
          ?.map((e) => Privileges.fromJson(e as Map<String, dynamic>))
          .toList(),
      sharedPrivilege: json['sharedPrivilege'],
      resEntrance: json['resEntrance'],
      fromUsers: json['fromUsers'],
      fromUserCount: (json['fromUserCount'] as num?)?.toInt(),
      songFromUsers: json['songFromUsers'],
    );

Map<String, dynamic> _$PlaylistDetailResultToJson(
        PlaylistDetailResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'relatedVideos': instance.relatedVideos,
      'playlist': instance.playlist,
      'urls': instance.urls,
      'privileges': instance.privileges,
      'sharedPrivilege': instance.sharedPrivilege,
      'resEntrance': instance.resEntrance,
      'fromUsers': instance.fromUsers,
      'fromUserCount': instance.fromUserCount,
      'songFromUsers': instance.songFromUsers,
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      coverImgId: (json['coverImgId'] as num?)?.toInt(),
      coverImgUrl: json['coverImgUrl'] as String?,
      coverimgidStr: json['coverimgidStr'] as String?,
      adType: (json['adType'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      createTime: (json['createTime'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      opRecommend: json['opRecommend'] as bool?,
      highQuality: json['highQuality'] as bool?,
      newImported: json['newImported'] as bool?,
      updateTime: (json['updateTime'] as num?)?.toInt(),
      trackCount: (json['trackCount'] as num?)?.toInt(),
      specialType: (json['specialType'] as num?)?.toInt(),
      privacy: (json['privacy'] as num?)?.toInt(),
      trackUpdateTime: (json['trackUpdateTime'] as num?)?.toInt(),
      commentThreadId: json['commentThreadId'] as String?,
      playCount: (json['playCount'] as num?)?.toInt(),
      trackNumberUpdateTime: (json['trackNumberUpdateTime'] as num?)?.toInt(),
      subscribedCount: (json['subscribedCount'] as num?)?.toInt(),
      cloudTrackCount: (json['cloudTrackCount'] as num?)?.toInt(),
      ordered: json['ordered'] as bool?,
      description: json['description'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      backgroundCoverId: (json['backgroundCoverId'] as num?)?.toInt(),
      titleImage: (json['titleImage'] as num?)?.toInt(),
      copied: json['copied'] as bool?,
      coverStatus: (json['coverStatus'] as num?)?.toInt(),
      subscribers: (json['subscribers'] as List<dynamic>?)
          ?.map((e) => Subscribers.fromJson(e as Map<String, dynamic>))
          .toList(),
      creator: json['creator'] == null
          ? null
          : Creator.fromJson(json['creator'] as Map<String, dynamic>),
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => Tracks.fromJson(e as Map<String, dynamic>))
          .toList(),
      trackIds: (json['trackIds'] as List<dynamic>?)
          ?.map((e) => TrackIds.fromJson(e as Map<String, dynamic>))
          .toList(),
      shareCount: (json['shareCount'] as num?)?.toInt(),
      commentCount: (json['commentCount'] as num?)?.toInt(),
      gradeStatus: json['gradeStatus'] as String?,
      algTags:
          (json['algTags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      distributeTags: json['distributeTags'] as List<dynamic>?,
      trialMode: (json['trialMode'] as num?)?.toInt(),
      displayUserInfoAsTagOnly: json['displayUserInfoAsTagOnly'] as bool?,
      playlistType: json['playlistType'] as String?,
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverImgId': instance.coverImgId,
      'coverImgUrl': instance.coverImgUrl,
      'coverimgidStr': instance.coverimgidStr,
      'adType': instance.adType,
      'userId': instance.userId,
      'createTime': instance.createTime,
      'status': instance.status,
      'opRecommend': instance.opRecommend,
      'highQuality': instance.highQuality,
      'newImported': instance.newImported,
      'updateTime': instance.updateTime,
      'trackCount': instance.trackCount,
      'specialType': instance.specialType,
      'privacy': instance.privacy,
      'trackUpdateTime': instance.trackUpdateTime,
      'commentThreadId': instance.commentThreadId,
      'playCount': instance.playCount,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'subscribedCount': instance.subscribedCount,
      'cloudTrackCount': instance.cloudTrackCount,
      'ordered': instance.ordered,
      'description': instance.description,
      'tags': instance.tags,
      'backgroundCoverId': instance.backgroundCoverId,
      'titleImage': instance.titleImage,
      'copied': instance.copied,
      'coverStatus': instance.coverStatus,
      'subscribers': instance.subscribers,
      'creator': instance.creator,
      'tracks': instance.tracks,
      'trackIds': instance.trackIds,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'gradeStatus': instance.gradeStatus,
      'algTags': instance.algTags,
      'distributeTags': instance.distributeTags,
      'trialMode': instance.trialMode,
      'displayUserInfoAsTagOnly': instance.displayUserInfoAsTagOnly,
      'playlistType': instance.playlistType,
    };

Subscribers _$SubscribersFromJson(Map<String, dynamic> json) => Subscribers(
      defaultAvatar: json['defaultAvatar'] as bool?,
      province: (json['province'] as num?)?.toInt(),
      authStatus: (json['authStatus'] as num?)?.toInt(),
      followed: json['followed'] as bool?,
      avatarUrl: json['avatarUrl'] as String?,
      accountStatus: (json['accountStatus'] as num?)?.toInt(),
      gender: (json['gender'] as num?)?.toInt(),
      city: (json['city'] as num?)?.toInt(),
      birthday: (json['birthday'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      userType: (json['userType'] as num?)?.toInt(),
      nickname: json['nickname'] as String?,
      signature: json['signature'] as String?,
      description: json['description'] as String?,
      detailDescription: json['detailDescription'] as String?,
      avatarImgId: (json['avatarImgId'] as num?)?.toInt(),
      backgroundImgId: (json['backgroundImgId'] as num?)?.toInt(),
      backgroundUrl: json['backgroundUrl'] as String?,
      authority: (json['authority'] as num?)?.toInt(),
      mutual: json['mutual'] as bool?,
      djStatus: (json['djStatus'] as num?)?.toInt(),
      vipType: (json['vipType'] as num?)?.toInt(),
      authenticationTypes: (json['authenticationTypes'] as num?)?.toInt(),
      avatarImgIdStr: json['avatarImgIdStr'] as String?,
      backgroundImgIdStr: json['backgroundImgIdStr'] as String?,
      anchor: json['anchor'] as bool?,
      avatarimgidStr: json['avatarimgidStr'] as String?,
    );

Map<String, dynamic> _$SubscribersToJson(Subscribers instance) =>
    <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'city': instance.city,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'authority': instance.authority,
      'mutual': instance.mutual,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'authenticationTypes': instance.authenticationTypes,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'anchor': instance.anchor,
      'avatarimgidStr': instance.avatarimgidStr,
    };

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      defaultAvatar: json['defaultAvatar'] as bool?,
      province: (json['province'] as num?)?.toInt(),
      authStatus: (json['authStatus'] as num?)?.toInt(),
      followed: json['followed'] as bool?,
      avatarUrl: json['avatarUrl'] as String?,
      accountStatus: (json['accountStatus'] as num?)?.toInt(),
      gender: (json['gender'] as num?)?.toInt(),
      city: (json['city'] as num?)?.toInt(),
      birthday: (json['birthday'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      userType: (json['userType'] as num?)?.toInt(),
      nickname: json['nickname'] as String?,
      signature: json['signature'] as String?,
      description: json['description'] as String?,
      detailDescription: json['detailDescription'] as String?,
      avatarImgId: (json['avatarImgId'] as num?)?.toInt(),
      backgroundImgId: (json['backgroundImgId'] as num?)?.toInt(),
      backgroundUrl: json['backgroundUrl'] as String?,
      authority: (json['authority'] as num?)?.toInt(),
      mutual: json['mutual'] as bool?,
      djStatus: (json['djStatus'] as num?)?.toInt(),
      vipType: (json['vipType'] as num?)?.toInt(),
      authenticationTypes: (json['authenticationTypes'] as num?)?.toInt(),
      avatarDetail: json['avatarDetail'] == null
          ? null
          : AvatarDetail.fromJson(json['avatarDetail'] as Map<String, dynamic>),
      avatarImgIdStr: json['avatarImgIdStr'] as String?,
      backgroundImgIdStr: json['backgroundImgIdStr'] as String?,
      anchor: json['anchor'] as bool?,
      avatarimgidStr: json['avatarimgidStr'] as String?,
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'city': instance.city,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'authority': instance.authority,
      'mutual': instance.mutual,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'authenticationTypes': instance.authenticationTypes,
      'avatarDetail': instance.avatarDetail,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'anchor': instance.anchor,
      'avatarimgidStr': instance.avatarimgidStr,
    };

AvatarDetail _$AvatarDetailFromJson(Map<String, dynamic> json) => AvatarDetail(
      userType: (json['userType'] as num?)?.toInt(),
      identityLevel: (json['identityLevel'] as num?)?.toInt(),
      identityIconUrl: json['identityIconUrl'] as String?,
    );

Map<String, dynamic> _$AvatarDetailToJson(AvatarDetail instance) =>
    <String, dynamic>{
      'userType': instance.userType,
      'identityLevel': instance.identityLevel,
      'identityIconUrl': instance.identityIconUrl,
    };

Tracks _$TracksFromJson(Map<String, dynamic> json) => Tracks(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      pst: (json['pst'] as num?)?.toInt(),
      t: (json['t'] as num?)?.toInt(),
      ar: (json['ar'] as List<dynamic>?)
          ?.map((e) => Ar.fromJson(e as Map<String, dynamic>))
          .toList(),
      alia: json['alia'] as List<dynamic>?,
      pop: (json['pop'] as num?)?.toInt(),
      st: (json['st'] as num?)?.toInt(),
      rt: json['rt'] as String?,
      fee: (json['fee'] as num?)?.toInt(),
      v: (json['v'] as num?)?.toInt(),
      cf: json['cf'] as String?,
      al: json['al'] == null
          ? null
          : Al.fromJson(json['al'] as Map<String, dynamic>),
      dt: (json['dt'] as num?)?.toInt(),
      h: json['h'] == null
          ? null
          : H.fromJson(json['h'] as Map<String, dynamic>),
      m: json['m'] == null
          ? null
          : M.fromJson(json['m'] as Map<String, dynamic>),
      l: json['l'] == null
          ? null
          : L.fromJson(json['l'] as Map<String, dynamic>),
      sq: json['sq'] == null
          ? null
          : Sq.fromJson(json['sq'] as Map<String, dynamic>),
      cd: json['cd'] as String?,
      no: (json['no'] as num?)?.toInt(),
      ftype: (json['ftype'] as num?)?.toInt(),
      rtUrls: json['rtUrls'] as List<dynamic>?,
      djId: (json['djId'] as num?)?.toInt(),
      copyright: (json['copyright'] as num?)?.toInt(),
      sId: (json['sId'] as num?)?.toInt(),
      mark: (json['mark'] as num?)?.toInt(),
      originCoverType: (json['originCoverType'] as num?)?.toInt(),
      resourceState: json['resourceState'] as bool?,
      version: (json['version'] as num?)?.toInt(),
      single: (json['single'] as num?)?.toInt(),
      rtype: (json['rtype'] as num?)?.toInt(),
      mst: (json['mst'] as num?)?.toInt(),
      cp: (json['cp'] as num?)?.toInt(),
      mv: (json['mv'] as num?)?.toInt(),
      publishTime: (json['publishTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'pst': instance.pst,
      't': instance.t,
      'ar': instance.ar,
      'alia': instance.alia,
      'pop': instance.pop,
      'st': instance.st,
      'rt': instance.rt,
      'fee': instance.fee,
      'v': instance.v,
      'cf': instance.cf,
      'al': instance.al,
      'dt': instance.dt,
      'h': instance.h,
      'm': instance.m,
      'l': instance.l,
      'sq': instance.sq,
      'cd': instance.cd,
      'no': instance.no,
      'ftype': instance.ftype,
      'rtUrls': instance.rtUrls,
      'djId': instance.djId,
      'copyright': instance.copyright,
      'sId': instance.sId,
      'mark': instance.mark,
      'originCoverType': instance.originCoverType,
      'resourceState': instance.resourceState,
      'version': instance.version,
      'single': instance.single,
      'rtype': instance.rtype,
      'mst': instance.mst,
      'cp': instance.cp,
      'mv': instance.mv,
      'publishTime': instance.publishTime,
    };

Ar _$ArFromJson(Map<String, dynamic> json) => Ar(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      tns: json['tns'] as List<dynamic>?,
      alias: json['alias'] as List<dynamic>?,
    );

Map<String, dynamic> _$ArToJson(Ar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tns': instance.tns,
      'alias': instance.alias,
    };

Al _$AlFromJson(Map<String, dynamic> json) => Al(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      picUrl: json['picUrl'] as String?,
      tns: json['tns'] as List<dynamic>?,
      picStr: json['picStr'] as String?,
      pic: (json['pic'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AlToJson(Al instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'tns': instance.tns,
      'picStr': instance.picStr,
      'pic': instance.pic,
    };

H _$HFromJson(Map<String, dynamic> json) => H(
      br: (json['br'] as num?)?.toInt(),
      fid: (json['fid'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      vd: (json['vd'] as num?)?.toInt(),
      sr: (json['sr'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HToJson(H instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd,
      'sr': instance.sr,
    };

M _$MFromJson(Map<String, dynamic> json) => M(
      br: (json['br'] as num?)?.toInt(),
      fid: (json['fid'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      vd: (json['vd'] as num?)?.toInt(),
      sr: (json['sr'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MToJson(M instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd,
      'sr': instance.sr,
    };

L _$LFromJson(Map<String, dynamic> json) => L(
      br: (json['br'] as num?)?.toInt(),
      fid: (json['fid'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      vd: (json['vd'] as num?)?.toInt(),
      sr: (json['sr'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LToJson(L instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd,
      'sr': instance.sr,
    };

Sq _$SqFromJson(Map<String, dynamic> json) => Sq(
      br: (json['br'] as num?)?.toInt(),
      fid: (json['fid'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      vd: (json['vd'] as num?)?.toInt(),
      sr: (json['sr'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SqToJson(Sq instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd,
      'sr': instance.sr,
    };

TrackIds _$TrackIdsFromJson(Map<String, dynamic> json) => TrackIds(
      id: (json['id'] as num?)?.toInt(),
      v: (json['v'] as num?)?.toInt(),
      t: (json['t'] as num?)?.toInt(),
      at: (json['at'] as num?)?.toInt(),
      uid: (json['uid'] as num?)?.toInt(),
      rcmdReason: json['rcmdReason'] as String?,
      rcmdReasonTitle: json['rcmdReasonTitle'] as String?,
    );

Map<String, dynamic> _$TrackIdsToJson(TrackIds instance) => <String, dynamic>{
      'id': instance.id,
      'v': instance.v,
      't': instance.t,
      'at': instance.at,
      'uid': instance.uid,
      'rcmdReason': instance.rcmdReason,
      'rcmdReasonTitle': instance.rcmdReasonTitle,
    };

Privileges _$PrivilegesFromJson(Map<String, dynamic> json) => Privileges(
      id: (json['id'] as num?)?.toInt(),
      fee: (json['fee'] as num?)?.toInt(),
      payed: (json['payed'] as num?)?.toInt(),
      realPayed: (json['realPayed'] as num?)?.toInt(),
      st: (json['st'] as num?)?.toInt(),
      pl: (json['pl'] as num?)?.toInt(),
      dl: (json['dl'] as num?)?.toInt(),
      sp: (json['sp'] as num?)?.toInt(),
      cp: (json['cp'] as num?)?.toInt(),
      subp: (json['subp'] as num?)?.toInt(),
      cs: json['cs'] as bool?,
      maxbr: (json['maxbr'] as num?)?.toInt(),
      fl: (json['fl'] as num?)?.toInt(),
      toast: json['toast'] as bool?,
      flag: (json['flag'] as num?)?.toInt(),
      paidBigBang: json['paidBigBang'] as bool?,
      preSell: json['preSell'] as bool?,
      playMaxbr: (json['playMaxbr'] as num?)?.toInt(),
      downloadMaxbr: (json['downloadMaxbr'] as num?)?.toInt(),
      maxBrLevel: json['maxBrLevel'] as String?,
      playMaxBrLevel: json['playMaxBrLevel'] as String?,
      downloadMaxBrLevel: json['downloadMaxBrLevel'] as String?,
      plLevel: json['plLevel'] as String?,
      dlLevel: json['dlLevel'] as String?,
      flLevel: json['flLevel'] as String?,
      rscl: (json['rscl'] as num?)?.toInt(),
      freeTrialPrivilege: json['freeTrialPrivilege'] == null
          ? null
          : FreeTrialPrivilege.fromJson(
              json['freeTrialPrivilege'] as Map<String, dynamic>),
      rightSource: (json['rightSource'] as num?)?.toInt(),
      chargeInfoList: (json['chargeInfoList'] as List<dynamic>?)
          ?.map((e) => ChargeInfoList.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PrivilegesToJson(Privileges instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fee': instance.fee,
      'payed': instance.payed,
      'realPayed': instance.realPayed,
      'st': instance.st,
      'pl': instance.pl,
      'dl': instance.dl,
      'sp': instance.sp,
      'cp': instance.cp,
      'subp': instance.subp,
      'cs': instance.cs,
      'maxbr': instance.maxbr,
      'fl': instance.fl,
      'toast': instance.toast,
      'flag': instance.flag,
      'paidBigBang': instance.paidBigBang,
      'preSell': instance.preSell,
      'playMaxbr': instance.playMaxbr,
      'downloadMaxbr': instance.downloadMaxbr,
      'maxBrLevel': instance.maxBrLevel,
      'playMaxBrLevel': instance.playMaxBrLevel,
      'downloadMaxBrLevel': instance.downloadMaxBrLevel,
      'plLevel': instance.plLevel,
      'dlLevel': instance.dlLevel,
      'flLevel': instance.flLevel,
      'rscl': instance.rscl,
      'freeTrialPrivilege': instance.freeTrialPrivilege,
      'rightSource': instance.rightSource,
      'chargeInfoList': instance.chargeInfoList,
      'code': instance.code,
    };

FreeTrialPrivilege _$FreeTrialPrivilegeFromJson(Map<String, dynamic> json) =>
    FreeTrialPrivilege(
      resConsumable: json['resConsumable'] as bool?,
      userConsumable: json['userConsumable'] as bool?,
    );

Map<String, dynamic> _$FreeTrialPrivilegeToJson(FreeTrialPrivilege instance) =>
    <String, dynamic>{
      'resConsumable': instance.resConsumable,
      'userConsumable': instance.userConsumable,
    };

ChargeInfoList _$ChargeInfoListFromJson(Map<String, dynamic> json) =>
    ChargeInfoList(
      rate: (json['rate'] as num?)?.toInt(),
      chargeType: (json['chargeType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChargeInfoListToJson(ChargeInfoList instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'chargeType': instance.chargeType,
    };
