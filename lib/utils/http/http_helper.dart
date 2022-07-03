import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:get/get.dart' hide Response hide FormData;
import '../../controller/internet_connection/connectivity_controller.dart';
import '../storage/storage_helper.dart';
import '../storage/storage_keys.dart';
import '../http/server_info.dart';

class HttpHelper {
  var connectivityController = Get.put(ConnectivityController());
  static Dio? _client;

  static Future<Dio> _getInstance(
      // ignore: unused_element
      {bool? isAuth, bool? withCookie, bool? withToken}) async {
    _client ??= Dio();

    if (!isAuth!) {
      _client!.options.headers = {
        "Content-Type": "application/json",
      };
      return _client!;
    }
    // log("is auth api .......");
    final storageToken = await StorageHelper.get(StorageKeys.token);
    var headers = {'Authorization': 'Bearer $storageToken'};
    if (withToken == true) headers = {...headers, 'Bearer': storageToken!};
    _client!.options.headers = headers;
    log(headers.toString());
    _client!.options.connectTimeout = 5000000; //5s
    return _client!;
  }

  static Future<Response> httpRequest(
    String newUrl, {
    bool isAuth = false,
    bool withToken = true,
    String methodType = "get",
    dynamic bodyData,
  }) async {
    final String url = "$baseUrl$newUrl";
    log(url);
    final instance = await _getInstance(isAuth: isAuth, withToken: withToken);
    try {
      // if( connectivityController.connectionStatus.value==0){

      // }

      switch (methodType) {
        case "put":
          return instance.put(url, data: FormData.fromMap(bodyData));
        case "post":
          log("in post method ...${instance.options.headers.values}");
          log("in post data ...${jsonEncode(bodyData)}");
          return instance.post(url, data: jsonEncode(bodyData));
      }
      //log("in get method ...${instance.options.headers.values}");
        log("in get body data ***************** ...${jsonEncode(bodyData)}");
      return instance.get(url, queryParameters: bodyData);
    } on SocketException catch (e) {
      log('Network Exception: ${e.toString()}');
    }
    return instance.get(url);
  }
}
