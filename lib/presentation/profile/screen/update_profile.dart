import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/app/extensions.dart';
import 'package:x_app/app/functions.dart';
import 'package:x_app/components/custom_toast.dart';
import 'package:x_app/components/default_button.dart';
import 'package:x_app/components/default_textfield.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/routes_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key, required this.cubit}) : super(key: key);
  final ProfileCubit cubit;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  @override
  void initState() {
    super.initState();
    widget.cubit.initEditAccountControllers();
    fetchData();
  }

  void fetchData() async {
    await widget.cubit.getUserProfile();
    if (kDebugMode) {
      print(widget.cubit.middleNameController?.text);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ProfileCubit;
    // final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocProvider.value(
      value: widget.cubit,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            Navigator.of(context).pushReplacementNamed(
              Routes.mainRoute,
            );
            showCustomToast(
                message: state.message,
                color: ColorManager.primary,
                iconData: Icons.check,
                // addressErrorsList: [],
               );
            return;
          }
          if (state is ChangePasswordErrorState) {
            showCustomToast(
                message: state.message,
                passwordErrorsList: state.data,
                color: Colors.red,
                iconData: Icons.error_outline,
               );

            return;
          }
          if (state is ChangePasswordLoadingState) {
            buildShowLoadingDialog(context);
            // cubit.setErrorsToNull();
            return;
          }
          if (state is UpdateNameSuccessState) {
            Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
            showCustomToast(
                message: state.message,
                color: ColorManager.primary,
                iconData: Icons.check,
                // addressErrorsList: [],
               );
            return;
          }
          if (state is UpdateNameErrorState) {
            showCustomToast(
                message: state.message,
                passwordErrorsList: state.data,
                color: Colors.red,
                iconData: Icons.error_outline,
               );

            return;
          }
          if (state is UpdateNameLoadingState) {
            buildShowLoadingDialog(context);
            // cubit.setErrorsToNull();
            return;
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      SvgPicture.asset(ImageAssets.mainLogo),
                      SizedBox(
                        height: 35.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Change your name',
                            style: getBoldStyle(
                                color: Colors.black, fontSize: 24.sp),
                          )),
                      SizedBox(
                        height: 12.h,
                      ),
                      DefaultTextField(
                        isHidden: false,
                        hintText: 'First name',
                        controller: widget.cubit.firstNameController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      DefaultTextField(
                        isHidden: false,
                        hintText: 'Middle name',
                        controller: widget.cubit.middleNameController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      DefaultTextField(
                        isHidden: false,
                        hintText: 'Last name',
                        controller: widget.cubit.lastNameController,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomButton(
                        onTap: () {
                          widget.cubit.updateName();
                        },
                        buttonText: 'Change Name',
                        height: 45.h,
                        buttonColor: ColorManager.primary,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Change your password',
                            style: getBoldStyle(
                                color: Colors.black, fontSize: 24.sp),
                          )),
                      SizedBox(
                        height: 12.h,
                      ),
                      DefaultTextField(
                        isHidden: false,
                        hintText: 'Enter your last password',
                        controller: widget.cubit.lastPasswordController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      DefaultTextField(
                        isHidden: false,
                        hintText: 'Enter your new password',
                        controller: widget.cubit.newPasswordController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      DefaultTextField(
                        isHidden: false,
                        hintText: 'Confirm your new password',
                        controller: widget.cubit.lastPasswordController,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomButton(
                        onTap: () {
                          widget.cubit.changePassword();
                        },
                        buttonText: 'Change password',
                        height: 45.h,
                        buttonColor: ColorManager.primary,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
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
      List<String>? passwordErrorsList,
      List<String>? firstErrorsList,
      List<String>? secondErrorsList,
      List<String>? lastErrorsList,
      }) {
    Widget toast = CustomToast(
      iconData: Icons.error_outline,
      color: color,
      message: message,
      passwordErrors: buildErrors(passwordErrorsList),
      lastNameErrors: buildErrors(lastErrorsList),
      middleNameErrors: buildErrors(secondErrorsList),
      firstNameErrors: buildErrors(firstErrorsList),
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
}
