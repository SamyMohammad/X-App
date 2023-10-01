import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/profile/widgets/education_widgets/build_edit_or_add_education.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class BuildEducation extends StatelessWidget {
  const BuildEducation({super.key, required this.cubit, required this.state});

  final ProfileCubit cubit;
  final ProfileState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Education',
                style: getBoldStyle(color: Colors.black, fontSize: 15.sp),
              ),
              const Spacer(),
              if (cubit.faculty == null && cubit.university == null)
                BuildEditOrAddEducation(
                  buttonText: 'Add',
                  isEdit: false,
                  cubit: cubit,
                ),
              if (cubit.faculty != null && cubit.university != null)
                BuildEditOrAddEducation(
                  buttonText: 'Save',
                  isEdit: true,
                  cubit: cubit,
                ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          if (cubit.university != null && cubit.faculty != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Studied at ',
                      style:
                          getLightStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    Flexible(
                      child: Text(
                        'Faculty of ${cubit.faculty}' ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: getMediumStyle(
                            color: Colors.black, fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                const Divider(
                  color: Color(0xffEFF1F5),
                  thickness: 1,
                ),
                SizedBox(height: 2.h),
                Text(
                  '${cubit.university} university' ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: getMediumStyle(color: Colors.black, fontSize: 14.sp),
                ),
              ],
            ),
          if (cubit.university == null && cubit.faculty == null)
            Text(
              'Enter your academic education  ',
              style: getRegularStyle(
                  color: ColorManager.jobTitle, fontSize: 12.sp),
            ),
        ],
      ),
    );
  }
}
