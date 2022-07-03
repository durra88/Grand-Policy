import 'dart:developer';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class ProfileServices {
  Future<ResponseModel> getProfileInfo() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
      "staffProfile",
      isAuth: true,
    );
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    return response;
  }

  //?----------------------------------------edit profile

  Future<ResponseModel> editProfileInfo(
      {required Map<String, dynamic>? data}) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "staffProfile/medicalinformation",
        isAuth: true,
        methodType: 'post',
        bodyData: data);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___edit profile${response.data.toString()}");
    return response;
  }

  //?---------------------------------------getBloodType
  Future<ResponseModel> getBloodType() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
      "mastertable/bloodtype",
      isAuth: true,
    );
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___blood type${response.toString()}");

    return response;
  }
}
