import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app/data/remote/models/responses/get_jobs_history.dart';
import 'package:x_app/data/repositories/jobs_repository/jobs_repo.dart';

part 'jobs_state.dart';

class JobsCubit extends Cubit<JobsState> {
  JobsCubit(this.jobsRepo) : super(JobsInitial());
  JobsRepo jobsRepo;

  GetJobsStatus? getJobsStatus;

  static JobsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getHistoryJobs() async {
    emit(GetJobsStatusListLoadingState());
    jobsRepo.getJobsStatusList().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }
          emit(GetJobsStatusListFailureState(message: l.message));
        }, (r) {
          if (r.data?.isEmpty ?? false) {
            emit(GetJobsStatusListEmptyState());
          } else {
            getJobsStatus = r;
            emit(GetJobsStatusListSuccessState());
          }
        }));
  }
}
