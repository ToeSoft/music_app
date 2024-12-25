// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SmmsUploadResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmmsUploadResult _$SmmsUploadResultFromJson(Map<String, dynamic> json) =>
    SmmsUploadResult(
      success: json['success'] as bool?,
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      images: json['images'] as String?,
      RequestId: json['RequestId'] as String?,
    );

Map<String, dynamic> _$SmmsUploadResultToJson(SmmsUploadResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'images': instance.images,
      'RequestId': instance.RequestId,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      fileId: (json['fileId'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      filename: json['filename'] as String?,
      storename: json['storename'] as String?,
      size: (json['size'] as num?)?.toInt(),
      path: json['path'] as String?,
      hash: json['hash'] as String?,
      url: json['url'] as String?,
      delete: json['delete'] as String?,
      page: json['page'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'fileId': instance.fileId,
      'width': instance.width,
      'height': instance.height,
      'filename': instance.filename,
      'storename': instance.storename,
      'size': instance.size,
      'path': instance.path,
      'hash': instance.hash,
      'url': instance.url,
      'delete': instance.delete,
      'page': instance.page,
    };
