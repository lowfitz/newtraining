import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class DioService {
  static Dio dio = Dio();
  static void init() {
    dio = Dio(BaseOptions(
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        baseUrl: 'https://business-station.dev6.reeras.site/api/v1/',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000)))
      ..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    bool loading = false,
    bool isForm = false,
    // void Function(int, int)? onSendProgress,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      if (loading) {
        Myloading().show();
      }
      final response = await dio.get(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      token = LocalData.getCachedData(key: 'token');
      if (loading) {
        Myloading().dimiss();
      }
      return response;
    } on DioException {
      if (loading) {
        Myloading().dimiss();
      }
    }
    return null;
  }

  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    bool loading = false,
    bool isForm = false,
    // void Function(int, int)? onSendProgress,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      if (loading) {
        Myloading().show();
      }
      final response = await dio.post(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        Myloading().dimiss();
      }

      return response;
    } on DioException {
      Myloading().dimiss();
    }
    return null;
  }

  static Future<Response?> putData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    String? token,
    bool loading = false,
    bool isForm = false,
    // void Function(int, int)? onSendProgress,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      if (loading) {
        Myloading().show();
      }
      final response = await dio.put(url,
          queryParameters: query,
          data: isForm ? FormData.fromMap(body ?? {}) : body);
      if (loading) {
        Myloading().dimiss();

        return response;
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return null;
  }

  static Future<Response?> deleteData({
    required String url,
    // required String id,
    Map<String, dynamic>? body,
    //Map<String, dynamic>? query,
    String? token,
    bool loading = false,
    //  bool isForm = false,
    // void Function(int, int)? onSendProgress,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await dio.delete(
        url,
        //queryParameters: query,
      );

      return response;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
    return null;
  }
}

// class DioHelper {
//   static Dio mydio = Dio();

//   static void init() {
//     mydio = Dio(
//       BaseOptions(
//           headers: {
//             "Accept": "application/json",
//             "content-type": "application/json",
//           },
//           baseUrl: 'https://business-station.dev6.reeras.site/api/v1/',
//           receiveDataWhenStatusError: true,
//           connectTimeout: Duration(microseconds: 6000),
//           receiveTimeout: Duration(microseconds: 6000),
//           sendTimeout: Duration(microseconds: 6000),
//     )..interceptors.add(
//         LogInterceptor(
//           responseBody: true,
//           requestBody: true,
//         ),
//       );
//   }

//   static Future<Response?> postData(
//     BuildContext context, {
//     required String url,
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? query,
//     String? token,
//     bool loading = false,
//     bool isForm = false,
//     void Function(int, int)? onSendProgress,
//   }) async {
//     mydio.options.headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//     try {
//       if (loading) {
//         MyLoading.show(context);
//       }
//       final response = await mydio.post(url,
//           onSendProgress: onSendProgress,
//           queryParameters: query,
//           data: isForm ? FormData.fromMap(body ?? {}) : body);
//       if (loading) {
//         MyLoading.dismis(context);
//       }
//       return response;
//     } on DioError catch (e) {
//       getDioError(e: e, context: context);
//     }
//   }

//   static Future<Response?> putData(
//     BuildContext context, {
//     required String url,
//     Map<String, dynamic>? body,
//     Map<String, dynamic>? query,
//     String? token,
//     bool loading = false,
//     bool isForm = false,
//   }) async {
//     mydio.options.headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };
//     try {
//       if (loading) {
//         MyLoading.show(context);
//       }
//       final response = await mydio.put(url,
//           queryParameters: query,
//           data: isForm ? FormData.fromMap(body ?? {}) : body);
//       if (loading) {
//         MyLoading.dismis(context);
//       }
//       return response;
//     } on DioError catch (e) {
//       getDioError(e: e, context: context);
//     } catch (e) {
//       return null;
//     }
//   }

//   static Future<Response?> deleteData(
//     BuildContext context, {
//     required String url,
//     Map<String, dynamic>? query,
//     String? token,
//     bool loading = false,
//   }) async {
//     mydio.options.headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     try {
//       if (loading) {
//         MyLoading.show(context);
//       }
//       final response = await mydio.delete(url, queryParameters: query);
//       if (loading) {
//         MyLoading.dismis(context);
//       }
//       return response;
//     } on DioError catch (e) {
//       getDioError(e: e, context: context);
//     }
//   }

//   static Future<Response?> getData(
//     BuildContext context, {
//     required String url,
//     Map<String, dynamic>? query,
//     String? token,
//     String? gender,
//     bool loading = false,
//   }) async {
//     mydio.options.headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     };

//     try {
//       if (loading) {
//         MyLoading.show(context);
//       }
//       final response = await mydio.get(url, queryParameters: query);
//       if (loading) {
//         MyLoading.dismis(context);
//       }
//       return response;
//     } on DioError catch (e) {
//       getDioError(e: e, context: context);
//     } catch (e) {
//       return null;
//     }
//   }

//   static getDioError({required DioError e, required BuildContext context}) {
//     log("---------------autherrr");
//     MyLoading.dismis(context);

//     if (DioErrorType.receiveTimeout == e.type ||
//         DioErrorType.connectTimeout == e.type) {
//       OverLays.snack(context,
//           text: "Connetion timeout", state: SnakState.failed);
//       log('case 1');
//       log('Server is not reachable. Please verify your internet connection and try again');
//     } else if (DioErrorType.response == e.type) {
//       log('case 2');
//       log('Server reachable. Error in resposne');
//       OverLays.snack(context,
//           text: e.response?.data["message"] ?? "لا يمكن الوصول للسيرفير",
//           state: SnakState.failed);

//       log("hello im errroe");
//       if (e.response!.statusCode == 401) {
//         Utiles.removeToken();
//         Navigator.pushReplacementNamed(context, Routes.loginScreen);
//         OverLays.snack(context,
//             text: e.response!.data["message"], state: SnakState.failed);
//       }
//     } else if (DioErrorType.other == e.type) {
//       if (e.message.contains('SocketException')) {
//         log('Network error');
//         log('case 3');
//         OverLays.snack(context, text: "No Network", state: SnakState.failed);
//       }
//     } else {
//       // show snak server error

//       log('case 4');
//       log('Problem connecting to the server. Please try again.');
//     }
//     return null;
//   }
// }
