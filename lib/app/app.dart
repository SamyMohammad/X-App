import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/app/app_navigator.dart';
import 'package:x_app/presentation/resources/routes_manager.dart';
import 'package:x_app/presentation/resources/theme_manager.dart';

import '../presentation/main/bloc/main_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => MainCubit(),
          child: MaterialApp(
            navigatorKey: AppNavigator.instance.navigatorKey,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
            theme: getApplicationTheme(),
          ),
        );
      },
    );
  }
}
