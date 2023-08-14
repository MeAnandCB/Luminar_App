import 'package:lumainar/repository/api/home_screen/res_models/demo_video_res_model.dart';

import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';
import '../../../helper/api_response.dart';

class DemovideoScreenServices {
  Future<APIResponse> getDemovideoList({required String demoVideoId}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/videoscreen/$demoVideoId/",
          header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        DemoVideoResModel resData = DemoVideoResModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch Demovideo Screen Detial Screen");
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
