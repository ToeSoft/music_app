import 'package:json_annotation/json_annotation.dart';

part 'Creator.g.dart';

@JsonSerializable()
class Creator {
  final String? nickname;
  final int? userId;
  final int? userType;
  final int? authStatus;

  const Creator({
    this.nickname,
    this.userId,
    this.userType,
    this.authStatus,
  });

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);

  Creator copyWith({
    String? nickname,
    int? userId,
    int? userType,
    int? authStatus,
  }) {
    return Creator(
      nickname: nickname ?? this.nickname,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      authStatus: authStatus ?? this.authStatus,
    );
  }
}