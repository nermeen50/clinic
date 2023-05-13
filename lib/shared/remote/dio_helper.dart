import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doctor_application/common/pref_manager.dart';

class DioHelper {
  static Dio? dio;
  //This object from Dio is the one that'll make me deal with APIs
  // But it's still empty

  //Create dio object and fill it by calling it in main every time app runs
  static Future<Map<String, String>> headers() async {
    var mHeaders = {
      'Content-Type': 'application/json',
    };

    var token = await PreferenceManager.getInstance()!.getString('token');
    if (token != '') {
      mHeaders['Authorization'] = "$token";
    }
    return mHeaders;
  }

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://160.20.146.238/', //   API
      receiveDataWhenStatusError: true,
    ));
  }

  //HTTP GET METHOD : Retrieving data from a server.
  static Future<Response> getData({
    required endPoint,
    Map<String, dynamic>? query,
    //Headers
    String lang = 'en',
    String? token,
  }) async {
    // Path is the method url from api link

    //Review comment in post
    dio!.options.headers = await headers();
    Response response = await dio!.get(endPoint, queryParameters: query);
    return jsonDecode(response.data);
  }

  //HTTP POST METHOD  - To send data to api
  static Future<Map<String, dynamic>> postData({
    required endPoint,
    required data,
    Map<String, dynamic>? query,
    //Headers
    String lang = 'en',
    String? token,
  }) async {
    //When we want to post data we may need to send headers .. This is how to do it
    // lang can be changed so is token, that's why we didn't put them in BaseOptions above
    // like 'Application-Content'

    dio!.options.headers = await headers();
    Response response =
        await dio!.post(endPoint, data: data, queryParameters: query);
    return jsonDecode(response.data);
  }
}
