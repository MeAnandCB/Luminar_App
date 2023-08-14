import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/api/demo_video_list_screen/models/demo_video_list_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';

class DemoVideoListScreenServices {
  Future<APIResponse> getDemoVideosList({required String courseId}) async {
    try {
      print(courseId);
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/demovideo/$courseId/",
          header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        print("hai");
        DemoVideoListRestModel resData =
            DemoVideoListRestModel.fromJson(response.data["data"]);
        print(resData.thumbnail);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print(e);
      print("failed to fetch demo class  list in home screen");
      rethrow;
    }
  }
}
