import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_app/components/default_button.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/presentation/job_details/bloc/job_details_cubit.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildDetailsContainer extends StatelessWidget {
  const BuildDetailsContainer({super.key, required this.jobData});

  final JobData jobData;

  @override
  Widget build(BuildContext context) {
    final cubit = JobDetailsCubit.get(context);
    DateTime date = DateTime.parse(jobData.deadline ?? '');
    DateTime now = DateTime.now();

    int days = date.difference(now).inDays;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              jobData.title ?? '',
              style: getBoldStyle(color: ColorManager.primary, fontSize: 20.sp),
            ),
            const Spacer(),
            Text(
              jobData.createdAt ?? '',
              style: getSemiBoldStyle(
                  color: ColorManager.jobTitle, fontSize: 14.sp),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          'Description:',
          style:
              getSemiBoldStyle(color: ColorManager.semiBlack, fontSize: 14.sp),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          jobData.description ?? '',
          // overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: getRegularStyle(
              // overflow: TextOverflow.ellipsis,
              color: ColorManager.jobTitle,
              fontSize: 14.sp),
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            Text(
              'Requirements:',
              style: getSemiBoldStyle(
                  color: ColorManager.semiBlack, fontSize: 14.sp),
            ),
            Text(
              ' ( ' ?? '',
              // overflow: TextOverflow.ellipsis,
              // softWrap: true,
              style: getRegularStyle(
                  // overflow: TextOverflow.ellipsis,
                  color: ColorManager.jobTitle,
                  fontSize: 10.sp),
            ),
            SizedBox(
              height: 25,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: jobData.experience?.length,
                itemBuilder: (BuildContext context, int index) {
                  final lastExperienceIndex =
                      jobData.experience?.length ?? 1 - 1;

                  return Row(
                    children: [
                      Text(
                        jobData.experience?[index] ?? '',
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
            Text(
              ' )' ?? '',
              // overflow: TextOverflow.ellipsis,
              // softWrap: true,
              style: getRegularStyle(
                  // overflow: TextOverflow.ellipsis,
                  color: ColorManager.jobTitle,
                  fontSize: 10.sp),
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        ...?jobData.requirments
            ?.map(
              (e) => Text(
                '. $e',
                // overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: getRegularStyle(
                    // overflow: TextOverflow.ellipsis,
                    color: ColorManager.jobTitle,
                    fontSize: 14.sp),
              ),
            )
            .toList(),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'Deadline:',
          style: getRegularStyle(color: Colors.black, fontSize: 15.sp),
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          children: [
            SvgPicture.asset(ImageAssets.clockIcon),
            SizedBox(
              width: 4.w,
            ),
            Text(
              days.toString() ?? '',
              // overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: getRegularStyle(
                  // overflow: TextOverflow.ellipsis,
                  color: ColorManager.jobTitle,
                  fontSize: 14.sp),
            )
          ],
        ),
        SizedBox(
          height: 17.h,
        ),
        Row(
          children: [
            Text(
              'Price : ',
              style: getSemiBoldStyle(
                  color: ColorManager.semiBlack, fontSize: 14.sp),
            ),
            Text(
              '${25}\$',
              style: getBoldStyle(color: ColorManager.primary, fontSize: 14.sp),
            ),
            const Spacer(),
            CustomButton(
              onTap: () async {
                await cubit.getHistoryJobs(jobId: jobData.id?.toInt());
              },
              buttonText: 'Apply',
              height: 28.h,
              width: 85.w,
              isMore: true,
              paddingVertical: 0,
              paddingHorizontal: 10.w,
              buttonColor: ColorManager.primary,
              borderRadius: 20.r,
              textColor: Colors.white,
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
