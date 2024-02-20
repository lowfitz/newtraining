import 'package:flutter/widgets.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/app_dio.dart';
import 'package:new_bussiness_app/modules/login_screens/domain/user_model.dart';

class UserRepo {
  static Future<UserModel?> getUserData(
      {required BuildContext context, token}) async {
    final response = await RemoteDataSource.getData(context,
        url: EndPoints.user, loading: false, token: Utils.token);

    if (response != null) {
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
