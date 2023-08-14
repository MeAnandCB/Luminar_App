import 'package:lumainar/repository/api/overview_screen/res_model/overview_model.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';
import '../../../helper/api_response.dart';

class OverviewScreenServices {
  Future<APIResponse> getOverviewData() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/overview/1/", header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        OverviewScreenModel resData =
            OverviewScreenModel.fromJson(response.data["data"]);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch overview list ");
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
