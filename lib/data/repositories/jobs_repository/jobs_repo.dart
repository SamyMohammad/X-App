import 'package:dartz/dartz.dart';
import 'package:x_app/data/remote/models/responses/get_jobs_history.dart';
import 'package:x_app/data/remote/network/failures/login_failure.dart';

abstract class JobsRepo {
  Future<Either<Failure, GetJobsStatus>> getJobsStatusList();
}
