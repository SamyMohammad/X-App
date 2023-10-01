// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:x_app/app/components/custom_drop_down_menu.dart';
// import 'package:x_app/app/components/default_button.dart';
// import 'package:x_app/app/components/default_textfield.dart';
// import 'package:x_app/presentation/resources/color_manager.dart';
// import 'package:x_app/presentation/resources/font_manager.dart';
// import 'package:x_app/presentation/resources/routes_manager.dart';
// import 'package:x_app/presentation/resources/strings_manager.dart';
//
// class Registration2Screen extends StatelessWidget {
//   const Registration2Screen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: buildBody(),
//       ),
//     );
//   }
//   Widget buildBody() {
//     return Builder(builder: (context) {
//       return SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 40.0.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 30.h,
//               ),
//               Center(
//                   child: Text('Logo',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 32.sp,
//                           fontFamily: FontConstants.fontFamily,
//                           color: ColorManager.primary))),
//               SizedBox(
//                 height: 70.h,
//               ),
//               Text(AppStrings.createYourAccount,
//                   style: TextStyle(
//                       fontSize: 22.sp,
//                       fontWeight: FontWeightManager.bold,
//                       fontFamily: FontConstants.fontFamily,
//                       color: ColorManager.dark)),
//
//               SizedBox(
//                 height: 3.h,
//               ),
//               DefaultTextField(
//                 isHidden: false,
//                 hintText: AppStrings.yearOfBirth,
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//               DefaultTextField(
//                 isHidden: false,
//                 hintText: AppStrings.address,
//               ),
//               SizedBox(
//                 height: 6.h,
//               ),
//               const CustomDropDownMenu(items: [], value: null,hint: AppStrings.government,
//
//               ),
//               SizedBox(
//                 height: 13.h,
//               ),
//               const CustomDropDownMenu(items: [], value: null,hint: AppStrings.area,
//
//               ),
//               SizedBox(
//                 height: 13.h,
//               ),
//               const CustomDropDownMenu(items: [], value: null,hint: AppStrings.gender,
//
//               ),
//
//               SizedBox(height: 25.h),
//               CustomButton(
//                 onTap: () {},
//                 buttonText: AppStrings.create,
//                 buttonColor: ColorManager.primary,
//                 textColor: Colors.white,
//               ),
//               SizedBox(height: 30.h),
//             ],
//           ),
//         ),
//       );
//     });
//   }
//
// }
