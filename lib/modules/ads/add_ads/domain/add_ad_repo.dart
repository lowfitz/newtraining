import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/home/domain/home_model.dart';

class AddAdsRepo {
  static Future<Ads?> postAd({
    required BuildContext context,
    required Map<String, dynamic>? body,
  }) async {
    final response = await DioService.postData(
      body: body,
      loading: true,
      url: EndPoints.addAd,
      isForm: true,
      token: Utils.token,
      // query: {'status': 'pending'},
    );

    if (response != null) {
      if (kDebugMode) {
        print(response.statusCode);
      }
      return Ads.fromJson(response.data);
    } else {
      return null;
    }
  }
}
