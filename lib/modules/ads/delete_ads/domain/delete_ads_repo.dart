import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/dio_service.dart';

class DeleteADsRepo {
  static Future deleteADsMethode({required String id}) async {
    final response = await DioService.deleteData(
        url: EndPoints.deleteAd(id), loading: true, token: Utils.token);

    return response?.data;
  }
}
