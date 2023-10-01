part of 'job_details_cubit.dart';

abstract class JobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}

class ApplyJobLoadingState extends JobDetailsState {}

class ApplyJobSuccessState extends JobDetailsState {
  ApplyJobSuccessState({this.genericResponseModel});

  GenericResponseModel? genericResponseModel;
}

class ApplyJobFailureState extends JobDetailsState {
  String? message;

  ApplyJobFailureState({this.message});
}
