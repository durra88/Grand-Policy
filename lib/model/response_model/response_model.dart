import 'dart:developer';

class ResponseModel {
  bool status;
  String message;
  dynamic data;

  ResponseModel({this.message = "", this.status = false});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    var model = ResponseModel();
    model.status = json["status"];
    model.message = json["messege"] as String;
    model.data = json["data"];
    return model;
  }

  factory ResponseModel.fromMap(Map<String, dynamic> json) {
    var model = ResponseModel();
    model.status = json["status"];
    model.message = json["messege"] as String;
    model.data = json["data"];
    log(model.toString());
    return model;
  }

  bool get isValid => status == true && data != null;

  @override
  String toString() {
    return " $status, $message $data";
  }

  bool get isSuccess => status == true && status == 200;
}
