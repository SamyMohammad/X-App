// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      statusCode: json['status_code'] as num?,
      data: json['data'] == null
          ? null
          : UserRM.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );
