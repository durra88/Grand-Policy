import 'dart:developer';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class OvertimeServices {
  //?----------------------------------------------Get data
  Future<ResponseModel> getOvertimeHistory() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("overtime", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //  log("___overtime response${response.toString()}");
    return response;
  }

  //?----------------------------------------------Get ovrtTime Dasboard data
  Future<ResponseModel> getOvertimeDashBoardHistory() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("overtime/overtimedashboard", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___overtime dashboard response${response.toString()}");
    return response;
  }

  //?----------------------------------------------Post data

  Future<ResponseModel> sendOvertimeRequestService(
      {required Map<String, dynamic>? data}) async {
    ResponseModel response = ResponseModel();

    // log("__________________overtime send data${jsonEncode(data)}");
    //EasyLoading.show(status: 'loading...');
    final apiResponse = HttpHelper.httpRequest("overtime",
        bodyData: data, isAuth: true, methodType: 'post');
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
      log("overtime data send response${res.data}");
    }).catchError((e) {
      log("Expention......");

      log(e.toString());
    });

    // EasyLoading.dismiss();

    return response;
  }
}
