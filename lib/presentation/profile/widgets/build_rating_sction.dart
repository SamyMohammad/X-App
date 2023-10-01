import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildRatingSection extends StatelessWidget {
  BuildRatingSection({Key? key, required this.cubit}) : super(key: key);
  ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      // height: 70.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your rate',
            style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
          ),
          SizedBox(
            height: 17.h,
          ),
          Row(
            children: [
              Text(
                'On time:',
                style: getSemiBoldStyle(color: Colors.black, fontSize: 15.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              RatingBarIndicator(
                rating: getRateBar(cubit.onTime ?? 0)!,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 17,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              SvgPicture.asset(
                ImageAssets.dotIc,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "${cubit.onTime}%",
                style: getBoldStyle(
                    color: getColor(cubit.onTime ?? 0)!, fontSize: 16.sp),
              )
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          Row(
            children: [
              Text(
                'Job completed:',
                style: getSemiBoldStyle(color: Colors.black, fontSize: 15.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              RatingBarIndicator(
                rating: getRateBar(cubit.jobCompleted ?? 0)!,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 17,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              SvgPicture.asset(
                ImageAssets.dotIc,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "${cubit.jobCompleted}%",
                style: getBoldStyle(
                    color: getColor(cubit.jobCompleted ?? 0)!, fontSize: 16.sp),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Text(
                'Acceptance:',
                style: getSemiBoldStyle(color: Colors.black, fontSize: 15.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              RatingBarIndicator(
                rating: getRateBar(cubit.acceptance ?? 0)!,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 17,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              SvgPicture.asset(
                ImageAssets.dotIc,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "${cubit.acceptance}%",
                style: getBoldStyle(
                    color: getColor(cubit.acceptance ?? 0)!, fontSize: 16.sp),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Text(
                'Rejection: ',
                style: getSemiBoldStyle(color: Colors.black, fontSize: 15.sp),
              ),
              SizedBox(
                width: 5.w,
              ),
              RatingBarIndicator(
                rating: getRateBar(cubit.rejection ?? 0)!,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 17,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              SvgPicture.asset(
                ImageAssets.dotIc,
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "${cubit.rejection}%",
                style: getBoldStyle(
                    color: getColor(cubit.rejection ?? 0)!, fontSize: 16.sp),
              )
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            children: [
              Text(
                'Total income:',
                style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                '${cubit.rejection}\$',
                style:
                    getBoldStyle(color: ColorManager.primary, fontSize: 16.sp),
              )
            ],
          ),
        ],
      ),
    );
  }

  Color? getColor(num percentage) {
    if (percentage < 25) {
      return ColorManager.percentageColor5;
    } else if (percentage >= 25 && percentage < 45) {
      return ColorManager.percentageColor4;
    } else if (percentage >= 45 && percentage < 65) {
      return ColorManager.percentageColor3;
    } else if (percentage >= 65 && percentage < 85) {
      return ColorManager.percentageColor2;
    } else if (percentage >= 85) {
      return ColorManager.percentageColor1;
    }
    return null;
  }

  double? getRateBar(num percentage) {
    if (percentage < 25) {
      return 1;
    } else if (percentage >= 25 && percentage < 45) {
      return 2;
    } else if (percentage >= 45 && percentage < 65) {
      return 3;
    } else if (percentage >= 65 && percentage < 85) {
      return 4;
    } else if (percentage >= 85) {
      return 5;
    }
    return null;
  }
}
