// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_education_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetEducationResponse _$GetEducationResponseFromJson(
        Map<String, dynamic> json) =>
    GetEducationResponse(
      statusCode: json['status_code'] as num?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Education.fromJson(json['data'] as Map<String, dynamic>),
    );

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      id: json['id'] as num?,
      faculty: json['faculty'] as String?,
      university: json['university'] as String?,
    );
