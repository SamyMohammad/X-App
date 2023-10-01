import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:x_app/app/constants.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/data/remote/models/responses/get_courses_response.dart';
import 'package:x_app/data/remote/models/responses/get_education_response.dart';
import 'package:x_app/data/remote/models/responses/get_jobs_history.dart';
import 'package:x_app/data/remote/models/responses/get_profile_complilation_response.dart';
import 'package:x_app/data/remote/models/responses/login.dart';
import 'package:x_app/data/remote/models/responses/user_profile.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.signInUrl)
  Future<Login> login(
    @Field('phone_number') String phoneNumber,
    @Field("password") String password,
  );

  @POST(Constants.signUpUrl)
  Future<GenericResponseModel> register({
    @Field('phone_number') String? phoneNumber,
    @Field('email') String? email,
    @Field('first_name') String? firstName,
    @Field('middle_name') String? middleName,
    @Field('last_name') String? lastName,
    @Field('national_id') String? nationalId,
    @Field('address') String? address,
    @Field('password_confirmation') String? passwordConfirmation,
    @Field('password') String? password,
    @Field('specialization') String? specialization,
    @Field('role') String? role,
  });

  ///Courses
  @POST(Constants.addCourses)
  Future<GenericResponseModel> addCourse(@Body() Map<String, dynamic> courses);

  @GET(Constants.getCourses)
  Future<GetCoursesResponse> getCourses();

  @DELETE(Constants.deleteCourses)
  Future<GenericResponseModel> deleteCourses(
    @Field('course_id') num? courseId,
  );

  @PUT(Constants.updateCourses)
  @FormUrlEncoded()
  Future<GenericResponseModel> updateCourses(
      @Field('course_id') num? courseId,
      @Field('course_name') String? courseName,
      @Field('certificate_link') String? certificateLink);

  ///Education

  @PUT(Constants.updateEducation)
  @FormUrlEncoded()
  Future<GenericResponseModel> updateEducation(
      @Field('faculty') String? faculty,
      @Field('university') String? university);

  @GET(Constants.getEducation)
  Future<GetEducationResponse> getEducation();

  ///Specialization

  @PUT(Constants.updateSpecialization)
  Future<GenericResponseModel> updateSpecialization(
    @Field('specialization') String? specialization,
  );

  @GET(Constants.getSpecialization)
  Future<GenericResponseModel> getSpecialization();

  ///Level
  @PUT(Constants.updateLevel)
  Future<GenericResponseModel> updateLevel(
    @Field('level') String? level,
  );

  @GET(Constants.getLevel)
  Future<GenericResponseModel> getLevel();

  ///EducationState

  @PUT(Constants.updateEducationState)
  Future<GenericResponseModel> updateEducationState(
    @Field('education_state') String? educationState,
  );

  @GET(Constants.getEducationState)
  Future<GenericResponseModel> getEducationState();

  ///UserImage

  @POST(Constants.updateUserImage)
  @MultiPart()
  Future<GenericResponseModel> updateUserImage(
      @Part(name: 'user_photo') File imageFile);

  @GET(Constants.getUserImage)
  Future<GenericResponseModel> getUserImage();

  @POST(Constants.changePassword)
  Future<GenericResponseModel> changePassword(
      @Field('password') String? password,
      @Field('new_password') String? newPassword,
      @Field('new_password_confirmation') String? newPasswordConfirmation);

  @GET(Constants.userProfile)
  Future<UserProfile> getUserProfile();

  @POST(Constants.logOutUrl)
  Future<GenericResponseModel> logOut();

  @PUT(Constants.updateName)
  @FormUrlEncoded()
  Future<GenericResponseModel> updateName(
      @Field('first_name') String? firstName,
      @Field('middle_name') String? middleName,
      @Field('last_name') String? lastName);

  @GET(Constants.getAllJobsList)
  Future<GetAllJobsResponse> getAllJobsList(
    @Query('page') num? page,
  );

  @GET(Constants.getJobsStatusList)
  Future<GetJobsStatus> getJobsStatus();

  @GET(Constants.getProfileCompilation)
  Future<GetProfileCompilationResponse> getProfileCompilation();

  @POST(Constants.applyJob)
  Future<GenericResponseModel> applyJob(
    @Query('job_id') int? jobId,
  );
}
