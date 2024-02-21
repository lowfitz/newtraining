import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/authentication/user/domain/user_model.dart';

class RegisterRepo {
  static Future<UserModel?> registerMethode({required body}) async {
    final response = await DioService.postData(
      url: EndPoints.register,
      loading: true,
      body: body,
    );
    if (response != null) {
      // ignore: avoid_print
      print(response.statusCode);
      return response.data;
    } else {
      return null;
    }
  }
}
