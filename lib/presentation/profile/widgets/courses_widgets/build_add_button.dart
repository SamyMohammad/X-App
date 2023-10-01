import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/profile/widgets/courses_widgets/build_add_and_edit_course_dialog.dart';
import 'package:x_app/presentation/resources/color_manager.dart';

class BuildAddButton extends StatefulWidget {
  const BuildAddButton({Key? key, required this.cubit, required this.state})
      : super(key: key);
  final ProfileCubit cubit;
  final ProfileState state;

  @override
  State<BuildAddButton> createState() => _BuildAddButtonState();
}

class _BuildAddButtonState extends State<BuildAddButton> {
  @override
  void initState() {
    widget.cubit.initAddCourseControllers();

    super.initState();
  }

  @override
  void dispose() {
    // widget.cubit.disposeAddCourseControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.cubit.courseController.text = '';
          widget.cubit.certificateController.text = '';
          showDialog(
              context: context,
              builder: (context) => BuildAddAndEditCourseDialog(
                    isEdit: false,
                    cubit: widget.cubit,
                  ));
        },
        child: Icon(
          Icons.add,
          size: 24.sp,
          color: ColorManager.jobTitle,
        ));
  }
}
