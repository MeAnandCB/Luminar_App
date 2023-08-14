import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/course_details_screen/models/course_details_res_model.dart';
import '../../../repository/api/course_screen/services/course_screen_service.dart';

class CourseScreenController extends ChangeNotifier {
  bool isCourseScreenLoading = true;
  List<CourseDetailData> courseScreenList = [];

  Future<List<CourseDetailData>> getCourseScreenList() async {
    isCourseScreenLoading = true;
    notifyListeners();
    final fetchedData = await CourseScreenServices().getCourseList();
    if (fetchedData.error != true) {
      CourseDetailsResModel courseScreenModel = fetchedData.data;
      courseScreenList = courseScreenModel.courseDetailList;
    }

    print("This is the course list ${courseScreenList.toString()}");
    isCourseScreenLoading = false;
    notifyListeners();
    print(isCourseScreenLoading.toString() + "loading");

    return courseScreenList;
  }
}
