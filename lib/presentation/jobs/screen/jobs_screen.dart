import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/app/di.dart';
import 'package:x_app/presentation/jobs/bloc/jobs_cubit.dart';
import 'package:x_app/presentation/jobs/widgets/jobs_status_list.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<JobsCubit>()..getHistoryJobs(),
      child: BlocConsumer<JobsCubit, JobsState>(
        // listenWhen: (oldState, newState) =>// oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Expanded(
                    child: JobsList(
                  state: state,
                ))
              ],
            ),
          );

          // return buildContentBody(context, cubit, state);
        },
      ),
    );
  }
}
