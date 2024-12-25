// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtistDetailResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDetailResult _$ArtistDetailResultFromJson(Map<String, dynamic> json) =>
    ArtistDetailResult(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtistDetailResultToJson(ArtistDetailResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      videoCount: (json['videoCount'] as num?)?.toInt(),
      vipRights: json['vipRights'] == null
          ? null
          : VipRights.fromJson(json['vipRights'] as Map<String, dynamic>),
      identify: json['identify'] == null
          ? null
          : Identify.fromJson(json['identify'] as Map<String, dynamic>),
      artist: json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      blacklist: json['blacklist'] as bool?,
      preferShow: (json['preferShow'] as num?)?.toInt(),
      showPriMsg: json['showPriMsg'] as bool?,
      secondaryExpertIdentiy: (json['secondaryExpertIdentiy'] as List<dynamic>?)
          ?.map(
              (e) => SecondaryExpertIdentiy.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventCount: (json['eventCount'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'videoCount': instance.videoCount,
      'vipRights': instance.vipRights,
      'identify': instance.identify,
      'artist': instance.artist,
      'blacklist': instance.blacklist,
      'preferShow': instance.preferShow,
      'showPriMsg': instance.showPriMsg,
      'secondaryExpertIdentiy': instance.secondaryExpertIdentiy,
      'eventCount': instance.eventCount,
      'user': instance.user,
    };

VipRights _$VipRightsFromJson(Map<String, dynamic> json) => VipRights(
      rightsInfoDetailDtoList:
          (json['rightsInfoDetailDtoList'] as List<dynamic>?)
              ?.map((e) =>
                  RightsInfoDetailDtoList.fromJson(e as Map<String, dynamic>))
              .toList(),
      oldProtocol: json['oldProtocol'] as bool?,
      redVipAnnualCount: (json['redVipAnnualCount'] as num?)?.toInt(),
      redVipLevel: (json['redVipLevel'] as num?)?.toInt(),
      now: (json['now'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VipRightsToJson(VipRights instance) => <String, dynamic>{
      'rightsInfoDetailDtoList': instance.rightsInfoDetailDtoList,
      'oldProtocol': instance.oldProtocol,
      'redVipAnnualCount': instance.redVipAnnualCount,
      'redVipLevel': instance.redVipLevel,
      'now': instance.now,
    };

RightsInfoDetailDtoList _$RightsInfoDetailDtoListFromJson(
        Map<String, dynamic> json) =>
    RightsInfoDetailDtoList(
      vipCode: (json['vipCode'] as num?)?.toInt(),
      expireTime: (json['expireTime'] as num?)?.toInt(),
      vipLevel: (json['vipLevel'] as num?)?.toInt(),
      signIap: json['signIap'] as bool?,
      signDeduct: json['signDeduct'] as bool?,
      signIapDeduct: json['signIapDeduct'] as bool?,
      sign: json['sign'] as bool?,
    );

Map<String, dynamic> _$RightsInfoDetailDtoListToJson(
        RightsInfoDetailDtoList instance) =>
    <String, dynamic>{
      'vipCode': instance.vipCode,
      'expireTime': instance.expireTime,
      'vipLevel': instance.vipLevel,
      'signIap': instance.signIap,
      'signDeduct': instance.signDeduct,
      'signIapDeduct': instance.signIapDeduct,
      'sign': instance.sign,
    };

Identify _$IdentifyFromJson(Map<String, dynamic> json) => Identify(
      imageUrl: json['imageUrl'] as String?,
      imageDesc: json['imageDesc'] as String?,
      actionUrl: json['actionUrl'] as String?,
    );

Map<String, dynamic> _$IdentifyToJson(Identify instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'imageDesc': instance.imageDesc,
      'actionUrl': instance.actionUrl,
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      id: (json['id'] as num?)?.toInt(),
      cover: json['cover'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      transNames: json['transNames'] as List<dynamic>?,
      alias: json['alias'] as List<dynamic>?,
      identities: (json['identities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      identifyTag: (json['identifyTag'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      briefDesc: json['briefDesc'] as String?,
      albumSize: (json['albumSize'] as num?)?.toInt(),
      musicSize: (json['musicSize'] as num?)?.toInt(),
      mvSize: (json['mvSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'avatar': instance.avatar,
      'name': instance.name,
      'transNames': instance.transNames,
      'alias': instance.alias,
      'identities': instance.identities,
      'identifyTag': instance.identifyTag,
      'briefDesc': instance.briefDesc,
      'albumSize': instance.albumSize,
      'musicSize': instance.musicSize,
      'mvSize': instance.mvSize,
    };

SecondaryExpertIdentiy _$SecondaryExpertIdentiyFromJson(
        Map<String, dynamic> json) =>
    SecondaryExpertIdentiy(
      expertIdentiyId: (json['expertIdentiyId'] as num?)?.toInt(),
      expertIdentiyName: json['expertIdentiyName'] as String?,
      expertIdentiyCount: (json['expertIdentiyCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SecondaryExpertIdentiyToJson(
        SecondaryExpertIdentiy instance) =>
    <String, dynamic>{
      'expertIdentiyId': instance.expertIdentiyId,
      'expertIdentiyName': instance.expertIdentiyName,
      'expertIdentiyCount': instance.expertIdentiyCount,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      backgroundUrl: json['backgroundUrl'] as String?,
      birthday: (json['birthday'] as num?)?.toInt(),
      detailDescription: json['detailDescription'] as String?,
      authenticated: json['authenticated'] as bool?,
      gender: (json['gender'] as num?)?.toInt(),
      city: (json['city'] as num?)?.toInt(),
      signature: json['signature'] as String?,
      description: json['description'] as String?,
      shortUserName: json['shortUserName'] as String?,
      accountStatus: (json['accountStatus'] as num?)?.toInt(),
      locationStatus: (json['locationStatus'] as num?)?.toInt(),
      avatarImgId: (json['avatarImgId'] as num?)?.toInt(),
      defaultAvatar: json['defaultAvatar'] as bool?,
      province: (json['province'] as num?)?.toInt(),
      nickname: json['nickname'] as String?,
      djStatus: (json['djStatus'] as num?)?.toInt(),
      avatarUrl: json['avatarUrl'] as String?,
      accountType: (json['accountType'] as num?)?.toInt(),
      authStatus: (json['authStatus'] as num?)?.toInt(),
      vipType: (json['vipType'] as num?)?.toInt(),
      userName: json['userName'] as String?,
      followed: json['followed'] as bool?,
      userId: (json['userId'] as num?)?.toInt(),
      lastLoginIP: json['lastLoginIP'] as String?,
      lastLoginTime: (json['lastLoginTime'] as num?)?.toInt(),
      authenticationTypes: (json['authenticationTypes'] as num?)?.toInt(),
      mutual: json['mutual'] as bool?,
      createTime: (json['createTime'] as num?)?.toInt(),
      anchor: json['anchor'] as bool?,
      authority: (json['authority'] as num?)?.toInt(),
      backgroundImgId: (json['backgroundImgId'] as num?)?.toInt(),
      userType: (json['userType'] as num?)?.toInt(),
      avatarDetail: json['avatarDetail'] == null
          ? null
          : AvatarDetail.fromJson(json['avatarDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'backgroundUrl': instance.backgroundUrl,
      'birthday': instance.birthday,
      'detailDescription': instance.detailDescription,
      'authenticated': instance.authenticated,
      'gender': instance.gender,
      'city': instance.city,
      'signature': instance.signature,
      'description': instance.description,
      'shortUserName': instance.shortUserName,
      'accountStatus': instance.accountStatus,
      'locationStatus': instance.locationStatus,
      'avatarImgId': instance.avatarImgId,
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'nickname': instance.nickname,
      'djStatus': instance.djStatus,
      'avatarUrl': instance.avatarUrl,
      'accountType': instance.accountType,
      'authStatus': instance.authStatus,
      'vipType': instance.vipType,
      'userName': instance.userName,
      'followed': instance.followed,
      'userId': instance.userId,
      'lastLoginIP': instance.lastLoginIP,
      'lastLoginTime': instance.lastLoginTime,
      'authenticationTypes': instance.authenticationTypes,
      'mutual': instance.mutual,
      'createTime': instance.createTime,
      'anchor': instance.anchor,
      'authority': instance.authority,
      'backgroundImgId': instance.backgroundImgId,
      'userType': instance.userType,
      'avatarDetail': instance.avatarDetail,
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
