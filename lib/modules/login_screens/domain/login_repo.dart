import 'package:flutter/material.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/app_dio.dart';
import 'package:new_bussiness_app/modules/home/presentaion/home_screen.dart';
import 'package:new_bussiness_app/modules/login_screens/domain/user_model.dart';

class LogInRepo {
  static Future<UserModel?> logInMethode(
      {required BuildContext context, required body}) async {
    final response = await RemoteDataSource.postData(
      url: EndPoints.login,
      loading: true,
      body: body,
    );

    var responsedata = response?.data;
    await LocalData.insertData(
        key: 'token', value: responsedata["data"]['token']);
    Utils.token = LocalData.getCachedData(key: 'token');
    if (response != null) {
      // ignore: avoid_print
      print(response.statusCode);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
