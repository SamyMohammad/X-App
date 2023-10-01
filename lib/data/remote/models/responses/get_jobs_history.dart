import 'package:json_annotation/json_annotation.dart';

part 'get_jobs_history.g.dart';

/// status_code : 200
/// message : "Retrieve all jobs"
/// data : [{"id":5,"admin_id":4,"title":"Web Designer","price":"500 $","requirments":["Cou","https://www.example.com/course-a"],"experience":["Med","Senior","Junior"],"description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":1,"created_at":"51 minutes ago","updated_at":"2023-05-13T00:06:52.000000Z","formatted_deadline":"2 weeks from now","user_job_details":{"user_id":5,"job_id":5,"status":"pending"}}]
@JsonSerializable(createToJson: false)
class GetJobsStatus {
  GetJobsStatus({
    this.statusCode,
    this.message,
    this.data,
  });

  @JsonKey(
    name: 'status_code',
  )
  num? statusCode;
  String? message;
  List<Data>? data;

  factory GetJobsStatus.fromJson(Map<String, dynamic> json) =>
      _$GetJobsStatusFromJson(json);
}

/// id : 5
/// admin_id : 4
/// title : "Web Designer"
/// price : "500 $"
/// requirments : ["Cou","https://www.example.com/course-a"]
/// experience : ["Med","Senior","Junior"]
/// description : "description for web designer job"
/// deadline : "2023-05-30 03:00:00"
/// specialization : "Developer"
/// total_applicants : 1
/// created_at : "51 minutes ago"
/// updated_at : "2023-05-13T00:06:52.000000Z"
/// formatted_deadline : "2 weeks from now"
/// user_job_details : {"user_id":5,"job_id":5,"status":"pending"}
@JsonSerializable(createToJson: false)
class Data {
  Data({
    this.id,
    this.adminId,
    this.title,
    this.price,
    this.requirments,
    this.experience,
    this.description,
    this.deadline,
    this.specialization,
    this.totalApplicants,
    this.createdAt,
    this.updatedAt,
    this.formattedDeadline,
    this.userJobDetails,
  });

  num? id;
  @JsonKey(
    name: 'admin_id',
  )
  num? adminId;
  String? title;
  String? price;
  List<String>? requirments;
  List<String>? experience;
  String? description;
  String? deadline;
  String? specialization;
  @JsonKey(
    name: 'total_applicants',
  )
  num? totalApplicants;
  @JsonKey(
    name: 'created_at',
  )
  String? createdAt;
  @JsonKey(
    name: 'updated_at',
  )
  String? updatedAt;
  @JsonKey(
    name: 'formatted_deadline',
  )
  String? formattedDeadline;
  @JsonKey(
    name: 'user_job_details',
  )
  UserJobDetails? userJobDetails;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

/// user_id : 5
/// job_id : 5
/// status : "pending"
@JsonSerializable(createToJson: false)
class UserJobDetails {
  UserJobDetails({
    this.userId,
    this.jobId,
    this.status,
  });

  @JsonKey(
    name: 'user_id',
  )
  num? userId;
  @JsonKey(
    name: 'job_id',
  )
  num? jobId;
  String? status;

  factory UserJobDetails.fromJson(Map<String, dynamic> json) =>
      _$UserJobDetailsFromJson(json);
}
