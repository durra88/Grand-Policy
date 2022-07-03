import '../exuse_during_duty_model/excuse_request.dart';

class RequestServicesModel {
  int? sNo;
  String? status;
  String? requestType;
  String? requestDetails;
  String? requestDepartment;
  int? empID;
  String? empName;
  String? createdBy;
  String? createdOn;
  String? hrReplyInfo;
  String? hrReplyType;
  String? hrReplyBy;
  String? hrReplyOn;
  List<Files>? files;

  RequestServicesModel(
      {this.sNo,
      this.status,
      this.requestType,
      this.requestDetails,
      this.requestDepartment,
      this.empID,
      this.empName,
      this.createdBy,
      this.createdOn,
      this.hrReplyInfo,
      this.hrReplyType,
      this.hrReplyBy,
      this.hrReplyOn,
      this.files});

  RequestServicesModel.fromJson(Map<String, dynamic> json) {
    sNo = json['sNo'] ?? "";
    status = json['status'] ?? "";
    requestType = json['requestType'] ?? "";
    requestDetails = json['requestDetails'] ?? "";
    requestDepartment = json['requestDepartment'] ?? "";
    empID = json['empID'] ?? "";
    empName = json['empName'] ?? "";
    createdBy = json['createdBy'] ?? "";
    createdOn = json['createdOn'] ?? "";
    hrReplyInfo = json['hrReplyInfo'] ?? "";
    hrReplyType = json['hrReplyType'] ?? "";
    hrReplyBy = json['hrReplyBy'] ?? "";
    hrReplyOn = json['hrReplyOn'] ?? "";
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files!.add(Files.fromJson(v));
      });
    }
  }
  static List<RequestServicesModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => RequestServicesModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //  data['status'] = status;
    data['requestType'] = requestType;
    data['requestDetails'] = requestDetails;
    data['requestDepartment'] = requestDepartment;
    data['empID'] = empID;
    data['empName'] = empName;
    data['createdBy'] = createdBy;
    data['createdOn'] = createdOn;
    data['hrReplyInfo'] = hrReplyInfo;
    data['hrReplyType'] = hrReplyType;
    data['hrReplyBy'] = hrReplyBy;
    data['hrReplyOn'] = hrReplyOn;
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
