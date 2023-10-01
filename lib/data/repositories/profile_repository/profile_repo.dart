import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:x_app/data/remote/models/requests/Course.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/remote/models/responses/get_courses_response.dart';
import 'package:x_app/data/remote/models/responses/get_education_response.dart';
import 'package:x_app/data/remote/models/responses/user_profile.dart';
import 'package:x_app/data/remote/network/failures/login_failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, GenericResponseModel>> addCourse(Course course);

  Future<Either<Failure, GetCoursesResponse>> getCourses();

  Future<Either<Failure, GenericResponseModel>> deleteCourse(
      {required num courseId});

  Future<Either<Failure, GenericResponseModel>> addEducation(
      {String? faculty, String? university});

  Future<Either<Failure, GetEducationResponse>> getEducation();

  Future<Either<Failure, GenericResponseModel>> getPicture();

  Future<Either<Failure, GenericResponseModel>> updatePicture(
      {required File imageFile});

  Future<Either<Failure, GenericResponseModel>> changePassword(
      {String? password, String? newPassword, String? newPasswordConfirmation});

  Future<Either<Failure, GenericResponseModel>> updateSpecialization(
      {String? specialization});

  Future<Either<Failure, GenericResponseModel>> getSpecialization();

  Future<Either<Failure, GenericResponseModel>> updateLevel({String? level});

  Future<Either<Failure, GenericResponseModel>> getLevel();

  Future<Either<Failure, GenericResponseModel>> updateEducationState(
      {String? educationState});

  Future<Either<Failure, GenericResponseModel>> getEducationState();

  Future<Either<Failure, UserProfile>> getUserProfile();

  Future<Either<Failure, GenericResponseModel>> logOut();

  Future<Either<Failure, GenericResponseModel>> updateCourse(
      {num? courseId, String? courseName, String? certificateLink});

  Future<Either<Failure, GenericResponseModel>> updateName(
      {String? firstName, String? middleName, String? lastName});
}
