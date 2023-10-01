import 'package:flutter/material.dart';
import 'package:x_app/app/app_navigator.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/presentation/find_account/screen/find_account_screen.dart';
import 'package:x_app/presentation/forgot_password/screen/forget_password_screen.dart';
import 'package:x_app/presentation/job_details/screen/job_details_screen.dart';
import 'package:x_app/presentation/jobs/screen/job_details_status_screen.dart';
import 'package:x_app/presentation/jobs/screen/jobs_screen.dart';
import 'package:x_app/presentation/login/screen/login_screen.dart';
import 'package:x_app/presentation/main/screen/main_screen.dart';
import 'package:x_app/presentation/otp_code/screen/otp_screen.dart';
import 'package:x_app/presentation/profile/screen/profile_screen.dart';
import 'package:x_app/presentation/profile/screen/update_profile.dart';
import 'package:x_app/presentation/registeration/screen/registration1_screen.dart';
import 'package:x_app/presentation/splash/screen/splash_screen.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String register1Route = "/register1";
  static const String register2Route = "/register2";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String otpRoute = "/otp";
  static const String findAccountRoute = "/findAccount";
  static const String mainRoute = "/main";
  static const String profileRoute = "/profile";
  static const String updateProfileRoute = "/updateProfile";
  static const String jobsRoute = "/jobs";
  static const String jobDetailsRoute = "/jobDetails";
  static const String jobDetailsStatusRoute = "/jobStatusDetails";
}

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(onSignInSuccess: () {
                  AppNavigator.instance.removeUntil(const MainScreen());
                }));
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.register1Route:
        return MaterialPageRoute(
            builder: (_) => Registration1Screen(
                  onSignUpSuccess: () {
                    AppNavigator.instance
                        .removeUntil(LoginScreen(onSignInSuccess: () {
                      AppNavigator.instance.removeUntil(const MainScreen());
                    }));
                  },
                ));
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.updateProfileRoute:
        {
          return MaterialPageRoute(
              builder: (_) => UpdateProfileScreen(
                    cubit: instance(),
                  ));
        }
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.jobsRoute:
        return MaterialPageRoute(builder: (_) => const JobsScreen());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.findAccountRoute:
        return MaterialPageRoute(builder: (_) => const FindAccountScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.jobDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => const JobDetailsScreen(), settings: settings);
      case Routes.jobDetailsStatusRoute:
        return MaterialPageRoute(
            builder: (_) => const JobDetailsStatusScreen(), settings: settings);
      default:
        return null;
    }
  }
}
