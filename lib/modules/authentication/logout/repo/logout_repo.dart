import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';

class LogoutRepo {
  static Future logoutrepo() async {
    final response = await DioService.postData(
      url: EndPoints.logout,
      loading: true,
    );
    print(response?.statusCode);
    return response?.data;
  }
}
