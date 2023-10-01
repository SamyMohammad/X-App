import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/components/default_button.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/presentation/home/bloc/home_cubit.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/routes_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class JobItem extends StatelessWidget {
  JobItem(
      {Key? key, required this.index, required this.state, required this.job})
      : super(key: key);
  final int index;
  HomeState state;
  final JobData job;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
          // height: MediaQuery.of(context).size.height /8,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.deepOrange,
                  child: LeftColumnInJobContainer(
                    index: index,
                    job: job,
                  ),
                ),
              ),
              Container(
                // color: Colors.blue,
                child: RightColumnInJobContainer(
                  index: index,
                  job: job,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 31.h,
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
    required this.job,
  });

  final int index;
  final JobData job;

  @override
  Widget build(BuildContext context) {
    // var job = HomeCubit.get(context).data?.data?[index] ?? JobData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              job.title ?? '',
              style: getBoldStyle(color: ColorManager.primary, fontSize: 20.sp),
            ),
            Text(
              ' (' ?? '',
              // overflow: TextOverflow.ellipsis,
              // softWrap: true,
              style: getRegularStyle(
                  // overflow: TextOverflow.ellipsis,
                  color: ColorManager.jobTitle,
                  fontSize: 10.sp),
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                height: 25,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: job.experience?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final lastExperienceIndex = job.experience?.length ?? 1 - 1;

                    return Row(
                      children: [
                        Text(
                          job.experience?[index] ?? '',
                          overflow: TextOverflow.ellipsis,
                          // softWrap: true,
                          style: getRegularStyle(
                              // overflow: TextOverflow.ellipsis,
                              color: ColorManager.jobTitle,
                              fontSize: 10.sp),
                        ),
                        if (index != lastExperienceIndex - 1)
                          Text(
                            '/',
                            // overflow: TextOverflow.ellipsis,
                            // softWrap: true,
                            style: getRegularStyle(
                                // overflow: TextOverflow.ellipsis,
                                color: ColorManager.jobTitle,
                                fontSize: 10.sp),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                ')' ?? '',
                // overflow: TextOverflow.ellipsis,
                // softWrap: true,
                style: getRegularStyle(
                    // overflow: TextOverflow.ellipsis,
                    color: ColorManager.jobTitle,
                    fontSize: 10.sp),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Requirements : ',
              style: getSemiBoldStyle(
                  color: ColorManager.semiBlack, fontSize: 14.sp),
            ),
            Expanded(
              child: Text(
                job.requirments?[0] ?? '',
                overflow: TextOverflow.ellipsis,
                // softWrap: true,
                style: getRegularStyle(
                    // overflow: TextOverflow.ellipsis,
                    color: ColorManager.jobTitle,
                    fontSize: 14.sp),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Price : ',
              style: getSemiBoldStyle(
                  color: ColorManager.semiBlack, fontSize: 14.sp),
            ),
            Text(
              '${job.price ?? 0}',
              style: getBoldStyle(color: ColorManager.primary, fontSize: 14.sp),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        )
      ],
    );
  }
}

class RightColumnInJobContainer extends StatelessWidget {
  const RightColumnInJobContainer({
    super.key,
    required this.index,
    required this.job,
  });

  final int index;
  final JobData job;

  @override
  Widget build(BuildContext context) {
    // var job = HomeCubit.get(context).data?.data?[index] ?? JobData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            job.createdAt ?? '',
            style:
                getSemiBoldStyle(color: ColorManager.jobTitle, fontSize: 11.sp),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomButton(
          onTap: () {
            Navigator.pushNamed(context, Routes.jobDetailsRoute,
                arguments: job);
          },
          buttonText: 'More',
          height: 28.h,
          width: 75.w,
          isMore: true,
          paddingVertical: 0,
          paddingHorizontal: 10.w,
          buttonColor: ColorManager.primary,
          borderRadius: 20.r,
          textColor: Colors.white,
        )
      ],
    );
  }
}
