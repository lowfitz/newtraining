import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/authentication/user/domain/user_model.dart';

class LogInRepo {
  static Future<UserModel?> logInMethode({required body}) async {
    final response = await DioService.postData(
      url: EndPoints.login,
      loading: true,
      body: body,
    );

    if (response != null) {
      // ignore: avoid_print

      var responsedata = response.data;
      await LocalData.insertData(
          key: 'token', value: responsedata["data"]['token']);
      Utils.token = LocalData.getCachedData(key: 'token');
      print(response.statusCode);

      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
