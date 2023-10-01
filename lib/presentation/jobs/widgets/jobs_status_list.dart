import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:x_app/components/exception_indicators/empty_list_indicator.dart';
import 'package:x_app/components/shimmer_widget.dart';
import 'package:x_app/presentation/jobs/bloc/jobs_cubit.dart';
import 'package:x_app/presentation/jobs/widgets/job_status_item.dart';
import 'package:x_app/presentation/resources/routes_manager.dart';

class JobsList extends StatelessWidget {
  JobsList({super.key, required this.state});

  JobsState state;

  @override
  Widget build(BuildContext context) {
    var job = JobsCubit.get(context).getJobsStatus;
    if (state is GetJobsStatusListSuccessState) {
      return AnimationLimiter(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 800),
              child: SlideAnimation(
                // horizontalOffset:50.0,
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: JobStatusItem(index: index, state: state),
                ),
              ),
            );
          },
          itemCount: job?.data?.length ?? 0,
        ),
      );
    } else if (state is GetJobsStatusListEmptyState){
      return const EmptyListIndicator();
    }else {
      return const ShimmerWidget.rectangle(height: 120);
    }
  }
}
