part of 'history_cubit.dart';

abstract class HistoryState {
  const HistoryState();
}

class HistoryInitial extends HistoryState {}

class GetHistoryJobsListLoadingState extends HistoryState {}

class GetHistoryJobsListSuccessState extends HistoryState {
  GetHistoryJobsListSuccessState();
}

class GetHistoryJobsListFailureState extends HistoryState {
  String? message;

  GetHistoryJobsListFailureState({this.message});
}
