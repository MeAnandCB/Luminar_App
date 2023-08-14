import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/attendance_screen_model/services/attendance_services.dart';

import '../../../repository/api/attendance_screen_model/res_model/attedance_scree_model.dart';

class AttendenceScreenController extends ChangeNotifier {
  bool isLoading = false;
  AttendenceScreenModel? attendenceScreenModel;

  Future getAttedenceList() async {
    isLoading = true;
    notifyListeners();
    try {
      final fetchedData = await AttendenceScreenServices().getattendencedata();
      if (fetchedData.error != true) {
        attendenceScreenModel = fetchedData.data;
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
