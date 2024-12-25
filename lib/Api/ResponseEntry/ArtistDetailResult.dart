import 'package:json_annotation/json_annotation.dart';

part 'ArtistDetailResult.g.dart';

@JsonSerializable()
class ArtistDetailResult {
  final int? code;
  final String? message;
  final Data? data;

  const ArtistDetailResult({
    this.code,
    this.message,
    this.data,
  });

  factory ArtistDetailResult.fromJson(Map<String, dynamic> json) =>
      _$ArtistDetailResultFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDetailResultToJson(this);

  ArtistDetailResult copyWith({
    int? code,
    String? message,
    Data? data,
  }) {
    return ArtistDetailResult(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

@JsonSerializable()
class Data {
  final int? videoCount;
  final VipRights? vipRights;
  final Identify? identify;
  final Artist? artist;
  final bool? blacklist;
  final int? preferShow;
  final bool? showPriMsg;
  final List<SecondaryExpertIdentiy>? secondaryExpertIdentiy;
  final int? eventCount;
  final User? user;

  const Data({
    this.videoCount,
    this.vipRights,
    this.identify,
    this.artist,
    this.blacklist,
    this.preferShow,
    this.showPriMsg,
    this.secondaryExpertIdentiy,
    this.eventCount,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? videoCount,
    VipRights? vipRights,
    Identify? identify,
    Artist? artist,
    bool? blacklist,
    int? preferShow,
    bool? showPriMsg,
    List<SecondaryExpertIdentiy>? secondaryExpertIdentiy,
    int? eventCount,
    User? user,
  }) {
    return Data(
      videoCount: videoCount ?? this.videoCount,
      vipRights: vipRights ?? this.vipRights,
      identify: identify ?? this.identify,
      artist: artist ?? this.artist,
      blacklist: blacklist ?? this.blacklist,
      preferShow: preferShow ?? this.preferShow,
      showPriMsg: showPriMsg ?? this.showPriMsg,
      secondaryExpertIdentiy: secondaryExpertIdentiy ?? this.secondaryExpertIdentiy,
      eventCount: eventCount ?? this.eventCount,
      user: user ?? this.user,
    );
  }
}

@JsonSerializable()
class VipRights {
  final List<RightsInfoDetailDtoList>? rightsInfoDetailDtoList;
  final bool? oldProtocol;
  final int? redVipAnnualCount;
  final int? redVipLevel;
  final int? now;

  const VipRights({
    this.rightsInfoDetailDtoList,
    this.oldProtocol,
    this.redVipAnnualCount,
    this.redVipLevel,
    this.now,
  });

  factory VipRights.fromJson(Map<String, dynamic> json) =>
      _$VipRightsFromJson(json);

  Map<String, dynamic> toJson() => _$VipRightsToJson(this);

  VipRights copyWith({
    List<RightsInfoDetailDtoList>? rightsInfoDetailDtoList,
    bool? oldProtocol,
    int? redVipAnnualCount,
    int? redVipLevel,
    int? now,
  }) {
    return VipRights(
      rightsInfoDetailDtoList: rightsInfoDetailDtoList ?? this.rightsInfoDetailDtoList,
      oldProtocol: oldProtocol ?? this.oldProtocol,
      redVipAnnualCount: redVipAnnualCount ?? this.redVipAnnualCount,
      redVipLevel: redVipLevel ?? this.redVipLevel,
      now: now ?? this.now,
    );
  }
}

@JsonSerializable()
class RightsInfoDetailDtoList {
  final int? vipCode;
  final int? expireTime;
  final int? vipLevel;
  final bool? signIap;
  final bool? signDeduct;
  final bool? signIapDeduct;
  final bool? sign;

  const RightsInfoDetailDtoList({
    this.vipCode,
    this.expireTime,
    this.vipLevel,
    this.signIap,
    this.signDeduct,
    this.signIapDeduct,
    this.sign,
  });

  factory RightsInfoDetailDtoList.fromJson(Map<String, dynamic> json) =>
      _$RightsInfoDetailDtoListFromJson(json);

  Map<String, dynamic> toJson() => _$RightsInfoDetailDtoListToJson(this);

  RightsInfoDetailDtoList copyWith({
    int? vipCode,
    int? expireTime,
    int? vipLevel,
    bool? signIap,
    bool? signDeduct,
    bool? signIapDeduct,
    bool? sign,
  }) {
    return RightsInfoDetailDtoList(
      vipCode: vipCode ?? this.vipCode,
      expireTime: expireTime ?? this.expireTime,
      vipLevel: vipLevel ?? this.vipLevel,
      signIap: signIap ?? this.signIap,
      signDeduct: signDeduct ?? this.signDeduct,
      signIapDeduct: signIapDeduct ?? this.signIapDeduct,
      sign: sign ?? this.sign,
    );
  }
}

@JsonSerializable()
class Identify {
  final String? imageUrl;
  final String? imageDesc;
  final String? actionUrl;

  const Identify({
    this.imageUrl,
    this.imageDesc,
    this.actionUrl,
  });

  factory Identify.fromJson(Map<String, dynamic> json) =>
      _$IdentifyFromJson(json);

  Map<String, dynamic> toJson() => _$IdentifyToJson(this);

  Identify copyWith({
    String? imageUrl,
    String? imageDesc,
    String? actionUrl,
  }) {
    return Identify(
      imageUrl: imageUrl ?? this.imageUrl,
      imageDesc: imageDesc ?? this.imageDesc,
      actionUrl: actionUrl ?? this.actionUrl,
    );
  }
}

@JsonSerializable()
class Artist {
  final int? id;
  final String? cover;
  final String? avatar;
  final String? name;
  final List<dynamic>? transNames;
  final List<dynamic>? alias;
  final List<String>? identities;
  final List<String>? identifyTag;
  final String? briefDesc;
  final int? albumSize;
  final int? musicSize;
  final int? mvSize;

  const Artist({
    this.id,
    this.cover,
    this.avatar,
    this.name,
    this.transNames,
    this.alias,
    this.identities,
    this.identifyTag,
    this.briefDesc,
    this.albumSize,
    this.musicSize,
    this.mvSize,
  });

  factory Artist.fromJson(Map<String, dynamic> json) =>
      _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);

  Artist copyWith({
    int? id,
    String? cover,
    String? avatar,
    String? name,
    List<dynamic>? transNames,
    List<dynamic>? alias,
    List<String>? identities,
    List<String>? identifyTag,
    String? briefDesc,
    int? albumSize,
    int? musicSize,
    int? mvSize,
  }) {
    return Artist(
      id: id ?? this.id,
      cover: cover ?? this.cover,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      transNames: transNames ?? this.transNames,
      alias: alias ?? this.alias,
      identities: identities ?? this.identities,
      identifyTag: identifyTag ?? this.identifyTag,
      briefDesc: briefDesc ?? this.briefDesc,
      albumSize: albumSize ?? this.albumSize,
      musicSize: musicSize ?? this.musicSize,
      mvSize: mvSize ?? this.mvSize,
    );
  }
}

@JsonSerializable()
class SecondaryExpertIdentiy {
  final int? expertIdentiyId;
  final String? expertIdentiyName;
  final int? expertIdentiyCount;

  const SecondaryExpertIdentiy({
    this.expertIdentiyId,
    this.expertIdentiyName,
    this.expertIdentiyCount,
  });

  factory SecondaryExpertIdentiy.fromJson(Map<String, dynamic> json) =>
      _$SecondaryExpertIdentiyFromJson(json);

  Map<String, dynamic> toJson() => _$SecondaryExpertIdentiyToJson(this);

  SecondaryExpertIdentiy copyWith({
    int? expertIdentiyId,
    String? expertIdentiyName,
    int? expertIdentiyCount,
  }) {
    return SecondaryExpertIdentiy(
      expertIdentiyId: expertIdentiyId ?? this.expertIdentiyId,
      expertIdentiyName: expertIdentiyName ?? this.expertIdentiyName,
      expertIdentiyCount: expertIdentiyCount ?? this.expertIdentiyCount,
    );
  }
}

@JsonSerializable()
class User {
  final String? backgroundUrl;
  final int? birthday;
  final String? detailDescription;
  final bool? authenticated;
  final int? gender;
  final int? city;
  final String? signature;
  final String? description;
  final String? shortUserName;
  final int? accountStatus;
  final int? locationStatus;
  final int? avatarImgId;
  final bool? defaultAvatar;
  final int? province;
  final String? nickname;
  final int? djStatus;
  final String? avatarUrl;
  final int? accountType;
  final int? authStatus;
  final int? vipType;
  final String? userName;
  final bool? followed;
  final int? userId;
  final String? lastLoginIP;
  final int? lastLoginTime;
  final int? authenticationTypes;
  final bool? mutual;
  final int? createTime;
  final bool? anchor;
  final int? authority;
  final int? backgroundImgId;
  final int? userType;
  final AvatarDetail? avatarDetail;

  const User({
    this.backgroundUrl,
    this.birthday,
    this.detailDescription,
    this.authenticated,
    this.gender,
    this.city,
    this.signature,
    this.description,
    this.shortUserName,
    this.accountStatus,
    this.locationStatus,
    this.avatarImgId,
    this.defaultAvatar,
    this.province,
    this.nickname,
    this.djStatus,
    this.avatarUrl,
    this.accountType,
    this.authStatus,
    this.vipType,
    this.userName,
    this.followed,
    this.userId,
    this.lastLoginIP,
    this.lastLoginTime,
    this.authenticationTypes,
    this.mutual,
    this.createTime,
    this.anchor,
    this.authority,
    this.backgroundImgId,
    this.userType,
    this.avatarDetail,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? backgroundUrl,
    int? birthday,
    String? detailDescription,
    bool? authenticated,
    int? gender,
    int? city,
    String? signature,
    String? description,
    String? shortUserName,
    int? accountStatus,
    int? locationStatus,
    int? avatarImgId,
    bool? defaultAvatar,
    int? province,
    String? nickname,
    int? djStatus,
    String? avatarUrl,
    int? accountType,
    int? authStatus,
    int? vipType,
    String? userName,
    bool? followed,
    int? userId,
    String? lastLoginIP,
    int? lastLoginTime,
    int? authenticationTypes,
    bool? mutual,
    int? createTime,
    bool? anchor,
    int? authority,
    int? backgroundImgId,
    int? userType,
    AvatarDetail? avatarDetail,
  }) {
    return User(
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
      birthday: birthday ?? this.birthday,
      detailDescription: detailDescription ?? this.detailDescription,
      authenticated: authenticated ?? this.authenticated,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      signature: signature ?? this.signature,
      description: description ?? this.description,
      shortUserName: shortUserName ?? this.shortUserName,
      accountStatus: accountStatus ?? this.accountStatus,
      locationStatus: locationStatus ?? this.locationStatus,
      avatarImgId: avatarImgId ?? this.avatarImgId,
      defaultAvatar: defaultAvatar ?? this.defaultAvatar,
      province: province ?? this.province,
      nickname: nickname ?? this.nickname,
      djStatus: djStatus ?? this.djStatus,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      accountType: accountType ?? this.accountType,
      authStatus: authStatus ?? this.authStatus,
      vipType: vipType ?? this.vipType,
      userName: userName ?? this.userName,
      followed: followed ?? this.followed,
      userId: userId ?? this.userId,
      lastLoginIP: lastLoginIP ?? this.lastLoginIP,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
      authenticationTypes: authenticationTypes ?? this.authenticationTypes,
      mutual: mutual ?? this.mutual,
      createTime: createTime ?? this.createTime,
      anchor: anchor ?? this.anchor,
      authority: authority ?? this.authority,
      backgroundImgId: backgroundImgId ?? this.backgroundImgId,
      userType: userType ?? this.userType,
      avatarDetail: avatarDetail ?? this.avatarDetail,
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
