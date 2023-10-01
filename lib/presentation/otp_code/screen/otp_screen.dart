import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/font_manager.dart';
import 'package:x_app/presentation/resources/strings_manager.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Builder(builder: (context) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                  child: Text('Logo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp,
                          fontFamily: FontConstants.fontFamily,
                          color: ColorManager.primary))),
              SizedBox(
                height: 70.h,
              ),
              Text(AppStrings.enterVerificationCode,
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.fontFamily,
                      color: ColorManager.dark)),
              SizedBox(
                height: 40.h,
              ),
              Container(
                child: PinCodeTextField(
                  autoFocus: true,
                  // cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    borderWidth: 1,
                    // activeFillColor: MyColors.lightGrey,
                    // inactiveColor: MyColors.blue,
                    // inactiveFillColor: Colors.white,
                    // activeColor: MyColors.blue,
                    // selectedColor: MyColors.blue,
                    selectedFillColor: Colors.transparent,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  // enableActiveFill: true,
                  onCompleted: (submittedCode) {
                    // otpCode = submittedCode;
                    // print("otpCode" + otpCode);
                  },
                  onChanged: (value) {
                    // this.otpCode = value;
                    // otpCode code;
                    print(value);
                  },
                  appContext: context,
                ),
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      );
    });
  }
}
