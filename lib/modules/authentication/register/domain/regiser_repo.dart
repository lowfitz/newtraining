import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/login_screens/domain/user_model.dart';

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
      return UserModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}

class OTPSendRepo {
  static Future otpsendMethode({required body}) async {
    final response = await DioService.postData(
      url: EndPoints.sendOTP,
      loading: true,
      body: body,
    );
    print(response?.data);
    return response?.data;
  }
}

class OTPVerifyRepo {
  static Future otpverifyMethode({required body}) async {
    final response = await DioService.postData(
      url: EndPoints.vertfyOtp,
      loading: true,
      body: body,
    );
    print(response?.data);
    return response?.data;
  }
}
