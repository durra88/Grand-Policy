import 'dart:developer';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class VacationServices {
  //?------------------------------------------------------lget vacation

  Future<ResponseModel> getVocation() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("vacation", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //log("___all vacation ${response.toString()}");
    return response;
  }

  // ignore: non_constant_identifier_names
  Future<ResponseModel> approveVocationRequest(String sNo) async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("leaverequests/approve?sNo=$sNo", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___approve ${response.toString()}");
    return response;
  }

  // ignore: non_constant_identifier_names
  Future<ResponseModel> rejectVocationRequest(String sNo) async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("leaverequests/reject?sNo=$sNo", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___Reject ${response.toString()}");
    return response;
  }

  Future<ResponseModel> getVocationTitlement() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("vacation/vacationentitlement", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___vacation  titlement${response.toString()}");
    return response;
  }

//?------------------------------------------------------leave type
  Future<ResponseModel> getLeaveType() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("mastertable/leavetype", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //  log("___vacation  titlement${response.toString()}");
    return response;
  }
  //!1--------------------------------------------------------=--------post  data

  Future<ResponseModel> sendVacationRequest(
      {required Map<String, dynamic>? data}) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("vacation",
        isAuth: true, methodType: 'post', bodyData: data);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___**send  vacation data request${response.data.toString()}**");
    return response;
  }

  Future<ResponseModel> getHolidayList(String from, String to) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "mastertable/holidaylist?dateFrom=$from&dateTo=$to",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___LeaveHistories response${response.toString()}");
    return response;
  }
}
