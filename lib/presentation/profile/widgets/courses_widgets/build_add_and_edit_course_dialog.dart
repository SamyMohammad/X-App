import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/components/default_button.dart';
import 'package:x_app/components/default_textfield.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/resources/color_manager.dart';

class BuildAddAndEditCourseDialog extends StatelessWidget {
  const BuildAddAndEditCourseDialog(
      {Key? key, required this.isEdit, required this.cubit, this.index})
      : super(key: key);
  final bool isEdit;
  final ProfileCubit cubit;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.sp))),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp)),
        height: 170.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextField(
              verticalContentPadding: 8.h,
              isHidden: false,
              hintText: 'Add course name',
              verticalPadding: 5.h,
              controller: cubit.courseController,
            ),
            DefaultTextField(
              verticalContentPadding: 8.h,
              isHidden: false,
              hintText: 'Add certificate’s link',
              verticalPadding: 5.h,
              controller: cubit.certificateController,
              maxLines: 1,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  onTap: () {
                    if (isEdit) {
                      cubit.updateCourse(
                          courseId: cubit.coursesList[index!].id,
                          certificateLink: cubit.certificateController.text,
                          courseName: cubit.courseController.text);
                    } else {
                      cubit.addCourse();
                    }
                    // cubit.getCourses();
                  },
                  buttonText: isEdit ? 'save' : 'Add',
                  width: 80.w,
                  height: 32.h,
                  borderRadius: 25.sp,
                  buttonColor: ColorManager.primary,
                  paddingHorizontal: 0,
                  paddingVertical: 0,
                  isDialog: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
