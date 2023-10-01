import 'package:dartz/dartz.dart';
import 'package:x_app/data/remote/data_sources/remote_data_source.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/data/remote/models/responses/get_profile_complilation_response.dart';
import 'package:x_app/data/remote/network/error_handler.dart';
import 'package:x_app/data/remote/network/failures/login_failure.dart';
import 'package:x_app/data/remote/network/network_info.dart';
import 'package:x_app/data/repositories/home_repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final RemoteDataSourceImpl _remoteDataSource;
  final NetworkInfo _networkInfo;

  // final BehaviorSubject<User?> _userSubject = BehaviorSubject();
  HomeRepoImpl(this._remoteDataSource, this._networkInfo
      // this._localDataSource
      );

  @override
  Future<Either<Failure, GetAllJobsResponse>> getAllJobs(
      {required num page}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getAllJobs(page: page);

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
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GetProfileCompilationResponse>>
      getProfileCompilation() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getProfileCompilation();

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
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> applyJob({int? jobId}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.applyJob(jobId: jobId);

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
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }
}
