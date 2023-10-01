import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/components/default_button.dart';
import 'package:x_app/components/default_dropdown_formfield.dart';
import 'package:x_app/components/default_textfield.dart';
import 'package:x_app/data/remote/models/requests/user_info_rm.dart';
import 'package:x_app/presentation/registeration/bloc/registration_cubit.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/font_manager.dart';
import 'package:x_app/presentation/resources/strings_manager.dart';

class BuildBody extends StatefulWidget {
  const BuildBody({Key? key, required this.cubit}) : super(key: key);
  final RegistrationCubit cubit;

  @override
  State<BuildBody> createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  final _formKey = GlobalKey<FormState>();
  late bool passwordVisible;
  late bool passwordConfirmVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    passwordConfirmVisible = true;

    // Subscribe
    widget.cubit.init();
  }

  @override
  void dispose() {
    super.dispose();
    widget.cubit.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // reverse: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Center(child: SvgPicture.asset(ImageAssets.mainLogo, height: 27.h)),
            SizedBox(
              height: 70.h,
            ),
            Text(AppStrings.createYourAccount,
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeightManager.bold,
                    fontFamily: FontConstants.fontFamily,
                    color: ColorManager.dark)),
            SizedBox(
              height: 3.h,
            ),
            DefaultTextField(
              isHidden: false,
              hintText: AppStrings.firstName,
              maxLines: 1,
              controller: widget.cubit.firstNameController,
              labelText: AppStrings.firstName,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultTextField(
              isHidden: false,
              hintText: AppStrings.midName,
              maxLines: 1,
              controller: widget.cubit.middleNameController,
              labelText: AppStrings.midName,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultTextField(
              isHidden: false,
              hintText: AppStrings.lastName,
              maxLines: 1,
              controller: widget.cubit.lastNameController,
              labelText: AppStrings.lastName,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultTextField(
              isHidden: false,
              hintText: AppStrings.mobileNumber,
              maxLines: 1,
              controller: widget.cubit.phoneNumberController,
              textInputType: TextInputType.phone,
              labelText: AppStrings.mobileNumber,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultTextField(
              isHidden: false,
              hintText: AppStrings.email,
              maxLines: 1,
              controller: widget.cubit.emailController,
              textInputType: TextInputType.emailAddress,
              labelText: AppStrings.email,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultTextField(
              isHidden: false,
              hintText: AppStrings.yourID,
              maxLines: 1,
              controller: widget.cubit.nationalIdController,
              textInputType: TextInputType.number,
              labelText: AppStrings.yourID,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 3.h,
            ),
            DefaultTextField(
              isHidden: false,
              hintText: AppStrings.address,
              controller: widget.cubit.addressController,
              labelText: AppStrings.address,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 3.h,
            ),
            StatefulBuilder(builder: (context, StateSetter setState) {
              return CustomDropDownMenuFormField(
                hint: 'Specialization',
                items: const [
                  'Developer',
                  'Marketing',
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this Field can\'t be empty.';
                  }
                  return null;
                },
                // value: cubit.levelInDropDown,
                onChanged: (value) {
                  widget.cubit.specialization = value;
                  setState(() {
                    if (kDebugMode) {
                      print(widget.cubit.specialization);
                    }
                  });
                },
                value: widget.cubit.specialization,
              );
            }),
            SizedBox(
              height: 3.h,
            ),
            StatefulBuilder(builder: (context, StateSetter setState) {
              return DefaultTextField(
                maxLines: 1,
                hintText: AppStrings.password,
                controller: widget.cubit.passwordController,
                labelText: AppStrings.password,
                textInputAction: TextInputAction.next,
                isHidden: passwordVisible,
                suffix:
                    passwordVisible ? Icons.visibility_off : Icons.visibility,
                suffixPressed: () {
                  setState(() => passwordVisible = !passwordVisible);
                },
              );
            }),
            SizedBox(
              height: 3.h,
            ),
            StatefulBuilder(builder: (context, StateSetter setState) {
              return DefaultTextField(
                maxLines: 1,
                hintText: AppStrings.passwordConfirmation,
                controller: widget.cubit.passwordConfirmationController,
                labelText: AppStrings.passwordConfirmation,
                textInputAction: TextInputAction.done,
                isHidden: passwordConfirmVisible,
                suffix: passwordConfirmVisible
                    ? Icons.visibility_off
                    : Icons.visibility,
                suffixPressed: () {
                  setState(
                      () => passwordConfirmVisible = !passwordConfirmVisible);
                },
              );
            }),
            SizedBox(height: 25.h),
            CustomButton(
              onTap: onRegisterSubmit,
              buttonText: AppStrings.create,
              buttonColor: ColorManager.primary,
              textColor: Colors.white,
            ),
            SizedBox(height: 250.h),
          ],
        ),
      ),
    );
  }

  void onRegisterSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.cubit.onSubmit(UserInfoRM(
          role: 'client',
          email: widget.cubit.emailController.text,
          firstName: widget.cubit.firstNameController.text,
          middleName: widget.cubit.middleNameController.text,
          lastName: widget.cubit.lastNameController.text,
          nationalId: widget.cubit.nationalIdController.text,
          phoneNumber: widget.cubit.phoneNumberController.text,
          address: widget.cubit.addressController.text,
          passwordConfirmation:
              widget.cubit.passwordConfirmationController.text,
          password: widget.cubit.passwordController.text,
          specialization: widget.cubit.specialization ?? ''));
    }
  }
}
