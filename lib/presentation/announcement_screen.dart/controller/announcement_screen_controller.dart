import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/announcement_screen/announcement_model/announcement_model.dart';
import 'package:lumainar/repository/api/announcement_screen/services/announcement_services.dart';

class AnnouncementScreenController extends ChangeNotifier {
  List<AnnouncementData> announcementList = [];
  bool isAnnouncementLoading = false;
  Future<List<AnnouncementData>> getAnnouncementList() async {
    isAnnouncementLoading = true;
    notifyListeners();
    final fetchedData =
        await AnnouncementScreenServices().getAnnouncementList();
    if (fetchedData.error != true) {
      AnnouncementScreenModel announcementScreenModel = fetchedData.data;
      announcementList = announcementScreenModel.data;
    }

    print(announcementList);
    isAnnouncementLoading = false;
    notifyListeners();

    return announcementList;
  }
}
