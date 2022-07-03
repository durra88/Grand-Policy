import 'dart:developer';

import 'package:GrandPolicy/model/vocationrequest_model/leave_History_model.dart';
import 'package:GrandPolicy/services/vacation_request_services/leave_history_services.dart';
import 'package:get/get.dart';

import '../../model/response_model/response_model.dart';

class LeaveHistoryController extends GetxController {
  final leaveHistoryModel = <LeaveHistoryModel>[].obs;
  final cancelLeaveModel = LeaveHistoryModel().obs;
  final LeaveHistoriesServices _leaveHistoryServices = LeaveHistoriesServices();
  var loadingData = true.obs;

  @override
  void onInit() {
    fetchLeaveHistory();
    super.onInit();
  }

  Future<dynamic> fetchLeaveHistory() async {
    loadingData.value = true;
    ResponseModel responseModel = await _leaveHistoryServices.getLeaveHistory();
    log("________________leaveHistory${responseModel.toString()}");
    leaveHistoryModel.value =
        LeaveHistoryModel.toListOfModel(responseModel.data!);
    loadingData.value = false;
  }

  Future<dynamic> cancelVacation(String sNo) async {
    ResponseModel responseModel =
        await _leaveHistoryServices.cancelVacation(sNo);
    if (responseModel.data == null) return responseModel.message;

    cancelLeaveModel.value = LeaveHistoryModel.fromJson(responseModel.data!);
    log("________________canceled${responseModel.message.toString()}");
  }
}
