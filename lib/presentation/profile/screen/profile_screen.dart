import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/app/functions.dart';
import 'package:x_app/components/custom_toast.dart';
import 'package:x_app/data/local/data_sources/user_secure_storage.dart';
import 'package:x_app/presentation/main/bloc/main_cubit.dart';
import 'package:x_app/presentation/main/screen/main_screen.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/profile/screen/profile_body.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/routes_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  void logout() async {
    // Perform an async operation, such as calling an API
    // and waiting for a response
    await SecureStorage.delete();

    // Call the callback function with the message
    // onDelete(message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(instance())
        ..getCourses()
        ..getEducation()
        ..getPhoto()
        ..getSpecialization()
        ..getUserProfile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) async {
          if (state is AddCourseSuccessState) {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute (
              builder: (BuildContext context) => const MainScreen(),
            ),);
            MainCubit.get(context).bottomNavigationTo(1);

            showCustomToast(
                message: state.message,
                color: ColorManager.primary,
                iconData: Icons.check,
               );

            return;
          }
          if (state is AddCourseErrorState) {
            Navigator.pop(context);

            showCustomToast(
                message: state.message,
                color: Colors.red,
                iconData: Icons.error_outline,
               );

            return;
          }
          if (state is AddCourseLoadingState) {
            buildShowLoadingDialog(context);
            return;
          }

          if (state is UpdateSpecializationSuccessState) {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute (
              builder: (BuildContext context) => const MainScreen(),
            ),);
            MainCubit.get(context).bottomNavigationTo(1);

            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil(Routes.profileRoute, (route) => false);
            showCustomToast(
                message: state.message,
                color: ColorManager.primary,
                iconData: Icons.check,
               );

            return;
          }
          if (state is UpdateSpecializationErrorState) {
            Navigator.pop(context);

            showCustomToast(
                message: state.message,
                color: Colors.red,
                iconData: Icons.error_outline,
               );

            return;
          }
          if (state is UpdateSpecializationLoadingState) {
            buildShowLoadingDialog(context);
            return;
          }
          if (state is UpdateEducationStateSuccessState) {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute (
              builder: (BuildContext context) => const MainScreen(),
            ),);
            MainCubit.get(context).bottomNavigationTo(1);

            showCustomToast(
                message: state.message,
                color: ColorManager.primary,
                iconData: Icons.check,
               );

            return;
          }
          if (state is UpdateEducationStateErrorState) {
            Navigator.pop(context);

            showCustomToast(
                message: state.message,
                color: Colors.red,
                iconData: Icons.error_outline,
               );

            return;
          }
          if (state is UpdateEducationStateLoadingState) {
            buildShowLoadingDialog(context);
            return;
          }
          if (state is UpdateLevelSuccessState) {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute (
              builder: (BuildContext context) => const MainScreen(),
            ),);
            MainCubit.get(context).bottomNavigationTo(1);

            showCustomToast(
                message: state.message,
                color: ColorManager.primary,
                iconData: Icons.check,
               );

            return;
          }
          if (state is UpdateLevelErrorState) {
            Navigator.pop(context);

            showCustomToast(
                message: state.message,
                color: Colors.red,
                iconData: Icons.error_outline,
               );

            return;
          }
          if (state is UpdateLevelLoadingState) {
            buildShowLoadingDialog(context);
            return;
          }

          if (state is AddEducationSuccessState) {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute (
              builder: (BuildContext context) => const MainScreen(),
            ),);
            MainCubit.get(context).bottomNavigationTo(1);

          }
          if (state is LogOutSuccessState) {
            logout();
            Navigator.of(context)
                .pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
          }

          if (state is AddEducationLoadingState) {
            buildShowLoadingDialog(context);
            // cubit.setErrorsToNull();
            return;
          }
          if (state is UpdateCourseSuccessState) {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute (
              builder: (BuildContext context) => const MainScreen(),
            ),);
            MainCubit.get(context).bottomNavigationTo(1);

            showCustomToast(
                message: state.message,
                color: ColorManager.primary,
                iconData: Icons.check,
               );

            return;
          }
          if (state is UpdateCourseErrorState) {
            Navigator.pop(context);

            showCustomToast(
                message: state.message,
                color: Colors.red,
                iconData: Icons.error_outline,
               );

            return;
          }
        },
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();

          return SafeArea(
            child: Scaffold(
              extendBody: true,
              backgroundColor: const Color(0xffeef1ff),
              body: ProfileContentBody(cubit: cubit, state: state),
            ),
          );
        },
      ),
    );
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

  showCustomToast(
      {Color? color,
      String? message,
      IconData? iconData,
      List<String>? passwordErrorsList,
     }) {
    Widget toast = CustomToast(
      iconData: Icons.error_outline,
      color: color,
      message: message,
      passwordErrors: buildErrors(passwordErrorsList),
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
