part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class BottomNavigationToState extends HomeState {}

class GetAllJobsListLoadingState extends HomeState {}

class GetAllJobsListSuccessState extends HomeState {
  JobsListData? data;

  GetAllJobsListSuccessState({this.data});
}

class GetAllJobsListFailureState extends HomeState {
  String? message;

  GetAllJobsListFailureState({this.message});
}

class GetUserProfileSuccessState extends HomeState {
  const GetUserProfileSuccessState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class GetUserProfileErrorState extends HomeState {
  const GetUserProfileErrorState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class GetUserProfileLoadingState extends HomeState {
  const GetUserProfileLoadingState();
}

class GetProfileCompilationSuccessState extends HomeState {
  const GetProfileCompilationSuccessState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class GetProfileCompilationErrorState extends HomeState {
  const GetProfileCompilationErrorState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class GetProfileCompilationLoadingState extends HomeState {
  const GetProfileCompilationLoadingState();
}
