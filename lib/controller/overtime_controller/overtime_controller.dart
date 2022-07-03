import 'dart:developer';
import 'package:GrandPolicy/model/overtime_model/overtime_dashboard_model.dart';
import 'package:intl/intl.dart';
import 'package:GrandPolicy/model/overtime_model/overtime_model.dart';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/overtime_services/overtime_services.dart';
import '../profile_controller/profile_controller.dart';

class OvertimeController extends GetxController {
  final profileController = Get.put(ProfileController());
  final overtimeModel = <OvertimeModel>[].reversed.toList().obs;
  final overtimeDashBoardModel = OvertimeDashBoardModel().obs;
  final OvertimeServices _overtimeServices = OvertimeServices();
  var clickedBtn = false.obs;
  var overtimeIndex = 0.obs;
  var overTimeKey = GlobalKey<FormState>().obs;
  var overtimeMonth = "1".obs;
  var overtimeyear = "1".obs;
  var loader = true.obs;
  var dashbordLoadData = true.obs;

  String returnMonth(DateTime date) {
    return DateFormat.MMMM().format(date);
  }

  final overtimedate = TextEditingController().obs;

  final noOfHours = TextEditingController().obs;
  final notes = TextEditingController().obs;
  var amount = 0.0.obs;
  var price = 200;

  getAmount() {
    if (noOfHours.value.text.isEmpty) amount.value = 0.0;
    var salaryBs = profileController.profileModel.value.salaryBS;
    var salaryTa = profileController.profileModel.value.salaryTA;
    var totalhour = double.parse(noOfHours.value.text) * 1.5;
    var totalOvertime = ((salaryBs! + salaryTa!) / 30 / 8) * totalhour;
    amount.value = totalOvertime;
  }

  @override
  void onInit() {
    fetchOvertimeDashboard();
    fetchOvertimeHistory();

    // log("******$month");
    super.onInit();
  }

  //?----------------------------------------------Get data

  Future<dynamic> fetchOvertimeHistory() async {
    loader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    ResponseModel responseModel = await _overtimeServices.getOvertimeHistory();
    //  log("________________overtime${responseModel.toString()}");
    overtimeModel.value = OvertimeModel.toListOfModel(responseModel.data!);
    loader.value = false;
  }
  //?----------------------------------------------Get overtime dashboard data

  Future<dynamic> fetchOvertimeDashboard() async {
    dashbordLoadData.value = true;
    ResponseModel responseModel =
        await _overtimeServices.getOvertimeDashBoardHistory();
    log("________________overtime dashboard ${responseModel.toString()}");
    overtimeDashBoardModel.value =
        OvertimeDashBoardModel.fromJson(responseModel.data!);
    dashbordLoadData.value = false;
  }

  //?----------------------------------------------Post data
  Future<bool> sendOvertimeRequest() async {
    ResponseModel responseModel =
        await _overtimeServices.sendOvertimeRequestService(data: {
      "year": int.parse(overtimeyear.value),
      "month": int.parse(overtimeMonth.value),
      "noOfHours": int.parse(noOfHours.value.text),
      "amount": amount.value.toDouble(),
      "notes": notes.value.text
    });
    if (!responseModel.status) {
      log("* sendovertime from controller *${responseModel.message}");

      log(responseModel.status.toString());
      return false;
    } else {
      return true;
    }
  }

  //?---------------------------------------------validation
  bool checkValidation() {
    final isVisitValide = overTimeKey.value.currentState!.validate();
    if (isVisitValide) {
      return true;
    } else {
      return false;
    }
  }
}
