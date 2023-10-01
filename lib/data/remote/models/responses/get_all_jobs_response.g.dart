// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_jobs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllJobsResponse _$GetAllJobsResponseFromJson(Map<String, dynamic> json) =>
    GetAllJobsResponse(
      statusCode: json['status_code'] as num?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : JobsListData.fromJson(json['data'] as Map<String, dynamic>),
    );

JobsListData _$JobsListDataFromJson(Map<String, dynamic> json) => JobsListData(
      currentPage: json['current_page'] as num?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => JobData.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as num?,
      lastPage: json['lastPage'] as num?,
      lastPageUrl: json['last_page_url'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Links.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as num?,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as num?,
      total: json['total'] as num?,
    );

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

JobData _$JobDataFromJson(Map<String, dynamic> json) => JobData(
      id: json['id'] as num?,
      userId: json['user_id'] as num?,
      title: json['title'] as String?,
      price: json['price'] as String?,
      requirments: (json['requirments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      experience: (json['experience'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      deadline: json['deadline'] as String?,
      specialization: json['specialization'] as String?,
      totalApplicants: json['total_applicants'] as num?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      formattedDeadline: json['formatted_deadline'] as String?,
    );
