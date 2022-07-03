import 'dart:developer';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class DocumentServices {
  Future<ResponseModel> getDocument() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("documents", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___document response${response.data.toString()}");
    return response;
  }

//!request services
  Future<ResponseModel> getRequestServicesDocument(int id) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "requestservices/documents?id=$id",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___ request services document response${response.data.toString()}");
    return response;
  }

//!excuse document
  Future<ResponseModel> getExcuseDocument(int id) async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("excuseduring/documents?id=$id", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___ excuse document response${response.data.toString()}");
    return response;
  }

  //! vacation document
  Future<ResponseModel> getVacationDocument(int id) async {
    //***********************************DOWNLOAD****** */

    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("vacation/documents?id=$id", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___ vacation documentt response${response.data.toString()}");
    return response;
  }

//!***************************************** */
  //?----------------------------------------------------------doanload
  Future<ResponseModel> downloadDocument(String url) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "documents/downloaddocument?url=$url",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___download response${response.data.toString()}");
    return response;
  }

  Future<ResponseModel> downloadDocumentServices(String name) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "staffProfile/downloaddocument?fileName=$name",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___download response${response.data.toString()}");
    return response;
  }

  //!request services
  //?----------------------------------------------------------doanload
  Future<ResponseModel> downloadRequestSerDocumentServices(String url) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "staffProfile/downloadservicedocument?url=$url",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___download response${response.data.toString()}");
    return response;
  }

  //!vacation
  //?----------------------------------------------------------doanload
  Future<ResponseModel> downloadvacationDocumentServices(String url) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "staffProfile/downloadservicedocument?url=$url",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___download response${response.data.toString()}");
    return response;
  }

  //!excuse
  //?----------------------------------------------------------doanload
  Future<ResponseModel> downloadExcuseDocumentServices(String url) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "staffProfile/downloadvacationsdocument?url=$url",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___download response${response.data.toString()}");
    return response;
  }
}
