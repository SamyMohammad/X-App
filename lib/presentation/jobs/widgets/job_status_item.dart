import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_app/app/extensions.dart';
import 'package:x_app/presentation/jobs/bloc/jobs_cubit.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

import '../../resources/routes_manager.dart';

class JobStatusItem extends StatelessWidget {
  JobStatusItem({Key? key, required this.index, required this.state})
      : super(key: key);
  final int index;
  JobsState state;

  @override
  Widget build(BuildContext context) {
    var job = JobsCubit.get(context).getJobsStatus;


    return Column(
      children: [
        InkWell(
          splashColor: ColorManager.dark,
          borderRadius:  BorderRadius.circular(20.r),
          onTap: () {
            Navigator.pushNamed(
                context, Routes.jobDetailsStatusRoute,
                arguments: job?.data?[index]);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
            // height: MediaQuery.of(context).size.height /8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
            child: LeftColumnInJobContainer(index: index),
          ),
        ),
        SizedBox(
          height: 19.h,
        )
      ],
    );

    return Container();
    //
    // : const ShimmerWidget.rectangle(height: 120);
  }
}

class LeftColumnInJobContainer extends StatelessWidget {
  const LeftColumnInJobContainer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    var job = JobsCubit.get(context).getJobsStatus;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              job?.data?[index].title ?? '',
              style: getBoldStyle(color: ColorManager.primary, fontSize: 20.sp),
            ),
            const Spacer(),
            Text(
              job?.data?[index].createdAt ?? '',
              style: getSemiBoldStyle(
                  color: ColorManager.jobTitle, fontSize: 11.sp),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Text(
              'Requirements : ',
              style: getSemiBoldStyle(
                  color: ColorManager.semiBlack, fontSize: 14.sp),
            ),
            Expanded(
              child: Text(
                job?.data?[index].requirments?[0] ?? '',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: getRegularStyle(
                    overflow: TextOverflow.ellipsis,
                    color: ColorManager.jobTitle,
                    fontSize: 14.sp),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Text(
              'Was submitted: ' ?? '',
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: getRegularStyle(
                  overflow: TextOverflow.ellipsis,
                  color: ColorManager.jobTitle,
                  fontSize: 12.sp),
            ),
            SvgPicture.asset(ImageAssets.clockIcon),
            Text(
              ' 4 days' ?? '',
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: getRegularStyle(
                  overflow: TextOverflow.ellipsis,
                  color: ColorManager.jobTitle,
                  fontSize: 12.sp),
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          children: [
            Text(
              'Price : ',
              style: getSemiBoldStyle(
                  color: ColorManager.semiBlack, fontSize: 14.sp),
            ),
            Text(
              '10\$',
              style: getBoldStyle(color: ColorManager.primary, fontSize: 14.sp),
            ),
            const Spacer(),
            Text(
              job?.data?[index].userJobDetails?.status ?? '',
              style: getBoldStyle(
                  color: job?.data?[index].userJobDetails?.status?.color ??
                      Colors.black,
                  fontSize: 13.sp),
            )
            // CustomButton(
            //   onTap: () {},
            //   buttonText: 'refused',
            //   height: 24.h,
            //   width: 75.w,
            //   isMore: true,
            //   paddingVertical: 0,
            //   paddingHorizontal: 10.w,
            //   buttonColor: 'pending'.color,
            //   borderRadius: 20.r,
            //   textColor: Colors.white,
            // )
          ],
        )
      ],
    );
  }
}

// class RightColumnInJobContainer extends StatelessWidget {
//   const RightColumnInJobContainer({
//     super.key,
//     required this.index
//   });
//   final int index;
//   @override
//   Widget build(BuildContext context) {
//     // var job = HomeCubit.get(context).data?.data?[index] ?? JobData();
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//
//       children: [
//         Padding(
//           padding:  EdgeInsets.only(left: 5.w),
//           child: Text(
//             'job.createdAt' ?? '',
//             style:
//                 getSemiBoldStyle(color: ColorManager.jobTitle, fontSize: 11.sp),
//           ),
//         ),
//         SizedBox(height: 10.h,),
//         CustomButton(
//           onTap: () {},
//           buttonText: 'More',
//           height: 28.h,
//           width: 75.w,
//           isMore: true,
//           paddingVertical: 0,
//           paddingHorizontal: 10.w,
//           buttonColor: ColorManager.primary,
//           borderRadius: 20.r,
//           textColor: Colors.white,
//         )
//       ],
//     );
//   }
// }
