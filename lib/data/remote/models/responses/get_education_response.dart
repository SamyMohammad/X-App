import 'package:json_annotation/json_annotation.dart';

/// status_code : 200
/// message : "User Certificates Retrivied Successfully"
/// data : [{"id":1,"user_id":2,"course_name":"Coudd","certificate_link":"https://www.example.com/course-a","created_at":"2023-04-17T02:42:21.000000Z","updated_at":"2023-04-17T02:42:21.000000Z"},{"id":2,"user_id":2,"course_name":"Course B","certificate_link":"https://www.example.com/course-b","created_at":"2023-04-17T02:42:21.000000Z","updated_at":"2023-04-17T02:42:21.000000Z"},{"id":3,"user_id":2,"course_name":"Cou","certificate_link":"https://www.example.com/course-a","created_at":"2023-04-17T05:59:31.000000Z","updated_at":"2023-04-17T05:59:31.000000Z"},{"id":4,"user_id":2,"course_name":"Course B","certificate_link":"https://www.example.com/course-b","created_at":"2023-04-17T05:59:31.000000Z","updated_at":"2023-04-17T05:59:31.000000Z"},{"id":5,"user_id":2,"course_name":"Cou","certificate_link":"https://www.example.com/course-a","created_at":"2023-04-17T06:39:59.000000Z","updated_at":"2023-04-17T06:39:59.000000Z"},{"id":6,"user_id":2,"course_name":"Cou","certificate_link":"https://www.example.com/course-a","created_at":"2023-04-17T06:40:22.000000Z","updated_at":"2023-04-17T06:40:22.000000Z"},{"id":7,"user_id":2,"course_name":"asd","certificate_link":"https://www.example.com/course-b","created_at":"2023-04-17T22:34:59.000000Z","updated_at":"2023-04-17T22:34:59.000000Z"},{"id":8,"user_id":2,"course_name":"asd","certificate_link":"https://www.example.com/samy-sb","created_at":"2023-04-17T22:36:34.000000Z","updated_at":"2023-04-17T22:36:34.000000Z"},{"id":9,"user_id":2,"course_name":"asd","certificate_link":"https://www.example.com/samy-sb","created_at":"2023-04-17T22:58:53.000000Z","updated_at":"2023-04-17T22:58:53.000000Z"},{"id":10,"user_id":2,"course_name":"asd","certificate_link":"https://www.facebook.com/","created_at":"2023-04-17T23:02:52.000000Z","updated_at":"2023-04-17T23:02:52.000000Z"},{"id":11,"user_id":2,"course_name":"asd","certificate_link":"https://www.facebook.com/","created_at":"2023-04-17T23:04:24.000000Z","updated_at":"2023-04-17T23:04:24.000000Z"}]
part 'get_education_response.g.dart';

@JsonSerializable(createToJson: false)
class GetEducationResponse {
  GetEducationResponse({
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetEducationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEducationResponseFromJson(json);
  @JsonKey(name: 'status_code')
  num? statusCode;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  Education? data;
}

/// id : 1
/// user_id : 2
/// course_name : "Coudd"
/// certificate_link : "https://www.example.com/course-a"
/// created_at : "2023-04-17T02:42:21.000000Z"
/// updated_at : "2023-04-17T02:42:21.000000Z"
@JsonSerializable(createToJson: false)
class Education {
  Education({this.id, this.faculty, this.university});

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  @JsonKey(name: 'id')
  num? id;
  @JsonKey(name: 'faculty')
  String? faculty;
  @JsonKey(name: 'university')
  String? university;
}
