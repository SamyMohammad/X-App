import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app/data/remote/models/requests/sign_up_request_rm.dart';
import 'package:x_app/data/remote/models/requests/user_info_rm.dart';
import 'package:x_app/data/repositories/auth_repository/auth_repo.dart';
import 'package:x_app/presentation/common/state_renderer/state_renderer.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(this.authRepo) : super(const RegistrationState());
  final AuthRepo authRepo;

  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController middleNameController;
  late TextEditingController lastNameController;
  late TextEditingController nationalIdController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;
  String? specialization;

  init() {
    emailController = TextEditingController();
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    nationalIdController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
  }

  dispose() {
    emailController.dispose();
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    nationalIdController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  void onSubmit(UserInfoRM userInfoRM) {
    final newState =
        state.copyWith(submissionStatus: SubmissionStatus.popupLoadingState);

    emit(newState);

    authRepo
        .register(SignUpRequestRM(user: userInfoRM))
        .then((value) => value.fold((l) {
              if (kDebugMode) {
                print(l.message);
              }
              final newState = state.copyWith(
                submissionStatus: SubmissionStatus.popupErrorState,
                message: l.message,
                passwordErrors: l.errors?.password,
                phoneNumberErrors: l.errors?.phoneNumber,
                emailErrors: l.errors?.email,
                addressErrors: l.errors?.address,
                nationalIdErrors: l.errors?.nationalId,
              );
              emit(newState);
            }, (r) {
              final newState = state.copyWith(
                  submissionStatus: SubmissionStatus.popupSuccess,
                  message: r.message);
              emit(newState);
            }));
  }

  setErrorsToNull() {
    final newState = state.copyWith(
        nationalIdErrors: null,
        passwordErrors: null,
        addressErrors: null,
        emailErrors: null,
        phoneNumberErrors: null);

    emit(newState);
  }
}
