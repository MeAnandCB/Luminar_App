import 'package:lumainar/repository/api/course_details_screen/models/course_details_res_model.dart';
import 'package:lumainar/repository/helper/api_response.dart';
import '../../../../core/app_utils/app_utils.dart';
import '../../../helper/api_helper.dart';

class CourseDetailsScreenServices {
  //function to get course detils

  Future<APIResponse> getCourseDetials({required String courseId}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/details/$courseId/", header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        CourseDetailData resData =
            CourseDetailData.fromJson(response.data['data']);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch coursedetai list in batch Screen ");
      rethrow;
    }
  }
}
