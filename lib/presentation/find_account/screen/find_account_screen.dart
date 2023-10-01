import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/components/default_button.dart';
import 'package:x_app/components/default_textfield.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/font_manager.dart';
import 'package:x_app/presentation/resources/routes_manager.dart';
import 'package:x_app/presentation/resources/strings_manager.dart';

class FindAccountScreen extends StatelessWidget {
  const FindAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
       body: buildBody()
      ),
    );
  }

  Widget buildBody() {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Container(
                child: Center(
                    child:
                        SvgPicture.asset(ImageAssets.mainLogo, height: 27.h)),
              ),
              SizedBox(
                height: 80.h,
              ),
              Text(AppStrings.findYourAccount,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                      color: ColorManager.dark)),
              SizedBox(
                height: 3.h,
              ),
              Text(AppStrings.enterYourMobileNumber,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeightManager.regular,
                      fontFamily: FontConstants.fontFamily,
                      color: ColorManager.dark)),
              SizedBox(
                height: 3.h,
              ),
              DefaultTextField(
                isHidden: false,
                hintText: AppStrings.mobileNumber,
              ),
              SizedBox( height:25.h),
              buildFindButton(context),
              SizedBox( height:30.h),


            ],
          ),
        ),
      );
    });
  }

  CustomButton buildFindButton(BuildContext context) {
    return CustomButton(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.otpRoute);

              },
              buttonText: AppStrings.findAccount,
              buttonColor: ColorManager.primary,
              textColor: Colors.white,
            );
  }

}
