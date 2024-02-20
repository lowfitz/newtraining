import 'package:flutter/widgets.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/app_dio.dart';
import 'package:new_bussiness_app/modules/ads/domain/model.dart';
import 'package:new_bussiness_app/modules/edit_ads/domain/model.dart';

class EditAdsRepo {
  static Future<AdsModel?> editAdsData(
      {required BuildContext context,
      required int id,
      required Map<String, dynamic> body}) async {
    final response = await RemoteDataSource.putData(
        url: EndPoints.updateAdById(id),
        loading: false,
        body: body,
        token: Utils.token);
    if (response != null) {
      return AdsModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}

class ShowAdRepo {
  static Future<AdShowModel?> showad({
    required BuildContext context,
    required String id,
  }) async {
    final response = await RemoteDataSource.getData(
      context,
      url: EndPoints.adsById(id),
      token: Utils.token,
      loading: false,
    );
    if (response != null) {
      return AdShowModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
