import '../../model/exuse_during_duty_model/excuse_request.dart';

class PostRequestServicesModel {
  String? requestType;
  String? requestDetails;
  String? requestDepartment;
  String? maritalStatus;
  List<String>? informTo;
  List<Files>? files;

  PostRequestServicesModel(
      {this.requestType,
      this.requestDetails,
      this.requestDepartment,
      this.maritalStatus,
      this.informTo,
      this.files});

  PostRequestServicesModel.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    requestDetails = json['requestDetails'];
    requestDepartment = json['requestDepartment'];
    maritalStatus = json['maritalStatus'];
    informTo = json['informTo'].cast<String>();
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(Files.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestType'] = requestType;
    data['requestDetails'] = requestDetails;
    data['requestDepartment'] = requestDepartment;
    data['maritalStatus'] = maritalStatus;
    data['informTo'] = informTo;
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
