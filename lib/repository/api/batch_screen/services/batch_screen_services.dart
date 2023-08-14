import 'package:lumainar/repository/helper/api_response.dart';
import 'package:lumainar/repository/api/batch_screen/res_model/batch_screen_model.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';

class BatchScreenServices {
  Future<APIResponse> getBatchList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/batches/", header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        BatchScreenModel resData = BatchScreenModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch BatchList list in batch Screen ");
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
