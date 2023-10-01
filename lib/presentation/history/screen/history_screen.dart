import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/presentation/history/bloc/history_cubit.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<HistoryCubit>(),
      child: BlocConsumer<HistoryCubit, HistoryState>(
        // listenWhen: (oldState, newState) =>// oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0.w),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
          );
          // state.getScreenWidget(context, buildContentBody(context, cubit, state), () {});

          // return buildContentBody(context, cubit, state);
        },
      ),
    );
  }
}
