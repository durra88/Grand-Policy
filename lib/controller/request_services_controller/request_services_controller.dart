import 'dart:developer';

import 'package:GrandPolicy/model/request_services_model/departement_model.dart';
import 'package:GrandPolicy/model/request_services_model/emailing_model.dart';
import 'package:GrandPolicy/model/request_services_model/inform_model.dart';
import 'package:GrandPolicy/model/request_services_model/post_request_services_model.dart';
import 'package:GrandPolicy/model/request_services_model/request_services_model.dart';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import '../../model/document_model/document_model.dart';
import '../../model/request_services_model/request_type_model.dart';
import '../../services/request_services/request_services.dart';
import '../document_controller/base_controller.dart';

class RequestServicesontroller extends GetxController {
  final requestServicesModel = <RequestServicesModel>[].obs;
  final requestServisesPostModel = PostRequestServicesModel().obs;
  final RequestServices _requestServices = RequestServices();
  final notes = TextEditingController().obs;
  var requestServicesKey = GlobalKey<FormState>().obs;
  var canceledReq = RequestServicesModel().obs;
  var clickedBtn = false.obs;
  var loadingData = true.obs;

  //!document
  bool isRequestServiseValidate() {
    final isVisitValide = requestServicesKey.value.currentState!.validate();
    if (isVisitValide) {
      return true;
    } else {
      return false;
    }
  }

  var fileType = 'MultipleFile'.obs;
  var result = <FilePickerResult>[].obs;
  var file = PlatformFile(name: '', size: 0).obs;
  var files = <DocumentModel>[].obs;
  var filesModel = <DocumentModel>[].obs;

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path.toString());
  }
  //!end of document

  @override
  void onInit() {
    fetchRequestServices();
    fetchRequestType();
    fetchdepartement();
    fetchInformTo();

    super.onInit();
  }

//?-----------------------------------------------------Get Data
//!--fetch all history data
  Future<dynamic> fetchRequestServices() async {
    loadingData.value = true;

    ResponseModel responseModel = await _requestServices.getRequestHistory();
    //log("________________requestServices${responseModel.toString()}");
    requestServicesModel.value =
        RequestServicesModel.toListOfModel(responseModel.data!);
    loadingData.value = false;
  }

  //!--fetch request type
  var selectedRequestType = "".obs;
  var requestTypeModel = <RequestTypeModel>[].obs;
  //?---------------------------------------------requesttype
  Future<dynamic> fetchRequestType() async {
    ResponseModel responseModel = await _requestServices.getRequestType();
    requestTypeModel.value =
        RequestTypeModel.toListOfModel(responseModel.data!);
  }

  //?---------------------------------------------selected requesttype
  void setSelectedRequestType(String value) {
    selectedRequestType.value = value;
    log(selectedRequestType.toString());
  }

  //!--fetch request departement
  var selectedDepartement = "".obs;
  var departementModel = <DepartementModel>[].obs;
  //?---------------------------------------------departement
  Future<dynamic> fetchdepartement() async {
    ResponseModel responseModel = await _requestServices.getDepartement();
    departementModel.value =
        DepartementModel.toListOfModel(responseModel.data!);
    //  log("________________request type to${responseModel.toString()}");
  }

  Future<dynamic> cancelRequest(String sNo) async {
    ResponseModel responseModel =
        await _requestServices.cancelRequestServices(sNo);

    if (responseModel.data == null) return responseModel.message;
    canceledReq.value = RequestServicesModel.fromJson(responseModel.data!);
    log("________________request type to${responseModel.toString()}");
  }

  //?---------------------------------------------selected requesttype
  void setSelectedDepartement(String value) {
    selectedDepartement.value = value;
    log(selectedDepartement.toString());
  }

  //!--fetch request emailing to
  var selectedEmailingTo = "".obs;

  var emailingToModel = <EmailingToModel>[].obs;
  //?---------------------------------------------EmailingTo
  Future<dynamic> fetchEmailingTo(String department) async {
    ResponseModel responseModel =
        await _requestServices.getEmailingTo(department);
    //  log("________________emailing to${responseModel.toString()}");

    emailingToModel.value = EmailingToModel.toListOfModel(responseModel.data!);
    update();
  }

  //?---------------------------------------------selected EmailingTo
  void setSelectedEmailingTo(String value) {
    selectedEmailingTo.value = value;
    update();
  }

  //!--fetch request emailing inform to
  var selectedInformTo = "".obs;
  var selectedListOfInformTo = <String>[].obs;
  var informToModel = <InformToModel>[].obs;

  //?---------------------------------------------inform to
  Future<dynamic> fetchInformTo() async {
    ResponseModel responseModel = await _requestServices.getEnformTo();
    informToModel.value = InformToModel.toListOfModel(responseModel.data!);
    log("________________inform  to${responseModel.toString()}");
  }

  //?---------------------------------------------selected InformTo

  //?-----------------------------------------------------Post Data

  Future<bool> sendRequestServices() async {
    if (result.isNotEmpty) {
      filesModel.value =
          await BaseController().getBase64FormateFile(result[0].files);
      //log( "file after base ${filesModel.toString()}");
    }
    ResponseModel responseModel =
        await _requestServices.sendRequestServices(data: {
      "requestType": selectedRequestType.value,
      "requestDepartment": selectedDepartement.value,
      "requestDetails": notes.value.text,
      "maritalStatus": "",
      "informTo": selectedListOfInformTo,
      "files": result.isNotEmpty
          ? filesModel.map((element) => element.toJson()).toList()
          : []
    });
    if (!responseModel.status) {
      log("* sendExcuse from controller *${responseModel.message}");

      log(responseModel.status.toString());
      return false;
    } else {
      return true;
    }
  }
  //?-----------------------------------------------------Post validation

  bool checkRequestServicesValidation() {
    final isVisitValide = requestServicesKey.value.currentState!.validate();
    if (isVisitValide) {
      return true;
    } else {
      return false;
    }
  }

  //-------------------------------------------------------------------reset
  void restRequestServices() {
    selectedRequestType.value = "";

    selectedDepartement.value = "";

    selectedEmailingTo.value = "";

    selectedListOfInformTo.clear();

    notes.value.text = "";
  }
}
