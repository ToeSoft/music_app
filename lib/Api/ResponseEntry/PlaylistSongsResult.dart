import 'package:json_annotation/json_annotation.dart';

part 'PlaylistSongsResult.g.dart';

@JsonSerializable()
class PlaylistSongsResult {
  final List<Songs>? songs;
  final List<Privileges>? privileges;
  final int? code;

  const PlaylistSongsResult({
    this.songs,
    this.privileges,
    this.code,
  });

  factory PlaylistSongsResult.fromJson(Map<String, dynamic> json) =>
      _$PlaylistSongsResultFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistSongsResultToJson(this);

  PlaylistSongsResult copyWith({
    List<Songs>? songs,
    List<Privileges>? privileges,
    int? code,
  }) {
    return PlaylistSongsResult(
      songs: songs ?? this.songs,
      privileges: privileges ?? this.privileges,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class Songs {
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
  final int? mv;
  final int? rtype;
  final int? mst;
  final int? cp;
  final int? publishTime;

  const Songs({
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
    this.mv,
    this.rtype,
    this.mst,
    this.cp,
    this.publishTime,
  });

  factory Songs.fromJson(Map<String, dynamic> json) =>
      _$SongsFromJson(json);

  Map<String, dynamic> toJson() => _$SongsToJson(this);

  Songs copyWith({
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
    int? mv,
    int? rtype,
    int? mst,
    int? cp,
    int? publishTime,
  }) {
    return Songs(
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
      mv: mv ?? this.mv,
      rtype: rtype ?? this.rtype,
      mst: mst ?? this.mst,
      cp: cp ?? this.cp,
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
class Privileges {
  final int? id;
  final int? fee;
  final int? payed;
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
