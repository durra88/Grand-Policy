import 'dart:developer';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class ExcuseServices {
  Future<ResponseModel> getExcuse() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("excuseduring", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //   log("___Excuse response data ${response.data.toString()}");
    return response;
  }

//?--------------------------------------back to work date
  Future<ResponseModel> getBackToWorkDate(int sNo) async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest(
        "excuseduring/backtowork?sNo=$sNo",
        isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___Get date backtowork ${response.data.toString()}");
    return response;
  }

  Future<ResponseModel> getFromExcuse() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("mastertable/excusefrom", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //   log("___Excuse response data ${response.data.toString()}");
    return response;
  }

  Future<ResponseModel> getHrMangerEmail() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("mastertable/hrmanger", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //   log("___Excuse response data ${response.data.toString()}");
    return response;
  }

  Future<ResponseModel> getExcuseType() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("mastertable/excusetype", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //   log("___Excuse response data ${response.data.toString()}");
    return response;
  }

//    Future<ResponseModel> sendExcuse(ExcuseRequest excuseRequest) async {
//     ResponseModel response = ResponseModel();
//     final apiResponse =
//         HttpHelper.httpRequest("request/excuserequest", isAuth: true,methodType: 'post',bodyData: excuseRequest.toJson() );
//     await apiResponse.then((res) async {
//       response = ResponseModel.fromJson(res.data);
//     }).catchError((error) {
//       log(error.toString());
//     });
//  //   log("___Excuse response data ${response.data.toString()}");
//     return response;
//   }
  //!---------------------------------------------------------------------send Excuse

  Future<ResponseModel> sendExcuse(
      {required Map<String, dynamic>? data}) async {
    ResponseModel response = ResponseModel();

    // log("__________________overtime send data${jsonEncode(data)}");
    //EasyLoading.show(status: 'loading...');
    final apiResponse = HttpHelper.httpRequest("excuseduring",
        bodyData: data, isAuth: true, methodType: 'post');
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
      log("SEND**Excuse data send response${res.data}");
    }).catchError((e) {
      log("Expention......");

      log(e.toString());
    });

    // EasyLoading.dismiss();

    return response;
  }

  Future<ResponseModel> cancelExcuse(String sNo) async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("excuseduring/cancel?sNo=$sNo", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    log("___cancel excuse   ${response.data.toString()}");
    return response;
  }
}
