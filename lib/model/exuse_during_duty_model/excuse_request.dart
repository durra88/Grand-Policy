import 'package:GrandPolicy/model/document_model/document_model.dart';

class ExcuseRequest {
  String? excuseFrom;
  String? execuseType;
  String? excuseCCEmaiTo;
  String? periodFrom;
  String? periodTo;
  String? noOfHours;
  String? leaveReson;
  List<String>? informTo;
  List<DocumentModel>? files;

  ExcuseRequest(
      {this.excuseFrom,
      this.execuseType,
      this.excuseCCEmaiTo,
      this.periodFrom,
      this.periodTo,
      this.noOfHours,
      this.leaveReson,
      this.informTo,
      this.files});

  ExcuseRequest.fromJson(Map<String, dynamic> json) {
    excuseFrom = json['excuseFrom'];
    execuseType = json['execuseType'];
    excuseCCEmaiTo = json['excuseCCEmaiTo'];
    periodFrom = json['periodFrom'];
    periodTo = json['periodTo'];
    noOfHours = json['noOfHours'];
    leaveReson = json['leaveReson'];
    informTo = json['informTo'].cast<String>();
    if (json['files'] != null) {
      files = <DocumentModel>[];
      json['files'].forEach((v) {
        files!.add(DocumentModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['excuseFrom'] = excuseFrom;
    data['execuseType'] = execuseType;
    data['excuseCCEmaiTo'] = excuseCCEmaiTo;
    data['periodFrom'] = periodFrom;
    data['periodTo'] = periodTo;
    data['noOfHours'] = noOfHours;
    data['leaveReson'] = leaveReson;
    data['informTo'] = informTo;
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Files {
  String? url;
  String? fileName;
  String? extension;
  String? base64String;

  Files({this.url, this.fileName, this.extension, this.base64String});

  Files.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    fileName = json['fileName'];
    extension = json['extension'];
    base64String = json['base64String'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['fileName'] = fileName;
    data['extension'] = extension;
    data['base64String'] = base64String;
    return data;
  }
}
