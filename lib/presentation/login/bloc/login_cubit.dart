import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app/app/constants.dart';
import 'package:x_app/data/local/data_sources/user_secure_storage.dart';
import 'package:x_app/data/remote/models/requests/sign_in_request_rm.dart';
import 'package:x_app/data/repositories/auth_repository/auth_repo.dart';
import 'package:x_app/presentation/common/state_renderer/state_renderer.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authRepo,
  }) : super(
          const LoginState(),
        );

  final AuthRepo authRepo;

  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  init() {
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  void onSubmit() {
    final newState = state.copyWith(
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
        submissionStatus: SubmissionStatus.popupLoadingState);

    emit(newState);

    authRepo
        .login(
          SignInRequestRM(
              phoneNumber: phoneNumberController.text,
              password: passwordController.text),
        )
        .then((value) => value.fold((l) {
              print(l.message);
              final newState = state.copyWith(
                submissionStatus: SubmissionStatus.popupErrorState,
                message: l.message,
                passwordErrors: l.errors?.password ?? [],
                phoneNumberErrors: l.errors?.phoneNumber ?? [],
              );
              emit(newState);
            }, (r) async {
              await SecureStorage.write(
                value: r.data?.token ?? '',
              );
              print('____');
              // var token =await UserSecureStorage.getUserToken();
              // print(token);
              print(r.data?.token ?? '');
              final newState = state.copyWith(
                  submissionStatus: SubmissionStatus.popupSuccess,
                  message: r.message);
              emit(newState);
            }));
  }

  setErrorsToNull() {
    final newState =
        state.copyWith(passwordErrors: null, phoneNumberErrors: null);

    emit(newState);
  }

  setDataToNull() {
    final newState = state.copyWith(
      phoneNumber: '',
      password: '',
    );

    emit(newState);
  }
}
