// ignore: file_names
import 'dart:convert';
import 'dart:developer';
import 'package:GrandPolicy/model/loanHistories_model/loan_post_model.dart';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class LoanServices {
  Future<ResponseModel> getLoanHistoryServices() async {
    ResponseModel response = ResponseModel();
    final apiResponse = HttpHelper.httpRequest("loans", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //  log("___loan response${response.toString()}");
    return response;
  }

  //?----------------------------------------------GetloanDasboard data
  Future<ResponseModel> getLoanDashBoardHistory() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("loans/loansdashboard", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    // log("___Loan dashboard response${response.toString()}");
    return response;
  }

  //?----------------------------------------------GetloanTypedata
  Future<ResponseModel> getLoanType() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("mastertable/loansleavetype", isAuth: true);
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    //log("___Loantype response${response.toString()}");
    return response;
  }

  //?----------------------------------------------Post data

  Future<ResponseModel> sendLoanRequestService(
      List<LoanPostModel> loanModel) async {
    ResponseModel response = ResponseModel();

    log("__________________overtime send data${jsonEncode(loanModel)}");
    //EasyLoading.show(status: 'loading...');
    final apiResponse = HttpHelper.httpRequest("loans/insertloans",
        bodyData: loanModel.toList(), isAuth: true, methodType: 'post');
    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
      log("Loan data send response${res.data}");
    }).catchError((e) {
      log("Expention......");

      log(e.toString());
    });

    // EasyLoading.dismiss();

    return response;
  }
}
