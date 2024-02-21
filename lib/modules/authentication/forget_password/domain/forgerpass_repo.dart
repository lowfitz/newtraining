import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/authentication/user/domain/user_model.dart';

class ForgetPasswordRepo {
  static Future<UserModel?> forgetPasswordMethode({required body}) async {
    final response = await DioService.postData(
      url: EndPoints.restPass,
      loading: true,
      body: body,
    );

    return UserModel.fromJson(response?.data);
  }
}
