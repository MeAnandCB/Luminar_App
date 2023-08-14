import 'package:lumainar/core/app_utils/app_utils.dart';
import 'package:lumainar/repository/helper/api_response.dart';

import '../../../helper/api_helper.dart';
import '../../course_details_screen/models/course_details_res_model.dart';
import '../res_models/demo_video_res_model.dart';

class HomeScreenServices {
  Future<APIResponse> getCourseList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/details/", header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        CourseDetailsResModel resData =
            CourseDetailsResModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch course list in home screen");
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }

  Future<APIResponse> getDemoVideoCourseList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/demovideo/", header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        DemoVideoResModel resData = DemoVideoResModel.fromJson(response.data);

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch demo class  list in home screen");
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
