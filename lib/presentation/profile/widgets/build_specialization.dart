import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/components/custom_drop_down_menu.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildSpecialization extends StatefulWidget {
  const BuildSpecialization({
    super.key,
    required this.cubit,
  });

  final ProfileCubit cubit;

  @override
  State<BuildSpecialization> createState() => _BuildSpecializationState();
}

class _BuildSpecializationState extends State<BuildSpecialization> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
                    'Specialization',
                    style: getBoldStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                  const Spacer(),
                  BuildSpecializationDialog(
                    cubit: widget.cubit,
                  )
                ],
              ),
              SizedBox(height: 8.h),
              if (widget.cubit.specialization == null)
                Text(
                  'Choose your job title ',
                  style: getRegularStyle(
                      color: ColorManager.jobTitle, fontSize: 12.sp),
                ),
              if (widget.cubit.specialization != null ||
                  state is UpdateEducationStateSuccessState)
                Text(
                  widget.cubit.specialization ?? '',
                  style: getRegularStyle(color: Colors.black, fontSize: 14.sp),
                ),
            ],
          ),
        );
      },
    );
  }
}

class BuildSpecializationDialog extends StatelessWidget {
  const BuildSpecializationDialog({Key? key, required this.cubit})
      : super(key: key);
  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                cubit.specializationInDropDown = cubit.specialization;
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
                                  Text('Specialization',
                                      style: getBoldStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp)),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        cubit.updateSpecialization(
                                            cubit.specializationInDropDown);
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        size: 25.sp,
                                      ))
                                ],
                              ),
                              Text(
                                'Choose your specialization',
                                style: getRegularStyle(
                                    color: Colors.black, fontSize: 14.sp),
                              ),
                              SizedBox(height: 20.h),
                              CustomDropDownMenu(
                                  hint: 'Specialization',
                                  items: const [
                                    'Marketing',
                                    'Developer',
                                  ],
                                  value: cubit.specializationInDropDown,
                                  onChanged: (value) {
                                    cubit.chooseSpecialization(value);
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
