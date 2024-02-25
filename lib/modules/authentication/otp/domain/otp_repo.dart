import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';

class OTPSendRepo {
  static Future otpsendMethode({required body}) async {
    String? otpcode;
    final response = await DioService.postData(
      url: EndPoints.sendOTP,
      loading: true,
      body: body,
    );
    print(response?.data);
    response?.data['code'] = otpcode;
    print(otpcode);
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
