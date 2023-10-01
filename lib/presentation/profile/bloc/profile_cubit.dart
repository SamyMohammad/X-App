import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_app/data/remote/models/requests/Course.dart';
import 'package:x_app/data/remote/models/responses/get_courses_response.dart';
import 'package:x_app/data/remote/models/responses/get_education_response.dart';
import 'package:x_app/data/remote/models/responses/user_profile.dart';
import 'package:x_app/data/repositories/profile_repository/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(const InitialProfileState());
  final ProfileRepo profileRepo;

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  late TextEditingController courseController;
  late TextEditingController certificateController;
  late TextEditingController facultyController;
  late TextEditingController universityController;
   TextEditingController? lastPasswordController;
   TextEditingController? newPasswordController;
   TextEditingController? confirmNewPasswordController;
   TextEditingController? firstNameController;
   TextEditingController? middleNameController;
   TextEditingController? lastNameController;
  UserProfile? userProfile;
  List<Data> coursesList = [];
  List<Education> educationList = [];
  String? profilePictureUrl;
  String? university;
  String? faculty;
  String? specialization;
  String? level;

   num? onTime;
   num? jobCompleted;
   num? acceptance;
   num? rejection;
   num? totalIncome;

  String? specializationInDropDown;
  String? levelInDropDown;
  String? educationStatus;
  String? educationStatusInDropDown;
  String? facultyInDropDown;
  String? universityInDropDown;

  initEditAccountControllers() {
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    lastPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  initAddCourseControllers() {
    courseController = TextEditingController();
    certificateController = TextEditingController();
  }

  initEducationControllers() {
    facultyController = TextEditingController();
    universityController = TextEditingController();
  }

  disposeEditAccountControllers() {
    firstNameController?.dispose();
    middleNameController?.dispose();
    lastNameController?.dispose();
    lastPasswordController?.dispose();
    newPasswordController?.dispose();
    confirmNewPasswordController?.dispose();
  }

  disposeEducationControllers() {
    facultyController.dispose();
    universityController.dispose();
  }

  disposeAddCourseControllers() {
    courseController.dispose();
    certificateController.dispose();
  }

  addToCoursesList(Data course) {
    coursesList.add(course);
  }

  chooseSpecialization(dynamic value) {
    specializationInDropDown = value;
    emit(const ChooseSpecializationState());
  }

  chooseFaculty(dynamic value) {
    facultyInDropDown = value;
    emit(const ChooseFacultyState());
  }

  chooseUniversity(dynamic value) {
    universityInDropDown = value;
    emit(const ChooseUniversityState());
  }

  chooseLevel(dynamic value) {
    levelInDropDown = value;
    emit(ChooseLevelState());
  }

  chooseEducationState(dynamic value) {
    educationStatusInDropDown = value;
    emit(const ChooseEducationStateState());
  }

  //courses

  void addCourse() {
    emit(const AddCourseLoadingState());
    Course course = Course(
        certificateLink: certificateController.text,
        courseName: courseController.text);
    profileRepo.addCourse(course).then(
          (value) => value.fold((l) {
            if (kDebugMode) {
              print(l.message);
            }

            emit(AddCourseErrorState(
                message: l.message ?? '', data: l.errors?.address));
          }, (r) {
            addToCoursesList(Data(
                courseName: courseController.text,
                certificateLink: certificateController.text));
            emit(AddCourseSuccessState(message: r.message ?? ''));
          }),
        );
  }

  void getCourses() {
    emit(ProfileLoading());
    profileRepo.getCourses().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const GetCoursesErrorState());
        }, (r) {
          if (r.data!.isEmpty) {
            emit(const GetCoursesEmptyState());
          } else {
            coursesList = r.data ?? [];
            emit(GetCoursesSuccessState(data: r.data ?? []));
          }
        }));
  }

  void deleteCourse({
    required num courseId,
    required int index,
  }) {
    // emit(AddCourseLoadingState());
    profileRepo
        .deleteCourse(courseId: courseId)
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }

              emit(DeleteCourseErrorState(
                  message: l.message ?? '', data: l.errors?.address));
            }, (r) {
              coursesList.removeAt(index);
              print(index);

              print(coursesList);
              emit(const DeleteCourseSuccessState());
            }));
  }

  //Photo
  void getPhoto() {
    emit(ProfileLoading());

    profileRepo.getPicture().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const GetPictureErrorState());
        }, (r) {
          profilePictureUrl = r.data;
          emit(GetPictureSuccessState(data: r.data ?? ''));
        }));
  }

  void updatePhoto() {
    profileRepo
        .updatePicture(imageFile: image ?? File(''))
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }

              emit(const UpdatePictureErrorState());
            }, (r) {
              getPhoto();
              emit(UpdatePictureSuccessState(data: r.data ?? ''));
            }));
  }

  void updateCourse(
      {num? courseId, String? courseName, String? certificateLink}) {
    profileRepo
        .updateCourse(
            courseName: courseName,
            certificateLink: certificateLink,
            courseId: courseId)
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }

              emit(const UpdateCourseErrorState());
            }, (r) {
              emit(UpdateCourseSuccessState(
                  data: r.data ?? '', message: r.message ?? ''));
            }));
  }

  void updateName() {
    profileRepo
        .updateName(
            middleName: middleNameController?.text,
            lastName: lastNameController?.text,
            firstName: firstNameController?.text)
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }

              emit(UpdateNameErrorState(
                message: l.message ?? '',
              ));
            }, (r) {
              emit(UpdateNameSuccessState(
                  data: r.data ?? '', message: r.message ?? ''));
            }));
  }

  //Specialization
  void getSpecialization() {
    emit(const GetSpecializationLoadingState());

    profileRepo.getSpecialization().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const GetSpecializationErrorState());
        }, (r) {
          specialization = r.data;
          emit(GetSpecializationSuccessState(data: r.data ?? ''));
        }));
  }

  void updateSpecialization(String? specialization) {
    emit(const UpdateSpecializationLoadingState());

    profileRepo
        .updateSpecialization(specialization: specialization)
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }

              emit(const UpdateSpecializationErrorState());
            }, (r) {
              emit(UpdateSpecializationSuccessState(
                  message: r.message!, data: r.data ?? ''));
            }));
  }

