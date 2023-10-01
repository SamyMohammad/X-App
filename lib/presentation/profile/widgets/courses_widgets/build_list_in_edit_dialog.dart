import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/app/functions.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/profile/widgets/courses_widgets/build_add_and_edit_course_dialog.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildListInEditDialog extends StatefulWidget {
  BuildListInEditDialog({Key? key, required this.cubit, required this.state})
      : super(key: key);
  ProfileCubit cubit;
  ProfileState state;

  @override
  State<BuildListInEditDialog> createState() => _BuildListInEditDialogState();
}

class _BuildListInEditDialogState extends State<BuildListInEditDialog> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              widget.cubit.courseController.text =
                  widget.cubit.coursesList[index].courseName ?? '';
              widget.cubit.certificateController.text =
                  widget.cubit.coursesList[index].certificateLink ?? '';

              showDialog(
                  context: context,
                  builder: (context) => BuildAddAndEditCourseDialog(
                        index: index,
                        isEdit: true,
                        cubit: widget.cubit,
                      ));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cubit.coursesList[index].courseName ?? '',
                  style: getRegularStyle(color: Colors.black, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        getWebsiteName(widget
                                    .cubit.coursesList[index].certificateLink ??
                                '') ??
                            '',
                        style: getRegularStyle(
                            color: ColorManager.jobTitle, fontSize: 14.sp),
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Delete',
                        style: getRegularStyle(
                            color: ColorManager.jobTitle, fontSize: 14.sp),
                      ),
                      onTap: () {
                        if (kDebugMode) {
                          print(widget.cubit.coursesList[index].id);
                        }
                        widget.cubit.deleteCourse(
                            courseId: widget.cubit.coursesList[index].id ?? 0,
                            index: index);

                        // coursesList.removeAt(index);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                const Divider(
                  color: Color(0xffEFF1F5),
                  thickness: 1,
                )
              ],
            ),
          );
        },
        childCount: widget.cubit.coursesList.length,
      ),
    );
  }
}
