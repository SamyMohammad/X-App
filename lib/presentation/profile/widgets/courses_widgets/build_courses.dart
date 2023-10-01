import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/profile/widgets/courses_widgets/build_add_button.dart';
import 'package:x_app/presentation/profile/widgets/courses_widgets/build_courses_list.dart';
import 'package:x_app/presentation/profile/widgets/courses_widgets/build_edit_button.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildCourses extends StatefulWidget {
  BuildCourses({super.key, required this.cubit, required this.state});

  final ProfileCubit cubit;
  ProfileState state;

  @override
  State<BuildCourses> createState() => _BuildCoursesState();
}

class _BuildCoursesState extends State<BuildCourses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Courses & Certifications',
                style: getBoldStyle(color: Colors.black, fontSize: 15.sp),
              ),
              const Spacer(),
              BuildAddButton(state: widget.state, cubit: widget.cubit),
              if (widget.cubit.coursesList.isNotEmpty)
                Row(
                  children: [
                    SizedBox(
                      width: 15.w,
                    ),
                    BuildEditButton(
                      cubit: widget.cubit,
                      state: widget.state,
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(height: 3.h),
          if (widget.cubit.coursesList.isEmpty)
            Text(
              'Enter your courses & prove that by its certifications ',
              overflow: TextOverflow.ellipsis,
              style: getRegularStyle(
                  color: ColorManager.jobTitle, fontSize: 12.sp),
            ),
          if (widget.cubit.coursesList.isNotEmpty)
            BuildCoursesList(
              cubit: widget.cubit,
              state: widget.state,
            ),
        ],
      ),
    );
  }
}
