import 'package:dartz/dartz.dart';
import 'package:x_app/data/remote/data_sources/remote_data_source.dart';
import 'package:x_app/data/remote/models/requests/sign_in_request_rm.dart';
import 'package:x_app/data/remote/models/requests/sign_up_request_rm.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/remote/models/responses/login.dart';
import 'package:x_app/data/remote/network/error_handler.dart';
import 'package:x_app/data/remote/network/failures/login_failure.dart';
import 'package:x_app/data/remote/network/network_info.dart';
import 'package:x_app/data/repositories/auth_repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final RemoteDataSourceImpl remoteDataSource;
  final NetworkInfo networkInfo;

  // final UserSecureStorage userSecureStorage;
  AuthRepoImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Login>> login(SignInRequestRM signInRequestRM) async {
    if (await networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await remoteDataSource.login(signInRequestRM);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data
          print(response.data?.token);

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  // Stream<User?> getUser() async* {
  //   if (!_userSubject.hasValue) {
  //     final userInfo = await Future.wait([
  //       _secureStorage.getUserEmail(),
  //       _secureStorage.getUsername(),
  //     ]);
  //
  //     final email = userInfo[0];
  //     final username = userInfo[1];
  //
  //     if (email != null && username != null) {
  //       // _userSubject.add(
  //       //   // User(
  //       //   //   email: email,
  //       //   //   username: username,
  //       //   // ),
  //       // );
  //     } else {
  //       _userSubject.add(
  //         null,
  //       );
  //     }
  //   }
  //
  //   yield* _userSubject.stream;
  // }

  // Future<String?> getUserToken() {
  //   return _secureStorage.getUserToken();
  // }

  @override
  Future<Either<Failure, GenericResponseModel>> register(
      SignUpRequestRM signUpRequestRM) async {
    if (await networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await remoteDataSource.register(signUpRequestRM);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {

        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(
          DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }
}
