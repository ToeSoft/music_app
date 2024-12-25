// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtistSongsResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistSongsResult _$ArtistSongsResultFromJson(Map<String, dynamic> json) =>
    ArtistSongsResult(
      songs: (json['songs'] as List<dynamic>?)
          ?.map((e) => Songs.fromJson(e as Map<String, dynamic>))
          .toList(),
      more: json['more'] as bool?,
      total: (json['total'] as num?)?.toInt(),
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArtistSongsResultToJson(ArtistSongsResult instance) =>
    <String, dynamic>{
      'songs': instance.songs,
      'more': instance.more,
      'total': instance.total,
      'code': instance.code,
    };

Songs _$SongsFromJson(Map<String, dynamic> json) => Songs(
      rtUrls: json['rtUrls'] as List<dynamic>?,
      ar: (json['ar'] as List<dynamic>?)
          ?.map((e) => Ar.fromJson(e as Map<String, dynamic>))
          .toList(),
      al: json['al'] == null
          ? null
          : Al.fromJson(json['al'] as Map<String, dynamic>),
      st: (json['st'] as num?)?.toInt(),
      no: (json['no'] as num?)?.toInt(),
      djId: (json['djId'] as num?)?.toInt(),
      fee: (json['fee'] as num?)?.toInt(),
      mv: (json['mv'] as num?)?.toInt(),
      t: (json['t'] as num?)?.toInt(),
      v: (json['v'] as num?)?.toInt(),
      cd: json['cd'] as String?,
      rtype: (json['rtype'] as num?)?.toInt(),
      pst: (json['pst'] as num?)?.toInt(),
      alia: (json['alia'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pop: (json['pop'] as num?)?.toInt(),
      rt: json['rt'] as String?,
      mst: (json['mst'] as num?)?.toInt(),
      cp: (json['cp'] as num?)?.toInt(),
      cf: json['cf'] as String?,
      dt: (json['dt'] as num?)?.toInt(),
      h: json['h'] == null
          ? null
          : H.fromJson(json['h'] as Map<String, dynamic>),
      sq: json['sq'] == null
          ? null
          : Sq.fromJson(json['sq'] as Map<String, dynamic>),
      l: json['l'] == null
          ? null
          : L.fromJson(json['l'] as Map<String, dynamic>),
      ftype: (json['ftype'] as num?)?.toInt(),
      m: json['m'] == null
          ? null
          : M.fromJson(json['m'] as Map<String, dynamic>),
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      privilege: json['privilege'] == null
          ? null
          : Privilege.fromJson(json['privilege'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SongsToJson(Songs instance) => <String, dynamic>{
      'rtUrls': instance.rtUrls,
      'ar': instance.ar,
      'al': instance.al,
      'st': instance.st,
      'no': instance.no,
      'djId': instance.djId,
      'fee': instance.fee,
      'mv': instance.mv,
      't': instance.t,
      'v': instance.v,
      'cd': instance.cd,
      'rtype': instance.rtype,
      'pst': instance.pst,
      'alia': instance.alia,
      'pop': instance.pop,
      'rt': instance.rt,
      'mst': instance.mst,
      'cp': instance.cp,
      'cf': instance.cf,
      'dt': instance.dt,
      'h': instance.h,
      'sq': instance.sq,
      'l': instance.l,
      'ftype': instance.ftype,
      'm': instance.m,
      'name': instance.name,
      'id': instance.id,
      'privilege': instance.privilege,
    };
