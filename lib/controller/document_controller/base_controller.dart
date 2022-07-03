import 'dart:convert';
import 'dart:io';

import 'package:GrandPolicy/model/document_model/document_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

enum ViewState { idle, retrived, busy, error }

class BaseController extends GetxController {
  Future<List<DocumentModel>> getBase64FormateFile(
      List<PlatformFile> imageBytes) async {
    List<String> img64 = [];
    var filesModel = <DocumentModel>[];
    for (int i = 0; i < imageBytes.length; i++) {
      var bytes = File(imageBytes[i].path!).readAsBytesSync();

      filesModel.add(DocumentModel(
          base64String: base64Encode(bytes),
          fileName: imageBytes[i].name,
          extension: imageBytes[i].extension,
          url: ""));

      img64.add(base64Encode(bytes));
    }

    return filesModel;
  }

  @override
  void dispose() {
    Get.delete<BaseController>();
    super.dispose();
  }
}
