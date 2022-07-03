import 'dart:developer';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class LeaveHistoriesServices {
  Future<ResponseModel> getLeaveHistory() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("vacation", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___Leave Histories response${response.toString()}");
    return response;
  }

  Future<ResponseModel> cancelVacation(String sNo) async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("vacation/cancel?sNo=$sNo", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___cancel vacation  ${response.data.toString()}");
    return response;
  }
}
