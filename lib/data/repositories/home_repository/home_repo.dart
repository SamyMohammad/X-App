import 'package:dartz/dartz.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/data/remote/models/responses/get_profile_complilation_response.dart';
import 'package:x_app/data/remote/network/failures/login_failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, GetAllJobsResponse>> getAllJobs({required num page});

  Future<Either<Failure, GetProfileCompilationResponse>>
      getProfileCompilation();

  Future<Either<Failure, GenericResponseModel>> applyJob({int? jobId});
}

