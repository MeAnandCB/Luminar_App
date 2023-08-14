import 'package:flutter/material.dart';
import 'package:lumainar/presentation/announcement_screen.dart/view/announcement_screen.dart';
import 'package:lumainar/presentation/attandance_screen/view/attandance_screen.dart';
import 'package:lumainar/presentation/live_classes/liveClass.dart';
import 'package:lumainar/presentation/overview_Screen/view/overView.dart';
import 'package:lumainar/presentation/test_screen/testScreen.dart';
import '../../../core/constants/colors.dart';
import '../../assignment_screen/view/assignment_screen.dart';
import '../../monthly_attendance_screen/view/monthly_attendance_screen.dart';
import '../../study_material_screen/studyMaterial.dart';
import '../../videos_screen/view/videosScreen.dart';
import 'widgets/batch_screen_container.dart';

class BatchDetails extends StatefulWidget {
  const BatchDetails({super.key});

  @override
  State<BatchDetails> createState() => _BatchDetailsState();
}

class _BatchDetailsState extends State<BatchDetails> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Batch Details",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "FLT-Nov22-B1-Sreedevi",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
//
//
              // Calling  overview Screen here                   ////////////////////////////////////////////////////////////////////////////////////
              //
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OverView()));
                },
                child: BatchDetailsContainer(
                  iconname: Icons.record_voice_over,
                  name: "OverView",
                ),
              ),
              SizedBox(height: 15),
              // Calling Attandance Screen here                   ////////////////////////////////////////////////////////////////////////////////////
              //
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MonthlyAttandanceScreen()));
                },
                child: BatchDetailsContainer(
                  iconname: Icons.receipt_long,
                  name: "Attendance",
                ),
              ),
              SizedBox(height: 15),
              // Calling Attandance Screen here                   ////////////////////////////////////////////////////////////////////////////////////
              //
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Assignment()));
                },
                child: BatchDetailsContainer(
                  iconname: Icons.filter_list,
                  name: "Assignment",
                ),
              ),
              SizedBox(height: 15),
              // Calling Attandance Screen here                   ////////////////////////////////////////////////////////////////////////////////////
              //
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AnnouncementScreen()));
                },
                child: BatchDetailsContainer(
                  iconname: Icons.campaign,
                  name: "Announcements",
                ),
              ),
              SizedBox(height: 15),
              // Calling Attandance Screen here                   ////////////////////////////////////////////////////////////////////////////////////
              //
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LiveClass()));
                },
                child: BatchDetailsContainer(
                  iconname: Icons.stream,
                  name: "Live Classes",
                ),
              ),
              SizedBox(height: 15),
              // Calling Attandance Screen here                   ////////////////////////////////////////////////////////////////////////////////////
              //
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoClassScreen()));
                },
                child: BatchDetailsContainer(
                  iconname: Icons.video_call,
                  name: "Videos",
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TestScreen()));
                },
                child: BatchDetailsContainer(
                  iconname: Icons.local_library,
                  name: "Test",
                ),
              ),
              SizedBox(height: 15),
              // Calling Attandance Screen here                   ////////////////////////////////////////////////////////////////////////////////////
              //
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StudyMaterial()));
                },
                child: BatchDetailsContainer(
                  iconname: Icons.school,
                  name: "Study materials",
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
