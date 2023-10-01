import 'dart:io';

import 'package:x_app/data/remote/models/requests/sign_in_request_rm.dart';
import 'package:x_app/data/remote/models/requests/sign_up_request_rm.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/data/remote/models/responses/get_courses_response.dart';
import 'package:x_app/data/remote/models/responses/get_education_response.dart';
import 'package:x_app/data/remote/models/responses/get_jobs_history.dart';
import 'package:x_app/data/remote/models/responses/get_profile_complilation_response.dart';
import 'package:x_app/data/remote/models/responses/login.dart';
import 'package:x_app/data/remote/models/responses/user_profile.dart';
import 'package:x_app/data/remote/network/app_api.dart';

abstract class RemoteDataSource {
  Future<Login> login(SignInRequestRM signInRequestRM);

  Future<GetAllJobsResponse> getAllJobs({required num page});

  Future<GenericResponseModel> register(SignUpRequestRM signUpRequestRMn);

  Future<GenericResponseModel> updateName(
      {String? firstName, String? middleName, String? lastName});

  Future<GenericResponseModel> addCourse(Map<String, dynamic> courses);

  Future<GetCoursesResponse> getCourse();

  Future<GetJobsStatus> getJobsStatus();

  Future<GenericResponseModel> deleteCourse({required num courseId});

  Future<GenericResponseModel> addEducation(
      {String? faculty, String? university});

  Future<GetEducationResponse> getEducation();

  Future<GenericResponseModel> updateSpecialization({String? specialization});

  Future<GenericResponseModel> getSpecialization();

  Future<GenericResponseModel> updateLevel({String? level});

  Future<GenericResponseModel> getLevel();

  Future<GenericResponseModel> updateEducationState({String? educationState});

  Future<GenericResponseModel> getEducationState();

  Future<GenericResponseModel> updatePhoto({required File imageFile});

  Future<GenericResponseModel> changePassword(
      {String? password, String? newPassword, String? newPasswordConfirmation});

  Future<GenericResponseModel> getPhoto();

  Future<GenericResponseModel> updateCourse(
      {num? courseId, String? courseName, String? certificateLink});

  Future<UserProfile> getUserProfile();

  Future<GenericResponseModel> logOut();

  Future<GetProfileCompilationResponse> getProfileCompilation();

  Future<GenericResponseModel> applyJob({int? jobId});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<Login> login(SignInRequestRM signInRequestRM) async {
    return await _appServiceClient.login(
        signInRequestRM.phoneNumber, signInRequestRM.password);
  }

  @override
  Future<GenericResponseModel> register(SignUpRequestRM signUpRequestRM) async {
    return await _appServiceClient.register(
        email: signUpRequestRM.user.email,
        role: signUpRequestRM.user.role,
        specialization: signUpRequestRM.user.specialization,
        firstName: signUpRequestRM.user.firstName,
        middleName: signUpRequestRM.user.middleName,
        lastName: signUpRequestRM.user.lastName,
        nationalId: signUpRequestRM.user.nationalId,
        phoneNumber: signUpRequestRM.user.phoneNumber,
        address: signUpRequestRM.user.address,
        passwordConfirmation: signUpRequestRM.user.passwordConfirmation,
        password: signUpRequestRM.user.password);
  }

  @override
  Future<GenericResponseModel> addCourse(Map<String, dynamic> courses) async {
    return await _appServiceClient.addCourse(courses);
  }

  @override
  Future<GetCoursesResponse> getCourse() async {
    return await _appServiceClient.getCourses();
  }

  @override
  Future<GenericResponseModel> addEducation(
      {String? faculty, String? university}) async {
    return await _appServiceClient.updateEducation(faculty, university);
  }

  @override
  Future<GetEducationResponse> getEducation() async {
    return await _appServiceClient.getEducation();
  }

  @override
  Future<GenericResponseModel> deleteCourse({required num courseId}) async {
    return await _appServiceClient.deleteCourses(courseId);
  }

  @override
  Future<GenericResponseModel> getPhoto() async {
    return await _appServiceClient.getUserImage();
  }

  @override
  Future<GenericResponseModel> updatePhoto({required File imageFile}) async {
    return await _appServiceClient.updateUserImage(imageFile);
  }

  @override
  Future<GenericResponseModel> changePassword(
      {String? password,
      String? newPassword,
      String? newPasswordConfirmation}) async {
    return await _appServiceClient.changePassword(
        password, newPassword, newPasswordConfirmation);
  }

  @override
  Future<GenericResponseModel> getSpecialization() async {
    return await _appServiceClient.getSpecialization();
  }

  @override
  Future<GenericResponseModel> updateSpecialization(
      {String? specialization}) async {
    return await _appServiceClient.updateSpecialization(specialization);
  }

  @override
  Future<GenericResponseModel> getEducationState() async {
    return await _appServiceClient.getEducationState();
  }

  @override
  Future<GenericResponseModel> getLevel() async {
    return await _appServiceClient.getLevel();
  }

  @override
  Future<GenericResponseModel> updateEducationState(
      {String? educationState}) async {
    return await _appServiceClient.updateEducationState(educationState);
  }

  @override
  Future<GenericResponseModel> updateLevel({String? level}) async {
    return await _appServiceClient.updateLevel(level);
  }

  @override
  Future<UserProfile> getUserProfile() async {
    return await _appServiceClient.getUserProfile();
  }

  @override
  Future<GenericResponseModel> logOut() async {
    return await _appServiceClient.logOut();
  }

  @override
  Future<GenericResponseModel> updateCourse(
      {num? courseId, String? courseName, String? certificateLink}) async {
    return await _appServiceClient.updateCourses(
        courseId, courseName, certificateLink);
  }

  @override
  Future<GenericResponseModel> updateName(
      {String? firstName, String? middleName, String? lastName}) async {
    return await _appServiceClient.updateName(firstName, middleName, lastName);
  }

  @override
  Future<GetAllJobsResponse> getAllJobs({required num page}) async {
    return await _appServiceClient.getAllJobsList(page);
  }

  @override
  Future<GetProfileCompilationResponse> getProfileCompilation() async {
    return await _appServiceClient.getProfileCompilation();
  }

  @override
  Future<GetJobsStatus> getJobsStatus() async {
    return await _appServiceClient.getJobsStatus();
  }

  @override
  Future<GenericResponseModel> applyJob({int? jobId}) async {
    return await _appServiceClient.applyJob(jobId);
  }
}
