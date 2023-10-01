import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/app/extensions.dart';
import 'package:x_app/app/functions.dart';
import 'package:x_app/components/custom_toast.dart';
import 'package:x_app/presentation/common/state_renderer/state_renderer.dart';
import 'package:x_app/presentation/registeration/bloc/registration_cubit.dart';
import 'package:x_app/presentation/registeration/widgets/register_screen_content.dart';
import 'package:x_app/presentation/resources/color_manager.dart';

class Registration1Screen extends StatefulWidget {
  const Registration1Screen({Key? key, required this.onSignUpSuccess})
      : super(key: key);
  final VoidCallback onSignUpSuccess;
  @override
  State<Registration1Screen> createState() => _Registration1ScreenState();
}

class _Registration1ScreenState extends State<Registration1Screen> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  // void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(instance()),
      child: BlocConsumer<RegistrationCubit, RegistrationState>(
        listenWhen: (oldState, newState) =>
            oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state) {
          if (state.submissionStatus == SubmissionStatus.popupSuccess) {
            showCustomToast(
                message: state.message,
                color: ColorManager.primary,
                iconData: Icons.check,
                );
            widget.onSignUpSuccess();
            return;
          }
          if (state.submissionStatus == SubmissionStatus.popupErrorState) {
            Navigator.pop(context);

            showCustomToast(
                message: state.message,
                color: Colors.red,
                iconData: Icons.error_outline,
                passwordErrorsList: state.passwordErrors,
                phoneNumberErrorsList: state.phoneNumberErrors,
                addressErrorsList: state.addressErrors,
                emailErrorsList: state.emailErrors,
                nationalIdErrorsList: state.nationalIdErrors,
                );

            return;
          }
          if (state.submissionStatus == SubmissionStatus.popupLoadingState) {
            buildShowLoadingDialog(context);
            Future.delayed(const Duration(seconds: 2));
            final cubit = context.read<RegistrationCubit>();
            cubit.setErrorsToNull();
            return;
          }
        },
        builder: (context, state) {
          final cubit = context.read<RegistrationCubit>();
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: GestureDetector(
              onTap: () => _releaseFocus,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: BuildBody(cubit: cubit),
              ),
            ),
          );
        },
      ),
    );
  }

  showCustomToast(
      {Color? color,
      String? message,
      IconData? iconData,
      List<String>? phoneNumberErrorsList,
      List<String>? passwordErrorsList,
      List<String>? passwordConfirmationErrorsList,
      List<String>? addressErrorsList,
      List<String>? emailErrorsList,
      List<String>? nationalIdErrorsList,
     }) {
    Widget toast = CustomToast(
      iconData: Icons.error_outline,
      color: color,
      message: message,
      passwordErrors: buildErrors(passwordErrorsList),
      phoneNumberErrors: buildErrors(phoneNumberErrorsList),
      addressErrors: buildErrors(addressErrorsList),
      emailErrors: buildErrors(emailErrorsList),
      nationalIdErrors: buildErrors(nationalIdErrorsList),
      passwordConfirmationErrors: buildErrors(passwordConfirmationErrorsList),
    );

    FocusManager.instance.primaryFocus?.unfocus();

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
  }

  void _releaseFocus(BuildContext context) => FocusScope.of(context).unfocus();
}
