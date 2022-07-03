// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:GrandPolicy/controller/profile_controller/profile_controller.dart';
import 'package:GrandPolicy/controller/vocation_controller/vacation_controller.dart';
import 'package:GrandPolicy/controller/vocation_request_controller/leave_history_controller.dart';

import 'document_controller/document_controller.dart';
import 'login_controller/introduction_controller.dart';
import 'package:get/get.dart';

import 'login_controller/login_controller.dart';
import 'overtime_controller/overtime_controller.dart';

class CallController {
  static call() {
    final intro = Get.put(IntroductionController());
    //?---OvertimeController

    //OvertimeController overtime = Get.put(OvertimeController());

    //?---request services Controller

    // RequestServicesontroller request = Get.put(RequestServicesontroller());
    //?---loanController
    // ignore: unused_local_variable
    //LoanHistoriesController loan = Get.put(LoanHistoriesController());
    //?leave history
    //final leaveController = Get.put(LeaveHistoryController());
    //?excuse
    // final excuseController = Get.put(ExcuseDuringDutyController());
    //?vacation titlement
    //final vacationController = Get.put(VacationController());
    //?document
    // final documentController = Get.put(DocumentController());
    //?deduction
    //  final deductionController = Get.put(DeductionController());
    //?profile
    //final profile = Get.put(ProfileController());
    //!--------------------------delete all controller
    Get.delete<ProfileController>();
    Get.delete<IntroductionController>();
    Get.delete<OvertimeController>();
    Get.delete<LeaveHistoryController>();
    Get.delete<DocumentController>();
    Get.delete<VacationController>();
    Get.delete<LoginController>();
    Get.deleteAll();
  }
}
