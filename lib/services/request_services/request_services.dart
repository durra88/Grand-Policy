import 'dart:developer';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class RequestServices {
  //?------------------------------------get Request History
  Future<ResponseModel> getRequestHistory() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("requestservices", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //  log("___Request Services histories response${response.toString()}");
    return response;
  }

  //?------------------------------------get Request type
  Future<ResponseModel> getRequestType() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("mastertable/itemrequest", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    // log("___Request Type response${response.toString()}");
    return response;
  }

  //?------------------------------------get Departement
  Future<ResponseModel> getDepartement() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("mastertable/department", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    // log("___get Departementresponse${response.toString()}");
    return response;
  }

  //?------------------------------------getEmailing To
  Future<ResponseModel> getEmailingTo(String departement) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "mastertable/emailingto?departments=$departement",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //log("___getEmailing To response${response.toString()}");
    return response;
  }

  //?------------------------------------get Inform to
  Future<ResponseModel> getEnformTo() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("mastertable/informto", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //  log("___get Inform to response${response.toString()}");
    return response;
  }

  //?------------------------------------get document
  Future<ResponseModel> getDocument(int id) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "requestservices/documents?id=$id",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    // log("___get document${response.toString()}");
    return response;
  }
//!1--------------------------------------------------------------------post  data

  Future<ResponseModel> sendRequestServices(
      {required Map<String, dynamic>? data}) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("requestservices",
        isAuth: true, methodType: 'post', bodyData: data);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___send data request services${response.data.toString()}");
    return response;
  }

  Future<ResponseModel> cancelRequestServices(String sNo) async {
    // final RequestServicesontroller controller = Get.find();

    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("requestservices/cancel?sNo=$sNo", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___send data request services${response.message.toString()}");
    //  controller.update();
    return response;
  }
}
