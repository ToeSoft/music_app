// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
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
      privilege: json['privilege'] == null
          ? null
          : Privilege.fromJson(json['privilege'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
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
      'privilege': instance.privilege,
    };

Ar _$ArFromJson(Map<String, dynamic> json) => Ar(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      alia: (json['alia'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tns: (json['tns'] as List<dynamic>?)?.map((e) => e as String).toList(),
      alias: json['alias'] as List<dynamic>?,
    );

Map<String, dynamic> _$ArToJson(Ar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alia': instance.alia,
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

Privilege _$PrivilegeFromJson(Map<String, dynamic> json) => Privilege(
      id: (json['id'] as num?)?.toInt(),
      fee: (json['fee'] as num?)?.toInt(),
      payed: (json['payed'] as num?)?.toInt(),
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

Map<String, dynamic> _$PrivilegeToJson(Privilege instance) => <String, dynamic>{
      'id': instance.id,
      'fee': instance.fee,
      'payed': instance.payed,
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
      cannotListenReason: (json['cannotListenReason'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FreeTrialPrivilegeToJson(FreeTrialPrivilege instance) =>
    <String, dynamic>{
      'resConsumable': instance.resConsumable,
      'userConsumable': instance.userConsumable,
      'cannotListenReason': instance.cannotListenReason,
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
