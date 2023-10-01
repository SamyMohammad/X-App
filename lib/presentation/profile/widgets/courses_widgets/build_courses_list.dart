import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/app/functions.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildCoursesList extends StatelessWidget {
  BuildCoursesList({Key? key, required this.cubit, required this.state})
      : super(key: key);
  ProfileCubit cubit;
  ProfileState state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cubit.coursesList[index].courseName ?? '',
              style: getMediumStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.fade,
                    getWebsiteName(cubit.coursesList[index].certificateLink!)!,
                    style: getRegularStyle(
                            color: ColorManager.jobTitle, fontSize: 14.sp)
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color(0xffEFF1F5),
          thickness: 1,
        );
      },
      itemCount: cubit.coursesList.length,
    );
  }
}
