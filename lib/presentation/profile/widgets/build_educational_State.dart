import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/components/custom_drop_down_menu.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildEducationalState extends StatelessWidget {
  const BuildEducationalState({
    super.key,
    required this.cubit,
  });

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      height: 80.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Educational State ',
                style: getBoldStyle(color: Colors.black, fontSize: 15.sp),
              ),
              const Spacer(),
              BuildEducationStateDialog(
                cubit: cubit,
              )
            ],
          ),
          SizedBox(height: 8.h),
          if (cubit.educationStatus == null)
            Text(
              'Choose your state ',
              style: getRegularStyle(
                  color: ColorManager.jobTitle, fontSize: 12.sp),
            ),
          if (cubit.educationStatus != null)
            Text(
              cubit.educationStatus ?? '',
              style: getRegularStyle(color: Colors.black, fontSize: 14.sp),
            ),
        ],
      ),
    );
  }
}

class BuildEducationStateDialog extends StatelessWidget {
  const BuildEducationStateDialog({Key? key, required this.cubit})
      : super(key: key);
  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                cubit.educationStatusInDropDown = cubit.educationStatus;
                return BlocProvider.value(
                  value: cubit,
                  child: BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.sp))),
                        child: Container(
                          height: 160.h,
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Educational State ',
                                      style: getBoldStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        cubit.updateEducationState(
                                            cubit.educationStatusInDropDown);
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        size: 25.sp,
                                      ))
                                ],
                              ),
                              Text(
                                'Choose your Educational State ',
                                style: getRegularStyle(
                                    color: Colors.black, fontSize: 14.sp),
                              ),
                              SizedBox(height: 20.h),
                              CustomDropDownMenu(
                                  hint: 'State',
                                  items: const [
                                    'graduate',
                                    'undergraduate',
                                  ],
                                  value: cubit.educationStatusInDropDown,
                                  onChanged: (value) {
                                    cubit.chooseEducationState(value);
                                  }),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          size: 24.sp,
          color: ColorManager.jobTitle,
        ));
  }
}
