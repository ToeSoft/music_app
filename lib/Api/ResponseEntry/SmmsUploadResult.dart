import 'package:json_annotation/json_annotation.dart';

part 'SmmsUploadResult.g.dart';

@JsonSerializable()
class SmmsUploadResult {
  final bool? success;
  final String? code;
  final String? message;
  final Data? data;
  final String? images; // 当图片重复时返回的字段
  final String? RequestId;

  const SmmsUploadResult({
    this.success,
    this.code,
    this.message,
    this.data,
    this.images,
    this.RequestId,
  });

  factory SmmsUploadResult.fromJson(Map<String, dynamic> json) =>
      _$SmmsUploadResultFromJson(json);

  Map<String, dynamic> toJson() => _$SmmsUploadResultToJson(this);

  SmmsUploadResult copyWith({
    bool? success,
    String? code,
    String? message,
    Data? data,
    String? images,
    String? RequestId,
  }) {
    return SmmsUploadResult(
      success: success ?? this.success,
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
      images: images ?? this.images,
      RequestId: RequestId ?? this.RequestId,
    );
  }
}

@JsonSerializable()
class Data {
  final int? fileId;
  final int? width;
  final int? height;
  final String? filename;
  final String? storename;
  final int? size;
  final String? path;
  final String? hash;
  final String? url;
  final String? delete;
  final String? page;

  const Data({
    this.fileId,
    this.width,
    this.height,
    this.filename,
    this.storename,
    this.size,
    this.path,
    this.hash,
    this.url,
    this.delete,
    this.page,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? fileId,
    int? width,
    int? height,
    String? filename,
    String? storename,
    int? size,
    String? path,
    String? hash,
    String? url,
    String? delete,
    String? page,
  }) {
    return Data(
      fileId: fileId ?? this.fileId,
      width: width ?? this.width,
      height: height ?? this.height,
      filename: filename ?? this.filename,
      storename: storename ?? this.storename,
      size: size ?? this.size,
      path: path ?? this.path,
      hash: hash ?? this.hash,
      url: url ?? this.url,
      delete: delete ?? this.delete,
      page: page ?? this.page,
    );
  }
}