import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app/app/bloc_observer.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/app/functions.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // final String initialRoute = await getInitialRoute();

  Bloc.observer = MyBlocObserver();
  await initAppModule();
  runApp(DevicePreview(
    enabled: kReleaseMode,
    builder: (BuildContext context) {
      return const MyApp(
      );
    },
  ));
}
