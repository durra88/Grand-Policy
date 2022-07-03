import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../model/response_model/response_model.dart';
import '../../utils/http/http_helper.dart';

class LoginAuthService {
  Future<ResponseModel> getLogin(
      {@required Map<String, dynamic>? loginData}) async {
    ResponseModel response = ResponseModel();
   // EasyLoading.show(status: 'loading...');
    final apiResponse = HttpHelper.httpRequest("users/login",
        bodyData: loginData, methodType: 'post');
    await apiResponse.then((Response res) async {
      response = ResponseModel.fromJson(res.data);
      log("response**********************************************************************${res.data}");
    }).catchError((e) {
      log(e.toString());
    });
    return response;
  }
}
