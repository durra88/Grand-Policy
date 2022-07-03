import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:GrandPolicy/controller/document_controller/base_controller.dart';
import 'package:GrandPolicy/model/document_model/document_model.dart';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/services/document_services/document_services.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DocumentController extends GetxController {
  final documentModel = <DocumentModel>[].obs;
  var downloadDocumentModel = DocumentModel().obs;

  final DocumentServices _documentServices = DocumentServices();
  var documentLoader = true.obs;

  @override
  void onInit() {
    fetchDocument();

    super.onInit();
  }

//!general document
  Future<dynamic> fetchDocument() async {
    documentLoader.value = true;
    ResponseModel responseModel = await _documentServices.getDocument();
    log("________________general document${responseModel.toString()}");
    documentModel.value = DocumentModel.toListOfModel(responseModel.data!);
    documentLoader.value = false;
  }

  //!request services  document
  Future<dynamic> fetchRequestServicesDocument(int id) async {
    documentLoader.value = true;
    ResponseModel responseModel =
        await _documentServices.getRequestServicesDocument(id);
    log("________________services document${responseModel.toString()}");
    documentModel.value = DocumentModel.toListOfModel(responseModel.data!);
    documentLoader.value = false;
  }

  //!excuse document
  Future<dynamic> fetchExcuseDocument(int id) async {
    documentLoader.value = true;
    ResponseModel responseModel = await _documentServices.getExcuseDocument(id);
    log("________________ excuse document${responseModel.toString()}");
    documentModel.value = DocumentModel.toListOfModel(responseModel.data!);
    documentLoader.value = false;
  }

  //!excuse document
  Future<dynamic> fetchVacationDocument(int id) async {
    documentLoader.value = true;
    ResponseModel responseModel =
        await _documentServices.getVacationDocument(id);
    log("________________document${responseModel.toString()}");
    documentModel.value = DocumentModel.toListOfModel(responseModel.data!);
    documentLoader.value = false;
  }

  //?---------------------------------------------------------------------------
  //?-------------------------------------------------------- download document [file name]
  //?--------------------------------------------------------------------------
  var downloadState = ViewState.idle.obs;
  Directory? dir;
  Future<String> downloadFile(String? fileName) async {
    downloadState.value = ViewState.busy;

    String _localPath = (await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS));
    String filePath = _localPath + "/" + fileName!.trim();

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    ResponseModel responseModel =
        await _documentServices.downloadDocumentServices(fileName);

    downloadDocumentModel.value = DocumentModel.fromJson(responseModel.data!);

    final encodedStr = downloadDocumentModel.value.base64String;
    Uint8List bytes = base64.decode(encodedStr!);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$_localPath/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        downloadDocumentModel.value.extension!);
    await file.writeAsBytes(bytes);
    // File("$_localPath/" ).existsSync();
    if (await File(_localPath).exists()) {
      log("File exists");
    } else {
      log("File don't exists");
    }
    log("_________________${file.path}");

    // ignore: deprecated_member_use
    Get.showSnackbar(GetBar(
      icon: const Icon(
        Icons.file_download_done,
        size: 26,
        color: Colors.grey,
      ),
      messageText: Text(
        "path: ${file.path}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
      ),
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
      duration: const Duration(milliseconds: 1800),
    ));

    downloadState.value = ViewState.retrived;

    return file.path;
  }

  //?---------------------------------------------------------------------------
  //?-------------------------------------------------------- download document [url]
  //?--------------------------------------------------------------------------
  Future<String> downloadFileWithUrl(String? url) async {
    downloadState.value = ViewState.busy;

    String _localPath = (await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS));
    String filePath = _localPath + "/" + url!.trim();

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    ResponseModel responseModel = await _documentServices.downloadDocument(url);

    downloadDocumentModel.value = DocumentModel.fromJson(responseModel.data!);

    final encodedStr = downloadDocumentModel.value.base64String;
    Uint8List bytes = base64.decode(encodedStr!);
    //String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File("$_localPath/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        downloadDocumentModel.value.extension!);
    await file.writeAsBytes(bytes);
    // File("$_localPath/" ).existsSync();
    if (await File(_localPath).exists()) {
      log("File exists");
    } else {
      log("File don't exists");
    }
    log("_________________${file.path}");

    // ignore: deprecated_member_use
    Get.showSnackbar(GetBar(
      icon: const Icon(
        Icons.file_download_done,
        size: 26,
        color: Colors.grey,
      ),
      messageText: Text(
        "path: ${file.path}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
      ),
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
      duration: const Duration(milliseconds: 1800),
    ));

    downloadState.value = ViewState.retrived;

    return file.path;
  }

  @override
  void dispose() {
    Get.delete<DocumentController>();
    super.dispose();
  }
}
