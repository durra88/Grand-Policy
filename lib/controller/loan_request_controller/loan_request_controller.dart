import 'dart:developer';

import 'package:GrandPolicy/model/loanHistories_model/loan_type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/loanHistories_model/loan_post_model.dart';
import '../../model/response_model/response_model.dart';
import '../../services/LoanHistories_services/loanHistories_services.dart';

class LoanRequestController extends GetxController {
  final loanModelList = <LoanPostModel>[].obs;
  final loanModel = LoanPostModel().obs;

  final loanModelTemp = <LoanPostModel>[].obs;

  var loanDate = "".obs;
  final loanDateController = TextEditingController().obs;

  var amount = 0.0.obs;
  var clickedBtn = false.obs;
  final LoanServices _loanServices = LoanServices();

  var loanMonth = "1".obs;
  var loanyear = "2022".obs;

  var laonDate = DateTime.now().obs;
  var isDeducted = false.obs;
  var deductedvalue = 0.obs;
  final notes = TextEditingController().obs;
  final loanAmount = TextEditingController().obs;
  final noOfInstallement = TextEditingController().obs;
  var loanKey = GlobalKey<FormState>().obs;

  getDeductedValue() {
    // ignore: unrelated_type_equality_checks
    if (isDeducted == false) {
      return deductedvalue.value = 0;
    }
    return deductedvalue.value = 1;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    getDeductedValue();
    await fetchLoanType();

    // log("******$month");
  }

//!--fetch request type
  var selectedLoanType = "".obs;
  var loanTypeModel = <LoanTypeModel>[].obs;
  //?---------------------------------------------requesttype
  Future<dynamic> fetchLoanType() async {
    ResponseModel responseModel = await _loanServices.getLoanType();
    loanTypeModel.value = LoanTypeModel.toListOfModel(responseModel.data!);
    log("________________Loan type dddddd ${responseModel.toString()}");
  }

  //?---------------------------------------------selected requesttype
  void setSelectedLoanType(String value) {
    selectedLoanType.value = value;
    log(selectedLoanType.toString());
  }
  //?----------------------------------------------Post data

  genarateList() {
    for (int i = 0; i < int.parse(noOfInstallement.value.text); i++) {
      var date = DateTime(
          laonDate.value.year, laonDate.value.month + i, laonDate.value.day);

      loanModelList.add(LoanPostModel(
          month: date.month,
          amount: int.parse(loanAmount.value.text) /
              int.parse(noOfInstallement.value.text),
          loanAmount: loanAmount.value.text,
          loanType: selectedLoanType.value,
          notDeductFromSalary: isDeducted.value ? 1 : 0,
          notes: notes.value.text,
          year: date.year));
    }
  }

  genarateTableList() {
    loanModelTemp.value = [];

    for (int i = 0; i < int.parse(noOfInstallement.value.text); i++) {
      var date = DateTime(
          laonDate.value.year, laonDate.value.month + i, laonDate.value.day);

      loanModelTemp.add(LoanPostModel(
          month: date.month,
          amount: int.parse(loanAmount.value.text) /
              int.parse(noOfInstallement.value.text),
          loanAmount: loanAmount.value.text,
          loanType: selectedLoanType.value,
          notDeductFromSalary: isDeducted.value ? 1 : 0,
          notes: notes.value.text,
          year: date.year));
    }
  }

  Future<bool> sendLoanRequest() async {
    genarateList();
    ResponseModel responseModel =
        await _loanServices.sendLoanRequestService(loanModelList);
    if (!responseModel.status) {
      log("* Loan from controller *${responseModel.message}");

      log(responseModel.status.toString());
      return false;
    } else {
      return true;
    }
  }

  //?---------------------------------------------validation
  bool checkovertimeRequestValidation() {
    final isVisitValide = loanKey.value.currentState!.validate();
    if (isVisitValide) {
      return true;
    } else {
      return false;
    }
  }
}
