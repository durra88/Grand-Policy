import 'dart:developer';
import 'package:GrandPolicy/controller/document_controller/base_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import '../../model/document_model/document_model.dart';
import '../../model/exuse_during_duty_model/excuse_during_duty_model.dart';
import '../../model/exuse_during_duty_model/excuse_request.dart';
import '../../model/masterTable/master_table_model.dart';
import '../../model/response_model/response_model.dart';
import '../../services/excuse_duty_services/excuse_services.dart';

class ExcuseDuringDutyController extends GetxController {
  final excuseModel = <ExcuseModel>[].obs;
  final canceledExcuse = ExcuseModel().obs;

  var excuseResponse = ExcuseModel().obs;
  // ignore: non_constant_identifier_names
  final HrEmailModel = <MasterTableModel>[].obs;
  final excuseTypeModel = <MasterTableModel>[].obs;
  final ExcuseServices _excuseServices = ExcuseServices();
  var excuse = ExcuseRequest().obs;
  var selectedHRManger = "".obs;
  var selectedExcuseType = "".obs;
  var numOfHours = "".obs;
  var dateFrom = "".obs;
  var priodFrom = TextEditingController().obs;
  var priodTo = TextEditingController().obs;
  var informTo = <String>[].obs;
  var clickedBtn = false.obs;
  var loader = true.obs;
  RxBool isValideDate = false.obs;

  var dateController = TextEditingController().obs;
  var dateToController = TextEditingController().obs;

  var excuseKey = GlobalKey<FormState>().obs;
  final leaveReason = TextEditingController().obs;
  //!document

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
    fetchExcuse();
    fetchFromExcuse();
    fetchHrManger();
    fetchExcuseType();
    super.onInit();
  }

  void setSelectedExcuseType(String value) {
    selectedExcuseType.value = value;
    log(selectedExcuseType.toString());
  }

  void setSelectedHRManger(String value) {
    selectedHRManger.value = value;
    log(selectedHRManger.toString());
  }

  Future<dynamic> cancelExcuse(String sNo) async {
    ResponseModel responseModel = await _excuseServices.cancelExcuse(sNo);
    if (responseModel.data == null) return responseModel.message;
    canceledExcuse.value = ExcuseModel.fromJson(responseModel.data!);
    log("________________excuse${responseModel.toString()}");
  }

  //?-----------------------------------------------------

  Future<dynamic> fetchExcuse() async {
    loader.value = true;
    ResponseModel responseModel = await _excuseServices.getExcuse();
    // log("________________excuse${responseModel.toString()}");
    excuseModel.value = ExcuseModel.toListOfModel(responseModel.data!);
    loader.value = false;
  }

  //?---------------------------------------------excuse from
  var selectedExcuseFrom = "Rayan".obs;
  var excuseFromModel = <MasterTableModel>[].obs;

  Future<dynamic> fetchFromExcuse() async {
    ResponseModel responseModel = await _excuseServices.getFromExcuse();
    log("________________excuseFrom${responseModel.toString()}");
    excuseFromModel.value = MasterTableModel.toListOfModel(responseModel.data!);
  }

  //?---------------------------------------------selected nexcuse from

  void setSelectedExcuseFrom(String value) {
    selectedExcuseFrom.value = value;
    log(selectedExcuseFrom.toString());
  }

  Future<dynamic> fetchHrManger() async {
    ResponseModel responseModel = await _excuseServices.getHrMangerEmail();
    log("________________excuseFrom${responseModel.toString()}");
    HrEmailModel.value = MasterTableModel.toListOfModel(responseModel.data!);
  }

  Future<dynamic> fetchExcuseType() async {
    ResponseModel responseModel = await _excuseServices.getExcuseType();
    log("________________excuseFrom${responseModel.toString()}");
    excuseTypeModel.value = MasterTableModel.toListOfModel(responseModel.data!);
  }

  int daysBetween(DateTime from, DateTime to) {
    var start =
        DateTime(from.year, from.month, from.day, from.hour, from.minute);

    return to.difference(from).inHours;
  }

  Future<dynamic> fetchBackToworkDate(int sNo) async {
    ResponseModel responseModel = await _excuseServices.getBackToWorkDate(sNo);
    log("________________backtoworkdate${responseModel.toString()}");
    excuseResponse.value = ExcuseModel.fromJson(responseModel.data!);
  }

//send excuse
  //?----------------------------------------------Post data
  Future<bool> sendExcuseRequest() async {
    if (result.isNotEmpty) {
      filesModel.value =
          await BaseController().getBase64FormateFile(result[0].files);
    }
    ResponseModel responseModel = await _excuseServices.sendExcuse(data: {
      "excuseFrom": selectedExcuseFrom.value,
      "execuseType": selectedExcuseType.value,
      "excuseCCEmaiTo": "",
      "periodFrom": dateFrom.value + "T" + priodFrom.value.text,
      "periodTo": dateFrom.value + "T" + priodTo.value.text,
      "noOfHours": numOfHours.value,
      "leaveReson": leaveReason.value.text,
      "informTo": informTo.value,
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

  //?---------------------------------------------validation
  bool checkValidation() {
    // isValideDate.value = true;
    final isVisitValide = excuseKey.value.currentState!.validate();
    if (isVisitValide) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    Get.delete<ExcuseDuringDutyController>();
    super.dispose();
  }
}
