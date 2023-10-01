// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCoursesResponse _$GetCoursesResponseFromJson(Map<String, dynamic> json) =>
    GetCoursesResponse(
      statusCode: json['status_code'] as num?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as num?,
      userId: json['user_id'] as num?,
      courseName: json['course_name'] as String?,
      certificateLink: json['certificate_link'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
