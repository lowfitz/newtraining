import 'package:flutter/widgets.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';
import 'package:new_bussiness_app/modules/home/domain/home_model.dart';

class HomeRepo {
  static Future<HomeModel?> getHomeData({
    required BuildContext context,
  }) async {
    final response = await DioService.getData(
      url: EndPoints.home,
      loading: false,
    );

    if (response != null) {
      return HomeModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  static Future<List<Categories>> getCateogry() async {
    final response = await DioService.getData(
      url: EndPoints.home,
      loading: false,
    );

    if (response != null) {
      return HomeModel.fromJson(response.data).categories ?? [];
    } else {
      return [];
    }
  }
}
