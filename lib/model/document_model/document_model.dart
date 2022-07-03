import 'package:get/get.dart';

import '../../controller/document_controller/base_controller.dart';

class DocumentModel {
  String? url;
  String? fileName;
  String? extension;
  String? base64String;
  var path = "".obs;
  final downloadState = ViewState.idle.obs;

  DocumentModel({this.url, this.fileName, this.extension, this.base64String});

  DocumentModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    fileName = json['fileName'];
    extension = json['extension'];
    base64String = json['base64String'];
  }
  static List<DocumentModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => DocumentModel.fromJson(data)).toList();
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

class DownloadDecuments {
  String? url;
  String? fileName;
  String? extension;
  String? base64String;

  DownloadDecuments(
      {this.url, this.fileName, this.extension, this.base64String});

  DownloadDecuments.fromJson(Map<String, dynamic> json) {
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
