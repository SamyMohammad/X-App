import 'package:json_annotation/json_annotation.dart';
import 'package:x_app/data/remote/models/responses/user_rm.dart';
part 'login.g.dart';
@JsonSerializable(createToJson: false)
class Login {
  Login({
    this.statusCode,
    this.data,
  this.message});
  @JsonKey(name: 'status_code',)
  num? statusCode;
  @JsonKey(name: 'message',)
  String? message;
  @JsonKey(name: 'data',)
  UserRM? data;


  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  /// Connect the generated [_$LoginToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$LoginToJson(this);
}

//
// /// status_code : 200
// /// data : {"token":"2|bB1dthl6d71EZLI0hNZY699F0ePngTBBo0u6bNWw","role":"client"}
//
// class SignIn {
//   SignIn({
//     this.statusCode,
//     this.data,});
//
//   SignIn.fromJson(dynamic json) {
//     statusCode = json['status_code'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   num? statusCode;
//   Data? data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status_code'] = statusCode;
//     if (data != null) {
//       map['data'] = data?.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// token : "2|bB1dthl6d71EZLI0hNZY699F0ePngTBBo0u6bNWw"
// /// role : "client"
//
// class Data {
//   Data({
//     this.token,
//     this.role,});
//
//   Data.fromJson(dynamic json) {
//     token = json['token'];
//     role = json['role'];
//   }
//   String? token;
//   String? role;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['token'] = token;
//     map['role'] = role;
//     return map;
//   }
//
// }