//level
  void getLevel() {
    emit(const GetLevelLoadingState());

    profileRepo.getSpecialization().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const GetLevelErrorState());
        }, (r) {
          emit(GetLevelSuccessState(data: r.data ?? ''));
        }));
  }

  void updateLevel(String? level) {
    emit(const UpdateLevelLoadingState());

    profileRepo.updateLevel(level: level).then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const UpdateLevelErrorState());
        }, (r) {
          emit(
              UpdateLevelSuccessState(message: r.message!, data: r.data ?? ''));
        }));
  }

  //educationState
  void getEducationState() {
    emit(const GetEducationStateLoadingState());

    profileRepo.getEducationState().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const GetEducationStateErrorState());
        }, (r) {
          educationStatus = r.data;
          emit(GetEducationStateSuccessState(data: r.data ?? ''));
        }));
  }

  void updateEducationState(String? educationState) {
    emit(const UpdateEducationStateLoadingState());

    profileRepo
        .updateEducationState(educationState: educationState)
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }

              emit(const UpdateEducationStateErrorState());
            }, (r) {
              emit(UpdateEducationStateSuccessState(
                  message: r.message!, data: r.data ?? ''));
            }));
  }

  //Education
  void addEducation() {
    // emit(AddCourseLoadingState());
    profileRepo
        .addEducation(
            faculty: facultyInDropDown, university: universityInDropDown)
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }

              emit(AddEducationErrorState(
                  message: l.message ?? '', data: l.errors?.address));
            }, (r) {
              emit(const AddEducationSuccessState());
            }));
  }

  void getEducation() {
    emit(ProfileLoading());
    profileRepo.getEducation().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(GetEducationErrorState(message: l.message ?? ''));
        }, (r) {
          faculty = r.data?.faculty;
          university = r.data?.university;
          facultyController.text = r.data?.faculty ?? '';
          universityController.text = r.data?.university ?? '';

          emit(GetEducationSuccessState(data: r.data ?? Education()));
        }));
  }

  //changePassword
  void changePassword() {
    emit(const ChangePasswordLoadingState());
    profileRepo
        .changePassword(
            password: lastPasswordController?.text,
            newPasswordConfirmation: confirmNewPasswordController?.text,
            newPassword: newPasswordController?.text)
        .then(
          (value) => value.fold((l) {
            if (kDebugMode) {
              print(l.message);
            }

            emit(ChangePasswordErrorState(
                message: l.message ?? '', data: l.errors?.address));
          }, (r) {
            emit(const ChangePasswordSuccessState());
          }),
        );
  }

  Future<void> getUserProfile() async {
    emit(const GetUserProfileLoadingState());
    await profileRepo.getUserProfile().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const GetUserProfileErrorState());
        }, (r) {
          firstNameController?.text = r.data?.userData?.firstName ?? '';
          middleNameController?.text = r.data?.userData?.middleName ?? '';
          lastNameController?.text = r.data?.userData?.lastName ?? '';
          userProfile = r;
          acceptance = r.data?.userData?.acceptanceRate ?? 0;
          rejection = r.data?.userData?.rejectionRate ?? 0;
          onTime = r.data?.userData?.ontimeRate ?? 0;
          jobCompleted = r.data?.userData?.jobCompleted ?? 0;
          totalIncome = r.data?.userData?.totalIncome ?? 0;

          level = r.data?.userData?.level;
          educationStatus = r.data?.userData?.educationalState;
          // specialization=r.data?.userData?.specialization;

          emit(GetUserProfileSuccessState(data: r.data ?? []));
        }));
  }

  void logout() {
    emit(const LogOutLoadingState());
    profileRepo.logOut().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const LogOutErrorState());
        }, (r) {
          emit(const LogOutSuccessState());
        }));
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      emit(PickImageState());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
