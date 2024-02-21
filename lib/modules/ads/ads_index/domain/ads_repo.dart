import 'package:flutter/widgets.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/ads/ads_index/domain/model.dart';

class AdsRepo {
  static Future<AdsModel?> getAdsData(
      {required BuildContext context,
      required Map<String, dynamic> query}) async {
    final response = await DioService.getData(
        url: EndPoints.ads, loading: false, query: query, token: Utils.token);
    if (response != null) {
      return AdsModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
