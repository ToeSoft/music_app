// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Creator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      nickname: json['nickname'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      userType: (json['userType'] as num?)?.toInt(),
      authStatus: (json['authStatus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'userId': instance.userId,
      'userType': instance.userType,
      'authStatus': instance.authStatus,
    };
