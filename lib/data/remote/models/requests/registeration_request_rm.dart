// import 'package:json_annotation/json_annotation.dart';
//
// part 'registeration_request_rm.g.dart';
//
// @JsonSerializable(createFactory: false)
// class RegistrationRequestRM {
//   const RegistrationRequestRM({
//     required this.phoneNumber,
//     required this.password,
//     required this.firstName,
//     required this.middleName,
//     required this.lastName,
//     required this.nationalId,
//     required this.email,
//     required this.address,
//     required this.passwordConfirmation,
//   });
//
//   @JsonKey(name: 'first_name')
//   final String firstName;
//   @JsonKey(name: 'middle_name')
//   final String middleName;
//   @JsonKey(name: 'last_name')
//   final String lastName;
//   @JsonKey(name: 'national_id')
//   final String nationalId;
//   @JsonKey(name: 'email')
//   final String email;
//   @JsonKey(name: 'phone_number')
//   final String phoneNumber;
//   @JsonKey(name: 'address')
//   final String address;
//   @JsonKey(name: 'password')
//   final String password;
//   @JsonKey(name: 'password_confirmation')
//   final String passwordConfirmation;
//
//   Map<String, dynamic> toJson() => _$RegistrationRequestRMToJson(this);
// }
