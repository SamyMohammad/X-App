import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/components/custom_drop_down_menu.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildEditOrAddEducation extends StatefulWidget {
  const BuildEditOrAddEducation(
      {Key? key,
      required this.buttonText,
      required this.cubit,
      required this.isEdit})
      : super(key: key);
  final String buttonText;
  final ProfileCubit cubit;
  final bool isEdit;

  @override
  State<BuildEditOrAddEducation> createState() =>
      _BuildEditOrAddEducationState();
}

class _BuildEditOrAddEducationState extends State<BuildEditOrAddEducation> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.cubit.facultyInDropDown = widget.cubit.faculty;
          widget.cubit.universityInDropDown = widget.cubit.university;

          showDialog(
              context: context,
              builder: (context) => BlocProvider.value(
                    value: widget.cubit,
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.sp))),
                          child: Container(
                            height: 210.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 20.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Education',
                                        style: getBoldStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp)),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          widget.cubit.addEducation();
                                        },
                                        icon: Icon(
                                          Icons.check,
                                          size: 25.sp,
                                        ))
                                  ],
                                ),
                                Text(
                                  'Choose your education info',
                                  style: getRegularStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                                SizedBox(height: 20.h),
                                CustomDropDownMenu(
                                    items: const [
                                      'Computer Science',
                                      'Engineering',
                                      'Commerce'
                                    ],
                                    hint: 'Faculty',
                                    value: widget.cubit.facultyInDropDown,
                                    onChanged: (value) {
                                      widget.cubit.chooseFaculty(value);
                                    }),
                                SizedBox(height: 20.h),
                                CustomDropDownMenu(
                                    items: const [
                                      'Alexandria',
                                      'Cairo',
                                      'Tanta'
                                    ],
                                    value: widget.cubit.universityInDropDown,
                                    hint: 'University',
                                    onChanged: (value) {
                                      widget.cubit.chooseUniversity(value);
                                    }),
                              ],
                            ),
                          ),

                          // Container(
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(15.sp)),
                          //   height: 170.h,
                          //   padding:
                          //       EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       DefaultTextField(
                          //         verticalPadding: 5.h,
                          //         verticalContentPadding: 8.h,
                          //         isHidden: false,
                          //         hintText: 'Add your faculty',
                          //         controller: cubit.facultyController,
                          //       ),
                          //       DefaultTextField(
                          //         verticalPadding: 5.h,
                          //         verticalContentPadding: 8.h,
                          //         isHidden: false,
                          //         hintText: 'Add your university',
                          //
                          //         controller: cubit.universityController,
                          //       ),
                          //       SizedBox(
                          //         height: 5.h,
                          //       ),
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.end,
                          //         children: [
                          //           CustomButton(
                          //             onTap: () {
                          //               cubit.addEducation();
                          //             },
                          //             buttonText: buttonText,
                          //             width: 80.w,
                          //             height: 32.h,
                          //             borderRadius: 25.sp,
                          //             buttonColor: ColorManager.primary,
                          //             paddingHorizontal: 0,
                          //             paddingVertical: 0,
                          //             isDialog: true,
                          //           ),
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                        );
                      },
                    ),
                  ));
        },
        child: widget.isEdit
            ? SvgPicture.asset(
                ImageAssets.editIc,
                height: 17.h,
              )
            : Icon(
                Icons.add,
                size: 24.sp,
                color: ColorManager.jobTitle,
              ));
  }
}
