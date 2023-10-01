import 'package:json_annotation/json_annotation.dart';

part 'get_profile_complilation_response.g.dart';

/// status_code : 200
/// message : "User Compiliation"
/// data : {"completed":false,"rate":20}
@JsonSerializable(createToJson: false)
class GetProfileCompilationResponse {
  GetProfileCompilationResponse({
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
  ProfileCompletedData? data;

  factory GetProfileCompilationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileCompilationResponseFromJson(json);
}

/// completed : false
/// rate : 20
@JsonSerializable(createToJson: false)
class ProfileCompletedData {
  ProfileCompletedData({
    this.completed,
    this.rate,
  });

  bool? completed;
  double? rate;

  factory ProfileCompletedData.fromJson(Map<String, dynamic> json) =>
      _$ProfileCompletedDataFromJson(json);
}
