import 'package:json_annotation/json_annotation.dart';

part 'user_info_rm.g.dart';

@JsonSerializable(createFactory: false)
class UserInfoRM {
  const UserInfoRM({
    this.role = 'client',
    required this.specialization,
    required this.email,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.nationalId,
    required this.phoneNumber,
    required this.address,
    required this.passwordConfirmation,
    required this.password,
  });

  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'middle_name')
  final String middleName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'national_id')
  final String nationalId;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  @JsonKey(name: 'specialization')
  final String specialization;
  @JsonKey(name: 'role')
  final String role;

  Map<String, dynamic> toJson() => _$UserInfoRMToJson(this);
}
