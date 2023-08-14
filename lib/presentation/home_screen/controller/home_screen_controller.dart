import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lumainar/repository/api/home_screen/res_models/course_list_res_model.dart';
import 'package:lumainar/repository/api/home_screen/res_models/instagram_posts_res_model.dart';
import 'package:lumainar/repository/api/home_screen/services/home_screen_services.dart';
import '../../../repository/api/course_details_screen/models/course_details_res_model.dart';
import '../../../repository/api/home_screen/res_models/demo_video_res_model.dart';

class HomeScreenController extends ChangeNotifier {
  bool isDemoVideosLoading = true;
  bool isInstagramLoading = true;
  bool isCoursesLoading = true;

  List<CourseDetailData> courseList = [];
  List<DemoVideoCourseData> demoVideosCourseList = [];
  List<InstaPostModel> instaPostList = [];

  Future<List<CourseDetailData>> getCourseList() async {
    isCoursesLoading = true;
    notifyListeners();
    final fetchedData = await HomeScreenServices().getCourseList();
    if (fetchedData.error != true) {
      CourseDetailsResModel courseListModel = fetchedData.data;
      courseList = courseListModel.courseDetailList;
    }

    isCoursesLoading = false;
    notifyListeners();
    print(isCoursesLoading.toString() + "loading");

    return courseList;
  }

  // to Fetch the Course demo videos

  Future<List<DemoVideoCourseData>> getDemoVideoList() async {
    isDemoVideosLoading = true;
    notifyListeners();

    final fetchedData = await HomeScreenServices().getDemoVideoCourseList();
    if (fetchedData.error != true) {
      DemoVideoResModel demoVideoModel = fetchedData.data;
      demoVideosCourseList = demoVideoModel.demoVideoCourseList ?? [];
    }

    print(demoVideosCourseList.length);
    isDemoVideosLoading = false;
    notifyListeners();
    print(isDemoVideosLoading.toString() + "loading");

    return demoVideosCourseList;
  }

  //to fetch instagram posts
  Future<void> fetchInstagramPosts() async {
    print(isInstagramLoading.toString() + "POOOOST");

    isInstagramLoading = true;
    notifyListeners();
    final accessToken =
        'IGQVJXNzQteVBFdER0YmpKWVBad3lhN1JhY2l6bTByZAVBBTnhVSzlZAbVM4c0IyU2FrXy1Scjg0TDZAWcWdSdXRIVEVqcGVBcnJRbjFfTXhoUGVyZATZAvdEZAuWjJKbl90T0NkamhYQm15bi1vNzRmVzNrVwZDZD';
    final response = await http.get(Uri.parse(
      'https://graph.instagram.com/me/media?fields=id,caption,media_url&access_token=$accessToken',
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(isInstagramLoading.toString() + "POOOOST");

      InstagramPostsResModel instagramPostsResModel =
          InstagramPostsResModel.fromJson(data);
      instaPostList = instagramPostsResModel.data;
    }
    isInstagramLoading = false;
    notifyListeners();
  }
}
