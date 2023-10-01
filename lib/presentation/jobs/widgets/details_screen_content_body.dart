import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/data/remote/models/responses/get_jobs_history.dart';
import 'package:x_app/presentation/jobs/widgets/build_details_status_container.dart';

class ContentBody extends StatelessWidget {
  const ContentBody({super.key, required this.jobData});

  final Data jobData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            // height: MediaQuery.of(context).size.height /8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
            child: BuildDetailsContainer(
              jobData: jobData,
            ),
          ),
        ],
      ),
    );
  }
}
