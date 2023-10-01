import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shadow_clip/shadow_clip.dart';
import 'package:x_app/presentation/profile/bloc/profile_cubit.dart';
import 'package:x_app/presentation/profile/widgets/build_sections.dart';
import 'package:x_app/presentation/profile/widgets/custom_shape_app_bar.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/routes_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';

class ProfileContentBody extends StatefulWidget {
  ProfileContentBody({
    required this.cubit,
    required this.state,
    super.key,
  });

  final ProfileCubit cubit;
  ProfileState state;

  @override
  State<ProfileContentBody> createState() => _ProfileContentBodyState();
}

class _ProfileContentBodyState extends State<ProfileContentBody> {
  @override
  void initState() {
    widget.cubit.initEducationControllers();
    widget.cubit.initEditAccountControllers();
    super.initState();
  }

  @override
  void dispose() {
    widget.cubit.disposeEducationControllers();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is ProfileLoading ||
        widget.state is GetUserProfileLoadingState) {
      return Center(
        child: Center(
          child: SizedBox(
            height: 220.h,
            width: 220.w,
            child: Lottie.asset(JsonAssets.loading, frameRate: FrameRate.max),
          ),
        ),
      );
    } else {
      return CustomScrollView(
        slivers: [
          buildAppBar(context),
          SliverToBoxAdapter(child: SizedBox(height: 50.h)),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                '${widget.cubit.userProfile?.data?.userData?.firstName ?? ''} ${widget.cubit.userProfile?.data?.userData?.middleName ?? ''} ${widget.cubit.userProfile?.data?.userData?.lastName ?? ''}',
                style: getBoldStyle(fontSize: 20.sp, color: Colors.black),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 4.h)),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                widget.cubit.userProfile?.data?.userData?.specialization ==
                            'None' ||
                        widget.cubit.userProfile?.data?.userData
                                ?.specialization ==
                            null
                    ? 'Job Title'
                    : widget.cubit.userProfile?.data?.userData
                            ?.specialization ??
                        '',
                style: getRegularStyle(
                    fontSize: 16.sp, color: ColorManager.jobTitle),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BuildSections(
              cubit: widget.cubit,
              state: widget.state,
            ),
          )
        ],
      );
    }
  }

  SliverToBoxAdapter buildAppBar(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0.h),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            ClipShadow(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              clipper: CustomShape(),
              // this is my own class which extendsCustomClipper
              child: Container(
                height: 140.h,
                color: ColorManager.primary,
              ),
            ),
            buildProfilePicture(),
            Positioned(
              top: 30.h,
              left: 20.w,
              child: SvgPicture.asset(ImageAssets.appBArLogo, height: 25.h),
            ),
            Positioned(
                top: 22.h,
                right: 0.w,
                child: PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<String>>[
                    const PopupMenuItem<String>(
                      value: 'option1',
                      child: Text('Edit Account'),
                    ),
                    PopupMenuItem<String>(
                      value: 'option2',
                      child: Row(
                        children: [
                          const Text('Log out'),
                          const Spacer(),
                          Icon(
                            Icons.logout,
                            color: ColorManager.jobTitle,
                          )
                        ],
                      ),
                    ),
                  ],
                  onSelected: (String value) {
                    // Do something when the dropdown item is selected
                    setState(() {});
                    if (value == 'option1') {
                      Navigator.pushNamed(context, Routes.updateProfileRoute,
                          arguments: widget.cubit);
                    } else if (value == 'option2') {
                      if (mounted) {
                        widget.cubit.logout();
                      }
                    }
                  },
                  icon: Icon(Icons.more_vert, color: Colors.white, size: 26.sp),
                ))
          ],
        ),
      ),
    );
  }

  Positioned buildProfilePicture() {
    return Positioned(
      bottom: -45.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        fit: StackFit.passthrough,
        children: [
          CircleAvatar(
            radius: 62.0.r,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 59.0.r,
              backgroundColor: ColorManager.primary,
              backgroundImage: widget.cubit.profilePictureUrl != null
                  ? NetworkImage(
                      widget.cubit.profilePictureUrl ?? '',
                    )
                  : widget.cubit.image != null
                      ? FileImage(widget.cubit.image!) as ImageProvider
                      : null,
              child: widget.cubit.profilePictureUrl == null
                  ? Image.asset(
                      ImageAssets.user,
                      height: 50.h,
                      width: 50.w,
                    )
                  : null,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: IconButton(
              iconSize: 60,
              color: Colors.deepOrange,
              onPressed: () {
                widget.cubit
                    .pickImage()
                    .then((value) => widget.cubit.updatePhoto());
              },
              icon: CircleAvatar(
                radius: 22.r,
                backgroundColor: Colors.grey.withOpacity(0.5),
                child: Image.asset(
                  'assets/images/photo-camera.png',
                  color: Colors.white,
                  width: 15.w,
                  height: 15.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
