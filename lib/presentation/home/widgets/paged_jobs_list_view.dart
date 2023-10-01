import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:x_app/components/exception_indicators/empty_list_indicator.dart';
import 'package:x_app/components/exception_indicators/error_indicator.dart';
import 'package:x_app/components/shimmer_widget.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/presentation/home/bloc/home_cubit.dart';
import 'package:x_app/presentation/home/widgets/job_item.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';

class PagedJobsList extends StatefulWidget {
  PagedJobsList({Key? key, required this.pagingController, required this.state})
      : super(key: key);
  PagingController<int, JobData> pagingController;
  HomeState state;

  @override
  State<PagedJobsList> createState() => _PagedJobsListState();
}

class _PagedJobsListState extends State<PagedJobsList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        // 2
        () => widget.pagingController.refresh(),
      ),
      // 3
      child: PagedListView.separated(
        // 4
// physics: const BouncingScrollPhysics(),
        pagingController: widget.pagingController,
        // padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(
          height: 1,
        ),
        builderDelegate: PagedChildBuilderDelegate<JobData>(
          animateTransitions: true,
          transitionDuration: const Duration(milliseconds: 600),
          newPageProgressIndicatorBuilder: (context) => SizedBox(
            height: 50,
            width: 50,
            child: Lottie.asset(JsonAssets.loading

                // LoadingAnimationWidget.(
                //   color: ColorManager.primary,
                //   size: 60,
                //
                // ),

                ),
          ),
          firstPageProgressIndicatorBuilder: (context) =>
              const ShimmerWidget.rectangle(height: 120),
          itemBuilder: (context, jobData, index) => JobItem(
            index: index,
            state: widget.state,
            job: jobData,
          ),
          firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
            error: widget.pagingController.error,
            onTryAgain: () => widget.pagingController.refresh(),
          ),
          noItemsFoundIndicatorBuilder: (context) => const EmptyListIndicator(),
        ),
      ),
    );
  }
}
