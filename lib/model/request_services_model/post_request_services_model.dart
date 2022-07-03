import '../exuse_during_duty_model/excuse_request.dart';

class PostRequestServicesModel {
  String? requestType;
  String? requestDetails;
  String? requestDepartment;
  String? maritalStatus;
  String? createdBy;
  String? createdOn;
  String? hrReplyOn;
  List<String>? informTo;
  List<Files>? files;

  PostRequestServicesModel(
      {this.requestType,
      this.requestDetails,
      this.requestDepartment,
      this.maritalStatus,
      this.createdBy,
      this.createdOn,
      this.hrReplyOn,
      this.informTo,
      this.files});

  PostRequestServicesModel.fromJson(Map<String, dynamic> json) {
    requestType = json['requestType'];
    requestDetails = json['requestDetails'];
    requestDepartment = json['requestDepartment'];
    maritalStatus = json['maritalStatus'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    hrReplyOn = json['hrReplyOn'];
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
    data['createdBy'] = createdBy;
    data['createdOn'] = createdOn;
    data['hrReplyOn'] = hrReplyOn;
    data['informTo'] = informTo;
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
