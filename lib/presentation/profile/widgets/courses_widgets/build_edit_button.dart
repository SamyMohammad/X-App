import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/profile/widgets/courses_widgets/build_list_in_edit_dialog.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/routes_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildEditButton extends StatelessWidget {
  BuildEditButton({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);
  ProfileCubit cubit;
  ProfileState state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.sp)),
                        height: 170.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 5.h),
                        child: buildContentDialog(context, state),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        child: SvgPicture.asset(
          ImageAssets.editIc,
          height: 17.h,
        ));
  }

  CustomScrollView buildContentDialog(
      BuildContext context, ProfileState state) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 9.h,
              ),
              Row(
                children: [
                  Text(
                    'Courses & Certifications',
                    style: getBoldStyle(color: Colors.black, fontSize: 13.sp),
                  ),
                  const Spacer(),
                  buildCheckButton(context),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        if (cubit.coursesList.isNotEmpty)
          BuildListInEditDialog(
            cubit: cubit,
            state: state,
          )
      ],
    );
  }

  InkWell buildCheckButton(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.profileRoute);
        },
        child: Icon(
          Icons.check,
          size: 24.sp,
          color: ColorManager.jobTitle,
        ));
  }
}
