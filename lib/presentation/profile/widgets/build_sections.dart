import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/profile/widgets/build_educational_State.dart';
import 'package:x_app/presentation/profile/widgets/build_level.dart';
import 'package:x_app/presentation/profile/widgets/build_rating_sction.dart';
import 'package:x_app/presentation/profile/widgets/build_specialization.dart';
import 'package:x_app/presentation/profile/widgets/courses_widgets/build_courses.dart';
import 'package:x_app/presentation/profile/widgets/education_widgets/build_education.dart';

class BuildSections extends StatefulWidget {
  BuildSections({super.key, required this.cubit, required this.state});

  ProfileCubit cubit;
  ProfileState state;

  @override
  State<BuildSections> createState() => _BuildSectionsState();
}

class _BuildSectionsState extends State<BuildSections> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          BuildEducation(cubit: widget.cubit, state: widget.state),
          SizedBox(height: 30.h),
          BuildCourses(cubit: widget.cubit, state: widget.state),
          SizedBox(height: 30.h),
          BuildSpecialization(cubit: widget.cubit),
          SizedBox(height: 30.h),
          BuildLevel(cubit: widget.cubit),
          SizedBox(height: 30.h),
          BuildEducationalState(cubit: widget.cubit),
          SizedBox(height: 30.h),
          BuildRatingSection(
            cubit: widget.cubit,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
