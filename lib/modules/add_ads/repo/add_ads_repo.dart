import 'dart:io';

import 'package:dio/dio.dart';
import 'package:new_bussiness_app/General/end_points.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/data/remote/app_dio.dart';

class MediaRepo {
  static Future<String?> postMedia(context, {required File media}) async {
    final response = await RemoteDataSource.postData(
        loading: true,
        isForm: true,
        body: {
          "media": await MultipartFile.fromFile(media.path),
        },
        url: EndPoints.media,
        token: Utils.token);
    if (response != null) {
      return response.data["data"]["id"];
    }
    return null;
  }
}
