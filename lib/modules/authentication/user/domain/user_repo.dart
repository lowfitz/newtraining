import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/authentication/user/domain/user_model.dart';

class UserRepo {
  static Future<UserModel?> getUserData({token}) async {
    final response = await DioService.getData(
        url: EndPoints.user, loading: false, token: Utils.token);

    if (response != null) {
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
