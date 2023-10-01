import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/presentation/home/bloc/home_cubit.dart';
import 'package:x_app/presentation/home/widgets/home_content_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
        // listenWhen: (oldState, newState) =>// oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: HomeContentBody(state: state),
          );
        },
      ),
    );
  }
}
