import 'package:flutter/material.dart';
import 'package:lumainar/repository/api/batch_screen/res_model/batch_screen_model.dart';
import 'package:lumainar/repository/api/batch_screen/services/batch_screen_services.dart';

class BatchScreenController extends ChangeNotifier {
  bool isBatchsscreenLoading = true;
  List<BatchDetails> batchList = [];

  Future<List<BatchDetails>> getBatchList() async {
    isBatchsscreenLoading = true;
    notifyListeners();
    final fetchedData = await BatchScreenServices().getBatchList();
    if (fetchedData.error != true) {
      BatchScreenModel batchScreenModel = fetchedData.data;
      batchList = batchScreenModel.data;
    }
    print(batchList);
    isBatchsscreenLoading = false;
    notifyListeners();
    print(isBatchsscreenLoading.toString() + "loading");

    return batchList;
  }
}
