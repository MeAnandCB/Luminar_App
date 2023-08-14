import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/demo_video_list_screen/models/demo_video_list_res_model.dart';
import 'package:lumainar/repository/api/demo_video_list_screen/services/demo_video_list_screen_services.dart';

class DemoVideoListScreenController extends ChangeNotifier {
  bool isDemoVideosLoading = true;

  DemoVideoListRestModel demoVideoListRestModel = DemoVideoListRestModel();

  // to Fetch the Course demo videos

  Future getDemoVideoList({required String courseId}) async {
    isDemoVideosLoading = true;
    notifyListeners();

    try {
      final fetchedData = await DemoVideoListScreenServices()
          .getDemoVideosList(courseId: courseId);
      if (fetchedData.error != true) {
        demoVideoListRestModel = fetchedData.data;
        print(demoVideoListRestModel.thumbnail);
      }

      isDemoVideosLoading = false;
      notifyListeners();
    } catch (e) {
      isDemoVideosLoading = false;
      notifyListeners();
      print(e);
    }
  }
}
