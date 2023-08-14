import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/home_screen/services/home_screen_services.dart';
import '../../../repository/api/demo_video/res_model/demo_video_model.dart';

class DemovideoController extends ChangeNotifier {
  bool isLoading = true;
  List<DemoVideos> demovideoList = [];

  Future<List<DemoVideos>> getDemoVideosList() async {
    isLoading = true;
    notifyListeners();
    final fetchedData = await HomeScreenServices().getCourseList();
    if (fetchedData.error != true) {
      DemovideoModel demovideoModel = fetchedData.data;
      demovideoList = demovideoModel.courses;
    }

    print(demovideoList.toString() + "crs1");
    isLoading = false;
    notifyListeners();
    print(isLoading.toString() + "loading");

    return demovideoList;
  }
}
