// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_complilation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileCompilationResponse _$GetProfileCompilationResponseFromJson(
        Map<String, dynamic> json) =>
    GetProfileCompilationResponse(
      statusCode: json['status_code'] as num?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileCompletedData.fromJson(json['data'] as Map<String, dynamic>),
    );

ProfileCompletedData _$ProfileCompletedDataFromJson(
        Map<String, dynamic> json) =>
    ProfileCompletedData(
      completed: json['completed'] as bool?,
      rate: (json['rate'] as num?)?.toDouble(),
    );
