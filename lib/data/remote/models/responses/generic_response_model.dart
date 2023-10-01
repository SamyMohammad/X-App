import 'package:json_annotation/json_annotation.dart';

/// status_code : 200
/// message : "Account Created Successfully"
/// data : null
part 'generic_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GenericResponseModel {
  GenericResponseModel({
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
  dynamic data;

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GenericResponseModelFromJson(json);
}