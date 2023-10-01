import 'package:dartz/dartz.dart';
import 'package:x_app/data/remote/models/requests/sign_in_request_rm.dart';
import 'package:x_app/data/remote/models/requests/sign_up_request_rm.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/remote/models/responses/login.dart';
import 'package:x_app/data/remote/network/failures/login_failure.dart';

abstract class AuthRepo{
  Future<Either<Failure, Login>> login(SignInRequestRM signInRequestRM);

  Future<Either<Failure, GenericResponseModel>> register(
      SignUpRequestRM signUpRequestRM);
}
