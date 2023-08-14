import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/course_details_screen/models/course_details_res_model.dart';
import 'package:lumainar/repository/api/course_details_screen/services/course_details_screen_services.dart';

class CourseDetailsScreenController extends ChangeNotifier {
  bool isLoading = false;
  CourseDetailData? courseDetails;

  Future getCourseDetials({required String courseId}) async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchedData = await CourseDetailsScreenServices()
          .getCourseDetials(courseId: courseId);
      if (fetchedData.error != true) {
        courseDetails = fetchedData.data;
        isLoading = false;
        notifyListeners();
      } else {
        print(fetchedData.errorMessage);
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
      rethrow;
    }

    ;
  }
}
