part of 'profile_cubit.dart';

abstract class ProfileState {
  const ProfileState();
}

class InitialProfileState extends ProfileState {
  const InitialProfileState();
}

class ProfileLoading extends ProfileState {
  ProfileLoading();
}

class PickImageState extends ProfileState {}
//add course

class AddCourseSuccessState extends ProfileState {
  const AddCourseSuccessState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  AddCourseSuccessState copyWith({
    String? message,
    dynamic data,
  }) {
    return AddCourseSuccessState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class AddCourseErrorState extends ProfileState {
  const AddCourseErrorState({this.message = '', this.data});

  final String message;
  final List<String>? data;

  String getMessage() => message;

  AddCourseErrorState copyWith({
    String? message,
    dynamic data,
  }) {
    return AddCourseErrorState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class AddCourseLoadingState extends ProfileState {
  const AddCourseLoadingState();

  @override
  List<Object?> get props => [];
}

class EmptyCoursesState extends ProfileState {
  const EmptyCoursesState({
    required this.data,
    this.message = '',
  });

  final String message;
  final List<Data> data;

  String getMessage() => message;
}

//get course
class GetCoursesLoadingState extends ProfileState {}

class GetCoursesSuccessState extends ProfileState {
  const GetCoursesSuccessState({
    required this.data,
    this.message = '',
  });

  final String message;
  final List<Data> data;

  String getMessage() => message;
}

class GetCoursesEmptyState extends ProfileState {
  const GetCoursesEmptyState();
}

class GetCoursesErrorState extends ProfileState {
  const GetCoursesErrorState({
    this.message = '',
  });

  final String message;

  String getMessage() => message;
}
//add course

class AddEducationSuccessState extends ProfileState {
  const AddEducationSuccessState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  AddEducationSuccessState copyWith({
    String? message,
    dynamic data,
  }) {
    return AddEducationSuccessState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class AddEducationErrorState extends ProfileState {
  const AddEducationErrorState({this.message = '', this.data});

  final String message;
  final List<String>? data;

  String getMessage() => message;

  AddEducationErrorState copyWith({
    String? message,
    dynamic data,
  }) {
    return AddEducationErrorState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class AddEducationLoadingState extends ProfileState {
  const AddEducationLoadingState();

  @override
  List<Object?> get props => [];
}

class ChangePasswordSuccessState extends ProfileState {
  const ChangePasswordSuccessState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  ChangePasswordSuccessState copyWith({
    String? message,
    dynamic data,
  }) {
    return ChangePasswordSuccessState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class ChangePasswordErrorState extends ProfileState {
  const ChangePasswordErrorState({this.message = '', this.data});

  final String message;
  final List<String>? data;

  String getMessage() => message;

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class ChangePasswordLoadingState extends ProfileState {
  const ChangePasswordLoadingState();

  @override
  List<Object?> get props => [];
}

//delete course

class DeleteCourseSuccessState extends ProfileState {
  const DeleteCourseSuccessState({
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

class DeleteCourseErrorState extends ProfileState {
  const DeleteCourseErrorState({this.message = '', this.data});

  final String message;
  final List<String>? data;

  String getMessage() => message;

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class DeleteCourseLoadingState extends ProfileState {
  const DeleteCourseLoadingState();

  @override
  List<Object?> get props => [];
}

class UpdateCourseSuccessState extends ProfileState {
  const UpdateCourseSuccessState({
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

class UpdateCourseErrorState extends ProfileState {
  const UpdateCourseErrorState({this.message = '', this.data});

  final String message;
  final List<String>? data;

  String getMessage() => message;

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class UpdateCourseLoadingState extends ProfileState {
  const UpdateCourseLoadingState();

  @override
  List<Object?> get props => [];
}

class UpdateNameSuccessState extends ProfileState {
  const UpdateNameSuccessState({
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

class UpdateNameErrorState extends ProfileState {
  const UpdateNameErrorState({this.message = '', this.data});

  final String message;
  final List<String>? data;

  String getMessage() => message;

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class UpdateNameLoadingState extends ProfileState {
  const UpdateNameLoadingState();

  @override
  List<Object?> get props => [];
}
//get course

class GetEducationSuccessState extends ProfileState {
  const GetEducationSuccessState({
    required this.data,
    this.message = '',
  });

  final String message;
  final Education data;

  String getMessage() => message;
}

class GetEducationEmptyState extends ProfileState {
  const GetEducationEmptyState();
}

class GetEducationErrorState extends ProfileState {
  const GetEducationErrorState({
    this.message = '',
  });

  final String message;

  String getMessage() => message;
}

class GetPictureSuccessState extends ProfileState {
  const GetPictureSuccessState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  GetPictureSuccessState copyWith({
    String? message,
    dynamic data,
  }) {
    return GetPictureSuccessState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class GetPictureErrorState extends ProfileState {
  const GetPictureErrorState({this.message = '', this.data});

  final String message;
  final List<String>? data;

  String getMessage() => message;

  GetPictureErrorState copyWith({
    String? message,
    dynamic data,
  }) {
    return GetPictureErrorState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class UpdatePictureSuccessState extends ProfileState {
  const UpdatePictureSuccessState({
    this.data,
    this.message = '',
  });

  final String message;
  final dynamic data;

  String getMessage() => message;

  GetPictureSuccessState copyWith({
    String? message,
    dynamic data,
  }) {
    return GetPictureSuccessState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

class UpdatePictureErrorState extends ProfileState {
  const UpdatePictureErrorState({this.message = '', this.data});

  final String message;
  final List<String>? data;

  String getMessage() => message;

  UpdatePictureErrorState copyWith({
    String? message,
    dynamic data,
  }) {
    return UpdatePictureErrorState(
        message: message ?? this.message, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [
        message,
        data,
      ];
}

//specialization
class GetSpecializationSuccessState extends ProfileState {
  const GetSpecializationSuccessState({
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

class GetSpecializationErrorState extends ProfileState {
  const GetSpecializationErrorState({
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

class GetSpecializationLoadingState extends ProfileState {
  const GetSpecializationLoadingState();
}

class UpdateSpecializationSuccessState extends ProfileState {
  const UpdateSpecializationSuccessState({
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

class UpdateSpecializationErrorState extends ProfileState {
  const UpdateSpecializationErrorState({
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

class UpdateSpecializationLoadingState extends ProfileState {
  const UpdateSpecializationLoadingState();
}

class ChooseSpecializationState extends ProfileState {
  const ChooseSpecializationState();
}

//level

class GetLevelSuccessState extends ProfileState {
  const GetLevelSuccessState({
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

class GetLevelErrorState extends ProfileState {
  const GetLevelErrorState({
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

class GetLevelLoadingState extends ProfileState {
  const GetLevelLoadingState();
}

class UpdateLevelSuccessState extends ProfileState {
  const UpdateLevelSuccessState({
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

class UpdateLevelErrorState extends ProfileState {
  const UpdateLevelErrorState({
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

class UpdateLevelLoadingState extends ProfileState {
  const UpdateLevelLoadingState();
}

class ChooseLevelState extends ProfileState {
  ChooseLevelState();
}

//educationState

class GetEducationStateSuccessState extends ProfileState {
  const GetEducationStateSuccessState({
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

class GetEducationStateErrorState extends ProfileState {
  const GetEducationStateErrorState({
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

class GetEducationStateLoadingState extends ProfileState {
  const GetEducationStateLoadingState();
}

class UpdateEducationStateSuccessState extends ProfileState {
  const UpdateEducationStateSuccessState({
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

class UpdateEducationStateErrorState extends ProfileState {
  const UpdateEducationStateErrorState({
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

class UpdateEducationStateLoadingState extends ProfileState {
  const UpdateEducationStateLoadingState();
}

class ChooseEducationStateState extends ProfileState {
  const ChooseEducationStateState();
}

//UserProfile
class GetUserProfileSuccessState extends ProfileState {
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

class GetUserProfileErrorState extends ProfileState {
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

class GetUserProfileLoadingState extends ProfileState {
  const GetUserProfileLoadingState();
}
//logout

class LogOutSuccessState extends ProfileState {
  const LogOutSuccessState({
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

class LogOutErrorState extends ProfileState {
  const LogOutErrorState({
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

class LogOutLoadingState extends ProfileState {
  const LogOutLoadingState();
}

class ChooseFacultyState extends ProfileState {
  const ChooseFacultyState();
}

class ChooseUniversityState extends ProfileState {
  const ChooseUniversityState();
}
