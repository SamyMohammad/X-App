import 'package:dartz/dartz.dart';
import 'package:x_app/data/remote/data_sources/remote_data_source.dart';
import 'package:x_app/data/remote/models/responses/get_jobs_history.dart';
import 'package:x_app/data/remote/network/error_handler.dart';
import 'package:x_app/data/remote/network/failures/login_failure.dart';
import 'package:x_app/data/remote/network/network_info.dart';
import 'package:x_app/data/repositories/jobs_repository/jobs_repo.dart';

class JobsRepoImpl implements JobsRepo {
  final RemoteDataSourceImpl _remoteDataSource;
  final NetworkInfo _networkInfo;

  // final BehaviorSubject<User?> _userSubject = BehaviorSubject();
  JobsRepoImpl(this._remoteDataSource, this._networkInfo
      // this._localDataSource
      );

  @override
  Future<Either<Failure, GetJobsStatus>> getJobsStatusList() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getJobsStatus();

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
