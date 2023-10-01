part of 'jobs_cubit.dart';

abstract class JobsState {}

class JobsInitial extends JobsState {}

class GetJobsStatusListLoadingState extends JobsState {}

class GetJobsStatusListSuccessState extends JobsState {
  GetJobsStatusListSuccessState();
}

class GetJobsStatusListFailureState extends JobsState {
  String? message;

  GetJobsStatusListFailureState({this.message});
}
class GetJobsStatusListEmptyState extends JobsState {

  GetJobsStatusListEmptyState();
}
