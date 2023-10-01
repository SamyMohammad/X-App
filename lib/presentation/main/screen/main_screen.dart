import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/presentation/main/bloc/main_cubit.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<MainCubit>();

        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              elevation: 1,
                currentIndex: cubit.currentIndex,
                onTap: context.read<MainCubit>().bottomNavigationTo,
                backgroundColor: Colors.orange,
                iconSize: 26,
                selectedItemColor: ColorManager.primary,
                unselectedItemColor: ColorManager.jobTitle,
                selectedFontSize: 11.sp,
                unselectedFontSize: 11.sp,
                showUnselectedLabels: true,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        ImageAssets.homeIc,
                        color: cubit.currentIndex == 0
                            ? ColorManager.primary
                            : null,
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(ImageAssets.profileIc,
                          color: cubit.currentIndex == 1
                              ? ColorManager.primary
                              : null),
                      label: "Profile"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(ImageAssets.jobsIcon,
                          color: cubit.currentIndex == 2
                              ? ColorManager.primary
                              : null),
                      label: "Jobs"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(ImageAssets.walletIc,
                          color: cubit.currentIndex == 3
                              ? ColorManager.primary
                              : null),
                      label: "Wallet"),
                ]),
            body: cubit.pages[cubit.currentIndex],
            appBar: cubit.currentIndex == 1
                ? null
                : AppBar(
                    toolbarHeight: 70.h,
                    centerTitle: false,
                    title: SvgPicture.asset(ImageAssets.appBArLogo,
                        height: 25.h),
                  ),
          ),
        );
        // state.getScreenWidget(context, buildContentBody(context, cubit, state), () {});

        // return buildContentBody(context, cubit, state);
      },
    );
  }
}
