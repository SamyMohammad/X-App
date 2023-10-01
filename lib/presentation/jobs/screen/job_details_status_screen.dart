import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_app/data/remote/models/responses/get_jobs_history.dart';
import 'package:x_app/presentation/jobs/widgets/details_screen_content_body.dart';
import 'package:x_app/presentation/resources/assets_manager.dart';

class JobDetailsStatusScreen extends StatefulWidget {
  const JobDetailsStatusScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailsStatusScreen> createState() => _JobDetailsStatusScreenState();
}

class _JobDetailsStatusScreenState extends State<JobDetailsStatusScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final job = ModalRoute.of(context)!.settings.arguments as Data?;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        centerTitle: false,
        title: SvgPicture.asset(ImageAssets.appBArLogo, height: 25.h),
      ),
      body: ContentBody(
        jobData: job ?? Data(),
      ),
    );
  }
}
