import 'dart:developer';

import 'package:GrandPolicy/model/vocationrequest_model/holiday_list.dart';
import 'package:GrandPolicy/services/vacation_services/all_vocation_histories_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../../model/document_model/document_model.dart';
import '../../model/response_model/response_model.dart';
import '../../model/vocationrequest_model/leave_type_model.dart';
import '../../model/vocationrequest_model/vacationTitlement.dart';
import '../../model/vocationrequest_model/vacation_request_model.dart';
import '../document_controller/base_controller.dart';

class VacationController extends GetxController {
  final vacationModel = <VacationRequestModel>[].obs;
  final RejectAprovedModel = VacationRequestModel().obs;
  final vacationTitlementModel = <VacationTitlementModel>[].obs;
  var vacationRequestKey = GlobalKey<FormState>().obs;
  final holidayList = <HolidayListModel>[].obs;
  var clickedBtn = false.obs;
  var loadingData = true.obs;

  final titlementModelTemp = <VacationTitlementModel>[].obs;

  final VacationServices _vacationServices = VacationServices();
  final leaveReason = TextEditingController().obs;
  final contactDetails = TextEditingController().obs;
  // var vacationrequestKeyKey = GlobalKey<FormState>().obs;

  var vacationRequestFrom = DateTime.now().toString().obs;
  var vacationRequestFromController = TextEditingController().obs;
  var vacationRequestToController = TextEditingController().obs;
  var vacationRequestTo = "".obs;
  var hasEmployee = false.obs;

  var noOfDAYS = 0.obs;
  var isEmployeevisible = false.obs;
  var informTo = <String>[].obs;

  int getTotalHoliday() {
    var total = 0.obs;
    if (holidayList.isNotEmpty) {
      for (int i = 0; i < holidayList.length; i++) {
        total.value = holidayList[i].numOdDays! + total.value;
      }
    }

    return total.value;
  }

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
    fetchVacation();
    fetchVacationTitlement();
    fetchLeaveType();
    super.onInit();
  }

  Future<dynamic> rejectVacation(String sNo) async {
    ResponseModel responseModel =
        await _vacationServices.rejectVocationRequest(sNo);
    //   log("________________vacation${responseModel.toString()}");
    if (responseModel.data == null) return responseModel.message;
    RejectAprovedModel.value =
        VacationRequestModel.fromJson(responseModel.data!);
  }

  Future<dynamic> approveVacation(String sNo) async {
    ResponseModel responseModel =
        await _vacationServices.approveVocationRequest(sNo);
    if (responseModel.data == null) return responseModel.message;
    //   log("________________vacation${responseModel.toString()}");
    RejectAprovedModel.value =
        VacationRequestModel.fromJson(responseModel.data!);
  }

  Future<dynamic> fetchVacation() async {
    loadingData.value = true;
    ResponseModel responseModel = await _vacationServices.getVocation();
    //   log("________________vacation${responseModel.toString()}");
    vacationModel.value =
        VacationRequestModel.toListOfModel(responseModel.data!);
    loadingData.value = false;
  }

  //?-------------------------------------------------titlement
  Future<dynamic> fetchVacationTitlement() async {
    ResponseModel responseModel =
        await _vacationServices.getVocationTitlement();
    log("________________Titlement ${responseModel.toString()}");

    vacationTitlementModel.value =
        VacationTitlementModel.toListOfModel(responseModel.data!);
  }

  //?-------------------------------------------------leave type
  var selectedleaveType = "".obs;
  final leaveTypeModel = <LeaveTypeModel>[].obs;

  Future<dynamic> fetchLeaveType() async {
    ResponseModel responseModel = await _vacationServices.getLeaveType();
    log("________________LeaveType ${responseModel.toString()}");

    leaveTypeModel.value = LeaveTypeModel.toListOfModel(responseModel.data!);
  }
  //?---------------------------------------------selected leave type

  void setSelectedleaveType(String value) {
    selectedleaveType.value = value;
    log(selectedleaveType.toString());
  }

  Future<dynamic> fetchHolidayList() async {
    ResponseModel responseModel = await _vacationServices.getHolidayList(
        vacationRequestFrom.value.toString(), vacationRequestTo.value);
    log("________________holidayList ${responseModel.toString()}");

    holidayList.value = HolidayListModel.toListOfModel(responseModel.data!);
  }
  //?---------------------------------------------selected leave type

  //!post
  Future<bool> sendVacationRequest() async {
    if (result.isNotEmpty) {
      filesModel.value =
          await BaseController().getBase64FormateFile(result[0].files);
      //log( "file after base ${filesModel.toString()}");
    }

    ResponseModel responseModel =
        await _vacationServices.sendVacationRequest(data: {
      "vacationType": selectedleaveType.value,
      "periodFrom": vacationRequestFrom.value,
      "periodTo": vacationRequestTo.value,
      "leaveReson": leaveReason.value.text,
      "contactDetails": contactDetails.value.text,
      "informTo": informTo,
      "files": result.isNotEmpty
          ? filesModel.map((element) => element.toJson()).toList()
          : []
    });
    if (!responseModel.status) {
      log("* sendrequest from controller *${responseModel.message}");

      log(responseModel.status.toString());
      return false;
    } else {
      return true;
    }
  }

  //?---------------------------------------------validation
  bool checkValidation() {
    final isVisitValide = vacationRequestKey.value.currentState!.validate();
    if (isVisitValide) {
      return true;
    } else {
      return false;
    }
  }
}
