// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_jobs_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetJobsStatus _$GetJobsStatusFromJson(Map<String, dynamic> json) =>
    GetJobsStatus(
      statusCode: json['status_code'] as num?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as num?,
      adminId: json['admin_id'] as num?,
      title: json['title'] as String?,
      price: json['price'] as String?,
      requirments: (json['requirments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      experience: (json['experience'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      deadline: json['deadline'] as String?,
      specialization: json['specialization'] as String?,
      totalApplicants: json['total_applicants'] as num?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      formattedDeadline: json['formatted_deadline'] as String?,
      userJobDetails: json['user_job_details'] == null
          ? null
          : UserJobDetails.fromJson(
              json['user_job_details'] as Map<String, dynamic>),
    );

UserJobDetails _$UserJobDetailsFromJson(Map<String, dynamic> json) =>
    UserJobDetails(
      userId: json['user_id'] as num?,
      jobId: json['job_id'] as num?,
      status: json['status'] as String?,
    );
