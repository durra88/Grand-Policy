import 'dart:developer';

import 'package:GrandPolicy/model/loanHistories_model/loanHistory_model.dart';
import 'package:GrandPolicy/model/loanHistories_model/loan_dashboard_model.dart';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/services/LoanHistories_services/loanHistories_services.dart';
import 'package:get/get.dart';

class LoanHistoriesController extends GetxController {
  final loanModel = <LoanHistoryModel>[].obs;
  final loandashboardModel = LoanDashBoardModel().obs;
  final LoanServices _loanServices = LoanServices();
  var loadingData = true.obs;
  var dashbordLoadData = true.obs;
  var loanIndex = 0.obs;

  @override
  void onInit() {
    fetchLoanHistories();
    fetchLoanDashboard();
    super.onInit();
  }

  Future<dynamic> fetchLoanHistories() async {
    loadingData.value = true;
    ResponseModel responseModel = await _loanServices.getLoanHistoryServices();

    log("*******************${responseModel.toString()}********");
    loanModel.value = LoanHistoryModel.toListOfModel(responseModel.data!);
    //log("########################${loanModel.value}##############################");

    loadingData.value = false;
  }

  Future<dynamic> fetchLoanDashboard() async {
    dashbordLoadData.value = true;
    ResponseModel responseModel = await _loanServices.getLoanDashBoardHistory();
    //  log("________________loan dashboard ${responseModel.toString()}");
    loandashboardModel.value = LoanDashBoardModel.fromJson(responseModel.data!);
    dashbordLoadData.value = false;
  }
}
