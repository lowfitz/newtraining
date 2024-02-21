import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/authentication/user/domain/user_model.dart';

class UpdateUserRepo {
  static Future<UserModel?> updateUserMethode({required body}) async {
    final response = await DioService.postData(
        url: EndPoints.updateUserData,
        loading: true,
        body: body,
        token: Utils.token);

    if (response != null) {
      // ignore: avoid_print
      print(response.statusCode);

      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
