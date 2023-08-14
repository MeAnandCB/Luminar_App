import 'package:lumainar/repository/api/attendance_screen_model/res_model/attedance_scree_model.dart';
import 'package:lumainar/repository/helper/api_helper.dart';
import 'package:lumainar/repository/helper/api_response.dart';
import '../../../../core/app_utils/app_utils.dart';

class AttendenceScreenServices {
  Future<APIResponse> getattendencedata() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/api/attendance/1/", header: AppUtils.getApiHeader());
      if (response.error) {
        return response;
      } else {
        print(response.data + "hoolo");
        AttendenceScreenModel resData =
            AttendenceScreenModel.fromJson(response.data['attendance_record']);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("failed to fetch BatchList list in batch Screen ");
      rethrow;
    }
  }
}
