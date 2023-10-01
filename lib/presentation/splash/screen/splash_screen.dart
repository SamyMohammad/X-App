import 'package:flutter/material.dart';
import 'package:x_app/presentation/splash/widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white, body: SplashViewBody());
  }
}
