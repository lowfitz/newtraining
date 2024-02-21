import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/ads/ads_index/domain/model.dart';
import 'package:new_bussiness_app/modules/ads/edit_ads/domain/model.dart';

class EditAdsRepo {
  static Future<AdsModel?> editAdsData(
      {required String id, required Map<String, dynamic> body}) async {
    final response = await DioService.postData(
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
    required String id,
  }) async {
    final response = await DioService.getData(
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
