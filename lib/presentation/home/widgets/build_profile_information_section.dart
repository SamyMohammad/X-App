import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:x_app/components/shimmer_widget.dart';
import 'package:x_app/presentation/home/bloc/home_cubit.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildProfileInformationSection extends StatelessWidget {
  const BuildProfileInformationSection({
    super.key,
    required this.state,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    var rate = cubit.compilationResponse?.data?.rate ?? 0;
    String percentage = '${(rate / 100).toStringAsFixed(2)}%';

    var percent = rate / 100;
    return cubit.userProfile?.data != null
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            // height: 90.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildProfilePicture(cubit),
                        Text(
                          cubit.userProfile?.data?.userData?.firstName ?? '',
                          style: getBoldStyle(
                              color: Colors.black, fontSize: 10.sp),
                        ),
                      ]),
                ),
                SizedBox(
                  width: 10.w,
                ),
                buildMiddleColumn(),
                SizedBox(
                  width: 5.w,
                ),
                buildCircularPercentIndicator(percent, percentage),
              ],
            ))
        : ShimmerWidget.rectangle(
            height: MediaQuery.of(context).size.height / 6);
  }

  Widget buildCircularPercentIndicator(double percent, String percentage) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 30.0.r,
            lineWidth: 8.0,
            percent: percent.toDouble(),
            center: Text(
              percentage,
              style: getSemiBoldStyle(
                  color: ColorManager.primary, fontSize: 12.sp),
            ),
            animateFromLastPercent: true,
            animationDuration: 1000,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: const Color(0xff909294),
            animation: true,
            progressColor: ColorManager.primary,
          ),
        ],
      ),
    );
  }

  Column buildMiddleColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Complete your profile  ',
          style: getBoldStyle(color: ColorManager.primary, fontSize: 15.sp),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          'To get a strong profile  ',
          style: getRegularStyle(color: Colors.black, fontSize: 13.sp),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          'That’s gives you well rank among \nothers profiles .',
          style: getRegularStyle(color: ColorManager.jobTitle, fontSize: 10.sp),
        ),
      ],
    );
  }

  CircleAvatar buildProfilePicture(HomeCubit cubit) {
    return CircleAvatar(
      radius: 30.r,
      backgroundColor: const Color(0xff909294),
      child: CircleAvatar(
          radius: 28.0.r,
          backgroundColor: ColorManager.primary,
          backgroundImage: cubit.userProfile?.data?.userData?.image != null
              ? NetworkImage(
                  cubit.userProfile?.data?.userData?.image ?? '',
                )
              : null,
          child:
              cubit.userProfile?.data?.userData?.image ==
                  null
              ? Image.asset(
                  ImageAssets.user,
                  height: 40.h,
                  width: 40.w,
                )
              : null),
    );
  }
}
