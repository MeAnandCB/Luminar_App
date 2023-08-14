import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/overview_screen/services/overview_services.dart';
import '../../../repository/api/overview_screen/res_model/overview_model.dart';

class OverviewScreenController extends ChangeNotifier {
  bool isOverviewsscreenLoading = true;
  OverviewScreenModel? overviewData;

  Future getOverviewDetails() async {
    isOverviewsscreenLoading = true;
    notifyListeners();
    final fetchedData = await OverviewScreenServices().getOverviewData();
    if (fetchedData.error != true) {
      overviewData = fetchedData.data;
      isOverviewsscreenLoading = false;
      notifyListeners();
      print(overviewData);
      print(isOverviewsscreenLoading.toString() + "loading");
    } else {
      print("Error");
      isOverviewsscreenLoading = false;
      notifyListeners();
    }
  }
}
