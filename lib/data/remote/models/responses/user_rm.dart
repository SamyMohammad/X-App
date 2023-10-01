import 'package:json_annotation/json_annotation.dart';

part 'user_rm.g.dart';

@JsonSerializable(createToJson: false)
class UserRM {
  UserRM({
    this.role,
    this.token,


  });
  @JsonKey(
    name: 'token',
  )
  String? token;
  @JsonKey(
    name: 'role',
  )
  String? role;

  static const fromJson = _$UserRMFromJson;
}
