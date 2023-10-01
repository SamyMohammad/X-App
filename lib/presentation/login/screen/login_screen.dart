import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/app/functions.dart';
import 'package:x_app/components/custom_toast.dart';
import 'package:x_app/presentation/common/state_renderer/state_renderer.dart';
import 'package:x_app/presentation/login/bloc/login_cubit.dart';
import 'package:x_app/presentation/login/widgets/login_form.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/font_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {Key? key,
      this.onSignUpTap,
      this.onForgotMyPasswordTap,
      required this.onSignInSuccess})
      : super(key: key);
  final VoidCallback? onSignUpTap;
  final VoidCallback? onForgotMyPasswordTap;
  final VoidCallback onSignInSuccess;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => LoginCubit(authRepo: instance()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (oldState, newState) =>
            oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state,) {
          if (state.submissionStatus == SubmissionStatus.popupSuccess) {
            showCustomToast(
              message: state.message,
              color: ColorManager.primary,
              iconData: Icons.check_circle_outline,
            );
            widget.onSignInSuccess();
            return;
          }
          if (state.submissionStatus == SubmissionStatus.popupErrorState) {
            Navigator.pop(context);

            showCustomToast(
                message: state.message,
                color: Colors.red,
                iconData: Icons.error_outline,
                passwordErrorsList: state.passwordErrors,
                phoneNumberErrorsList: state.phoneNumberErrors);

            return;
          }
          if (state.submissionStatus == SubmissionStatus.popupLoadingState) {
            buildShowLoadingDialog(context);
            Future.delayed( const Duration(seconds: 2));
            final cubit = context.read<LoginCubit>();
            cubit.setErrorsToNull();
            return;
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();

          return buildContentBody(context, cubit, state);

          // return buildContentBody(context, cubit, state);
        },
      ),
    );
  }

  showCustomToast({
    Color? color,
    String? message,
    IconData? iconData,
    List<String>? phoneNumberErrorsList,
    List<String>? passwordErrorsList,
  }) {
    Widget toast = CustomToast(
      iconData: iconData,
      color: color,
      message: message,
      passwordErrors: buildErrors(passwordErrorsList),
      phoneNumberErrors: buildErrors(phoneNumberErrorsList),
    );
    AnimatedSnackBar(
      duration: const Duration(seconds: 4),
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: toast,
        );
      }),
    ).show(context);
    FocusManager.instance.primaryFocus?.unfocus();

    // fToast?.showToast(
    //     child: toast,
    //     toastDuration: const Duration(seconds: 4),
    //     fadeDuration: const Duration(seconds: 1),
    //     gravity: ToastGravity.BOTTOM);
  }

  List<Padding>? buildErrors(List<String>? errorsList) {
    return errorsList
        ?.map(
          (e) => Padding(
            padding: EdgeInsets.only(bottom: 8.0.h, right: 10.w, left: 10.w),
            child: Text(
              '-$e',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 12.sp),
            ),
          ),
        )
        .toList();
  }

  GestureDetector buildContentBody(
      BuildContext context, LoginCubit cubit, LoginState state) {
    return GestureDetector(
      onTap: () => _releaseFocus(context),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Center(
                    child:
                        SvgPicture.asset(ImageAssets.mainLogo, height: 27.h)),
                SizedBox(
                  height: 90.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text('Sign in ',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeightManager.bold,
                          fontFamily: FontConstants.fontFamily,
                          color: ColorManager.dark)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                LoginForm(cubit: context.read<LoginCubit>(), state: state),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();
}
