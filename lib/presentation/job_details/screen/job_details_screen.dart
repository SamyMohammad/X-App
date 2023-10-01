import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/app/extensions.dart';
import 'package:x_app/app/functions.dart';
import 'package:x_app/components/custom_toast.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/presentation/job_details/bloc/job_details_cubit.dart';
import 'package:x_app/presentation/job_details/widgets/content_body.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final job = ModalRoute.of(context)!.settings.arguments as JobData?;

    return BlocProvider(
      create: (context) => instance<JobDetailsCubit>(),
      child: BlocConsumer<JobDetailsCubit, JobDetailsState>(
        listener: (context, state) {
          if (state is ApplyJobSuccessState) {
            Navigator.pop(context);
            // Navigator.of(context).pushNamedAndRemoveUntil(Routes.profileRoute, (route) => false);

            showCustomToast(
                message: state.genericResponseModel?.message ?? '',
                color: ColorManager.primary,
                iconData: Icons.check,
                );

            return;
          }
          if (state is ApplyJobFailureState) {
            Navigator.pop(context);

            showCustomToast(
                message: state.message,
                color: Colors.red,
                iconData: Icons.error_outline,
                );

            return;
          }
          if (state is ApplyJobLoadingState) {
            buildShowLoadingDialog(context);
            return;
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 70.h,
                centerTitle: false,
                title: SvgPicture.asset(ImageAssets.appBArLogo, height: 25.h),
              ),
              body: ContentBody(
                jobData: job ?? JobData(),
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
      List<String>? passwordErrorsList,}) {
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
