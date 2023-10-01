import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/presentation/home/bloc/home_cubit.dart';
import 'package:x_app/presentation/home/widgets/build_profile_information_section.dart';
import 'package:x_app/presentation/home/widgets/paged_jobs_list_view.dart';

class HomeContentBody extends StatefulWidget {
  HomeContentBody({Key? key, required this.state}) : super(key: key);
  HomeState state;

  @override
  State<HomeContentBody> createState() => _HomeContentBodyState();
}

class _HomeContentBodyState extends State<HomeContentBody> {
  PagingController<int, JobData> pagingController =
      PagingController<int, JobData>(
    // 2
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    Future.wait([
      HomeCubit.get(context).getUserProfile(),
      HomeCubit.get(context).getProfileCompilation(),
      // HomeCubit.get(context).getAllJobs(
      //     page: pagingController.firstPageKey,
      //     pagingController: pagingController)
    ]);
    pagingController.addPageRequestListener((pageKey) {
      HomeCubit.get(context)
          .getAllJobs(page: pageKey, pagingController: pagingController);
    });
  }

  // @override
  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        BuildProfileInformationSection(
          state: widget.state,
        ),
        SizedBox(
          height: 20.h,
        ),
        // if (cubit.data?.data == null)
        //   Expanded(
        //     child: ListView.separated(
        //       itemBuilder: (context, index) {
        //         return ShimmerWidget.rectangle(
        //             height: MediaQuery.of(context).size.height / 7);
        //       },
        //       separatorBuilder: (BuildContext context, int index) {
        //         return SizedBox(
        //           height: 31.h,
        //         );
        //       },
        //       itemCount: 20,
        //     ),
        //   ),
        Expanded(
            child: PagedJobsList(
          pagingController: pagingController,
          state: widget.state,
        ))
      ],
    );
  }
}
