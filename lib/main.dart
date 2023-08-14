import 'package:flutter/material.dart';
import 'package:lumainar/presentation/announcement_screen.dart/controller/announcement_screen_controller.dart';
import 'package:lumainar/presentation/assignment_screen/controller/assignment_screen_controller.dart';
import 'package:lumainar/presentation/attandance_screen/controller/attendance_screen_controller.dart';
import 'package:lumainar/presentation/class_screen/controller/batch_screen_controller.dart';
import 'package:lumainar/presentation/bottom_nav_bar_screen/view/bottom_nav_bar_screen.dart';
import 'package:lumainar/presentation/course_screen/controller/cource_screen_controller.dart';
import 'package:lumainar/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:lumainar/presentation/overview_Screen/controller/overview_screen_controller.dart';
import 'package:lumainar/presentation/splash_screen/splashScreen.dart';
import 'package:lumainar/presentation/videos_screen/controller/demo_screen_controller.dart';
import 'package:provider/provider.dart';
import 'presentation/course_details_screen/controller/courser_details_screen_controller.dart';
import 'presentation/demo_videos_list_screen/controller/demo_videos_list_screen_controller.dart';
import 'presentation/video_player_Screen/controller/video_player_screen_controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeScreenController()),
    ChangeNotifierProvider(create: (context) => CourseScreenController()),
    ChangeNotifierProvider(create: (context) => DemovideoController()),
    ChangeNotifierProvider(create: (context) => BatchScreenController()),
    ChangeNotifierProvider(create: (context) => OverviewScreenController()),
    ChangeNotifierProvider(create: (context) => AttendenceScreenController()),
    ChangeNotifierProvider(create: (context) => AssignmentScreenController()),
    ChangeNotifierProvider(create: (context) => AnnouncementScreenController()),
    ChangeNotifierProvider(create: (context) => VideoPlayerScreenController()),
    ChangeNotifierProvider(
        create: (context) => CourseDetailsScreenController()),
    ChangeNotifierProvider(
        create: (context) => DemoVideoListScreenController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luminar Technolab',
      theme: ThemeData(),
      home: SplashScreen(),
      routes: {
        '/BottomNavBar': (context) => BottomNavBar(),
      },
    );
  }
}
