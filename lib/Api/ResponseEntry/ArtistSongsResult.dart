import 'package:json_annotation/json_annotation.dart';

import 'Song.dart';

part 'ArtistSongsResult.g.dart';

@JsonSerializable()
class ArtistSongsResult {
  final List<Songs>? songs;
  final bool? more;
  final int? total;
  final int? code;

  const ArtistSongsResult({
    this.songs,
    this.more,
    this.total,
    this.code,
  });

  factory ArtistSongsResult.fromJson(Map<String, dynamic> json) =>
      _$ArtistSongsResultFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistSongsResultToJson(this);

  ArtistSongsResult copyWith({
    List<Songs>? songs,
    bool? more,
    int? total,
    int? code,
  }) {
    return ArtistSongsResult(
      songs: songs ?? this.songs,
      more: more ?? this.more,
      total: total ?? this.total,
      code: code ?? this.code,
    );
  }
}

@JsonSerializable()
class Songs {
  final List<dynamic>? rtUrls;
  final List<Ar>? ar;
  final Al? al;
  final int? st;
  final int? no;
  final int? djId;
  final int? fee;
  final int? mv;
  final int? t;
  final int? v;
  final String? cd;
  final int? rtype;
  final int? pst;
  final List<String>? alia;
  final int? pop;
  final String? rt;
  final int? mst;
  final int? cp;
  final String? cf;
  final int? dt;
  final H? h;
  final Sq? sq;
  final L? l;
  final int? ftype;
  final M? m;
  final String? name;
  final int? id;
  final Privilege? privilege;

  const Songs({
    this.rtUrls,
    this.ar,
    this.al,
    this.st,
    this.no,
    this.djId,
    this.fee,
    this.mv,
    this.t,
    this.v,
    this.cd,
    this.rtype,
    this.pst,
    this.alia,
    this.pop,
    this.rt,
    this.mst,
    this.cp,
    this.cf,
    this.dt,
    this.h,
    this.sq,
    this.l,
    this.ftype,
    this.m,
    this.name,
    this.id,
    this.privilege,
  });

  factory Songs.fromJson(Map<String, dynamic> json) => _$SongsFromJson(json);

  Map<String, dynamic> toJson() => _$SongsToJson(this);

  Songs copyWith({
    List<dynamic>? rtUrls,
    List<Ar>? ar,
    Al? al,
    int? st,
    int? no,
    int? djId,
    int? fee,
    int? mv,
    int? t,
    int? v,
    String? cd,
    int? rtype,
    int? pst,
    List<String>? alia,
    int? pop,
    String? rt,
    int? mst,
    int? cp,
    String? cf,
    int? dt,
    H? h,
    Sq? sq,
    L? l,
    int? ftype,
    M? m,
    String? name,
    int? id,
    Privilege? privilege,
  }) {
    return Songs(
      rtUrls: rtUrls ?? this.rtUrls,
      ar: ar ?? this.ar,
      al: al ?? this.al,
      st: st ?? this.st,
      no: no ?? this.no,
      djId: djId ?? this.djId,
      fee: fee ?? this.fee,
      mv: mv ?? this.mv,
      t: t ?? this.t,
      v: v ?? this.v,
      cd: cd ?? this.cd,
      rtype: rtype ?? this.rtype,
      pst: pst ?? this.pst,
      alia: alia ?? this.alia,
      pop: pop ?? this.pop,
      rt: rt ?? this.rt,
      mst: mst ?? this.mst,
      cp: cp ?? this.cp,
      cf: cf ?? this.cf,
      dt: dt ?? this.dt,
      h: h ?? this.h,
      sq: sq ?? this.sq,
      l: l ?? this.l,
      ftype: ftype ?? this.ftype,
      m: m ?? this.m,
      name: name ?? this.name,
      id: id ?? this.id,
      privilege: privilege ?? this.privilege,
    );
  }
}
