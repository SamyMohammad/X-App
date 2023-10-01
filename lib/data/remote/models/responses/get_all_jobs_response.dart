import 'package:json_annotation/json_annotation.dart';

part 'get_all_jobs_response.g.dart';

/// status_code : 200
/// message : "Retrieve all jobs"
/// data : {"current_page":1,"data":[{"id":1,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:15.000000Z","formatted_deadline":"3 weeks from now"},{"id":2,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:19.000000Z","formatted_deadline":"3 weeks from now"},{"id":3,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:20.000000Z","formatted_deadline":"3 weeks from now"},{"id":4,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:21.000000Z","formatted_deadline":"3 weeks from now"},{"id":5,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:22.000000Z","formatted_deadline":"3 weeks from now"},{"id":6,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:23.000000Z","formatted_deadline":"3 weeks from now"},{"id":7,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:24.000000Z","formatted_deadline":"3 weeks from now"},{"id":8,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:25.000000Z","formatted_deadline":"3 weeks from now"},{"id":9,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:26.000000Z","formatted_deadline":"3 weeks from now"},{"id":10,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:27.000000Z","formatted_deadline":"3 weeks from now"}],"first_page_url":"http://85.10.195.86/api/user/jobs/list?page=1","from":1,"last_page":2,"last_page_url":"http://85.10.195.86/api/user/jobs/list?page=2","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://85.10.195.86/api/user/jobs/list?page=1","label":"1","active":true},{"url":"http://85.10.195.86/api/user/jobs/list?page=2","label":"2","active":false},{"url":"http://85.10.195.86/api/user/jobs/list?page=2","label":"Next &raquo;","active":false}],"next_page_url":"http://85.10.195.86/api/user/jobs/list?page=2","path":"http://85.10.195.86/api/user/jobs/list","per_page":10,"prev_page_url":null,"to":10,"total":11}
@JsonSerializable(createToJson: false)
class GetAllJobsResponse {
  GetAllJobsResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  @JsonKey(
    name: 'status_code',
  )
  num? statusCode;
  @JsonKey(
    name: 'message',
  )
  String? message;
  @JsonKey(
    name: 'data',
  )
  JobsListData? data;

  factory GetAllJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllJobsResponseFromJson(json);
}

/// current_page : 1
/// data : [{"id":1,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:15.000000Z","formatted_deadline":"3 weeks from now"},{"id":2,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:19.000000Z","formatted_deadline":"3 weeks from now"},{"id":3,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:20.000000Z","formatted_deadline":"3 weeks from now"},{"id":4,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:21.000000Z","formatted_deadline":"3 weeks from now"},{"id":5,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:22.000000Z","formatted_deadline":"3 weeks from now"},{"id":6,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:23.000000Z","formatted_deadline":"3 weeks from now"},{"id":7,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:24.000000Z","formatted_deadline":"3 weeks from now"},{"id":8,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:25.000000Z","formatted_deadline":"3 weeks from now"},{"id":9,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:26.000000Z","formatted_deadline":"3 weeks from now"},{"id":10,"user_id":3,"title":"Web Design","price":"500 LE","requirments":"(Med / Senior) Talent UI Designer can create interaction design","description":"description for web designer job","deadline":"2023-05-30 03:00:00","specialization":"Developer","total_applicants":0,"created_at":"18 minutes ago","updated_at":"2023-05-08T15:38:27.000000Z","formatted_deadline":"3 weeks from now"}]
/// first_page_url : "http://85.10.195.86/api/user/jobs/list?page=1"
/// from : 1
/// last_page : 2
/// last_page_url : "http://85.10.195.86/api/user/jobs/list?page=2"
/// links : [{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://85.10.195.86/api/user/jobs/list?page=1","label":"1","active":true},{"url":"http://85.10.195.86/api/user/jobs/list?page=2","label":"2","active":false},{"url":"http://85.10.195.86/api/user/jobs/list?page=2","label":"Next &raquo;","active":false}]
/// next_page_url : "http://85.10.195.86/api/user/jobs/list?page=2"
/// path : "http://85.10.195.86/api/user/jobs/list"
/// per_page : 10
/// prev_page_url : null
/// to : 10
/// total : 11
@JsonSerializable(createToJson: false)
class JobsListData {
  JobsListData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory JobsListData.fromJson(Map<String, dynamic> json) =>
      _$JobsListDataFromJson(json);
  @JsonKey(
    name: 'current_page',
  )
  num? currentPage;
  @JsonKey(
    name: 'data',
  )
  List<JobData>? data;
  @JsonKey(
    name: 'first_page_url',
  )
  String? firstPageUrl;
  @JsonKey(
    name: 'from',
  )
  num? from;
  @JsonKey(
    name: 'lastPage',
  )
  num? lastPage;
  @JsonKey(
    name: 'last_page_url',
  )
  String? lastPageUrl;
  @JsonKey(
    name: 'links',
  )
  List<Links>? links;
  @JsonKey(
    name: 'next_page_url',
  )
  String? nextPageUrl;
  @JsonKey(
    name: 'path',
  )
  String? path;
  @JsonKey(
    name: 'per_page',
  )
  num? perPage;
  @JsonKey(
    name: 'prev_page_url',
  )
  String? prevPageUrl;
  @JsonKey(
    name: 'to',
  )
  num? to;
  @JsonKey(
    name: 'total',
  )
  num? total;

  bool isLastPage(int previouslyFetchedItemsCount) {
    final newItemsCount = data?.length ?? 0;
    final totalFetchedItemsCount = previouslyFetchedItemsCount + newItemsCount;
    return totalFetchedItemsCount == total;
  }
}

/// url : null
/// label : "&laquo; Previous"
/// active : false
@JsonSerializable(createToJson: false)
class Links {
  Links({
    this.url,
    this.label,
    this.active,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  String? url;
  String? label;
  bool? active;
}

/// id : 1
/// user_id : 3
/// title : "Web Design"
/// price : "500 LE"
/// requirments : "(Med / Senior) Talent UI Designer can create interaction design"
/// description : "description for web designer job"
/// deadline : "2023-05-30 03:00:00"
/// specialization : "Developer"
/// total_applicants : 0
/// created_at : "18 minutes ago"
/// updated_at : "2023-05-08T15:38:15.000000Z"
/// formatted_deadline : "3 weeks from now"
@JsonSerializable(createToJson: false)
class JobData {
  JobData({
    this.id,
    this.userId,
    this.title,
    this.price,
    this.requirments,
    this.description,
    this.experience,
    this.deadline,
    this.specialization,
    this.totalApplicants,
    this.createdAt,
    this.updatedAt,
    this.formattedDeadline,
  });

  factory JobData.fromJson(Map<String, dynamic> json) =>
      _$JobDataFromJson(json);
  num? id;
  @JsonKey(
    name: 'user_id',
  )
  num? userId;
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
}
