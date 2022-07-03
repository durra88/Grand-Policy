import 'dart:developer';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/utils/http/http_helper.dart';

class DeductionServices {
  Future<ResponseModel> getDeductionHistory() async {
    ResponseModel response = ResponseModel();
    final apiResponse =
        HttpHelper.httpRequest("loans/deductions", isAuth: true);

    await apiResponse.then((res) async {
      response = ResponseModel.fromJson(res.data);
    }).catchError((error) {
      log(error.toString());
    });
    // log("___deduction response${response.toString()}");
    return response;
  }
}
