import 'package:flutter/material.dart';

import 'package:lumainar/repository/api/assignment_screen/res_model/assignment_screen_model.dart';
import 'package:lumainar/repository/api/assignment_screen/services/assignment_screen_services.dart';

class AssignmentScreenController extends ChangeNotifier {
  bool isAssignmentscreenLoading = true;
  List<Assignment> assignmentList = [];

  Future<List<Assignment>> geAssignmentList() async {
    isAssignmentscreenLoading = true;
    notifyListeners();
    final fetchedData = await AssignmentScreenServices().getAssignmentList();
    if (fetchedData.error != true) {
      AssignmentScreenModel assignmentScreenModel = fetchedData.data;
      assignmentList = assignmentScreenModel.assignments;
    }
    print(assignmentList);
    isAssignmentscreenLoading = false;
    notifyListeners();
    print(isAssignmentscreenLoading.toString() + "loading");

    return assignmentList;
  }
}
