import 'package:lumainar/repository/api/course_details_screen/models/course_details_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';
import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';

class CourseScreenServices {
  Future<APIResponse> getCourseList() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/details/", header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        CourseDetailsResModel resData =
            CourseDetailsResModel.fromJson(response.data);
        print(resData.toString() + "crs1");

        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch courseDetails in Course Detial Screen");
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
