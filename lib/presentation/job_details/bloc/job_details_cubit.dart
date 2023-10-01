import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/repositories/home_repository/home_repo.dart';

part 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit(this.repo) : super(JobDetailsInitial());
  HomeRepo repo;

  static JobDetailsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getHistoryJobs({int? jobId}) async {
    emit(ApplyJobLoadingState());
    repo.applyJob(jobId: jobId).then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }
          emit(ApplyJobFailureState(message: l.message));
        }, (r) {
          emit(ApplyJobSuccessState(genericResponseModel: r));
        }));
  }
}
