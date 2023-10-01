import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:x_app/data/remote/data_sources/remote_data_source.dart';
import 'package:x_app/data/remote/models/requests/Course.dart';
import 'package:x_app/data/remote/models/responses/generic_response_model.dart';
import 'package:x_app/data/remote/models/responses/get_courses_response.dart';
import 'package:x_app/data/remote/models/responses/get_education_response.dart';
import 'package:x_app/data/remote/models/responses/user_profile.dart';
import 'package:x_app/data/remote/network/error_handler.dart';
import 'package:x_app/data/remote/network/failures/login_failure.dart';
import 'package:x_app/data/remote/network/network_info.dart';
import 'package:x_app/data/repositories/profile_repository/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final RemoteDataSourceImpl _remoteDataSource;
  final NetworkInfo _networkInfo;

  // final BehaviorSubject<User?> _userSubject = BehaviorSubject();
  ProfileRepoImpl(this._remoteDataSource, this._networkInfo
      // this._localDataSource
      );

  @override
  Future<Either<Failure, GenericResponseModel>> addCourse(Course course) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final courses = [
          Course(
              courseName: course.courseName,
              certificateLink: course.certificateLink),
        ];

        final response = await _remoteDataSource
            .addCourse({'courses': courses.map((c) => c.toJson()).toList()});

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GetCoursesResponse>> getCourses() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getCourse();

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> addEducation(
      {String? faculty, String? university}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.addEducation(
            faculty: faculty, university: university);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GetEducationResponse>> getEducation() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getEducation();

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> deleteCourse(
      {required num courseId}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response =
            await _remoteDataSource.deleteCourse(courseId: courseId);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> getPicture() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getPhoto();

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> updatePicture(
      {required File imageFile}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response =
            await _remoteDataSource.updatePhoto(imageFile: imageFile);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> changePassword(
      {String? password,
      String? newPassword,
      String? newPasswordConfirmation}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.changePassword(
            newPassword: newPassword,
            newPasswordConfirmation: newPasswordConfirmation,
            password: password);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> getSpecialization() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getSpecialization();

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> updateSpecialization(
      {String? specialization}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.updateSpecialization(
            specialization: specialization);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> getEducationState() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getEducationState();

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> getLevel() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getLevel();

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> updateEducationState(
      {String? educationState}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.updateEducationState(
            educationState: educationState);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> updateLevel(
      {String? level}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.updateLevel(level: level);

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, UserProfile>> getUserProfile() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.getUserProfile();

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> logOut() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.logOut();

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> updateCourse(
      {num? courseId, String? courseName, String? certificateLink}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.updateCourse(
          courseId: courseId,
          certificateLink: certificateLink,
          courseName: courseName,
        );

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }

  @override
  Future<Either<Failure, GenericResponseModel>> updateName(
      {String? firstName, String? middleName, String? lastName}) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.updateName(
          firstName: firstName,
          lastName: lastName,
          middleName: middleName,
        );

        if (response.statusCode == ResponseCode.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response);
        } else {
          // failure --return business error
          // return either left
          return Left(Failure(
            statusCode: ApiInternalStatus.FAILURE,
            message: response.message ?? ResponseMessage.DEFAULT,
          ));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure!);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure() ?? Failure());
    }
  }
}
