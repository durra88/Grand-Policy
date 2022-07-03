import 'package:auto_animated/auto_animated.dart';
import 'package:GrandPolicy/Widget/animation/animationlist_widget.dart';
import 'package:GrandPolicy/Widget/vacationHistory_widget/ExpandedvacationHistoryWidget.dart';
import 'package:GrandPolicy/Widget/vacationHistory_widget/headerVacationHistoryWidget.dart';
import 'package:GrandPolicy/controller/vocation_controller/vacation_controller.dart';
import 'package:GrandPolicy/utils/utile.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widget/common_widget/Empty_data_widget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../Widget/common_widget/shimmer_widget.dart';
import '../../Widget/deduction_widget/botton.dart';
import '../../controller/internet_connection/connectivity_controller.dart';

// ignore: must_be_immutable
class VocationHistoriesScreen extends StatelessWidget {
  VocationHistoriesScreen({Key? key}) : super(key: key);
  final leaveController = Get.put(VacationController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    ScrollController _controller = ScrollController();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: BackButton(onPressed: () {
            Get.back();
          }),
          title: Text(
            language!.requests,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Container(
                      height: MediaQuery.of(context).size.height + 20,
                      padding: const EdgeInsets.only(top: 20.0),
                      decoration: const BoxDecoration(
                        color: kBgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(children: [
                        connectivityController.connectionStatus.value == 0
                            ? const CheckInternetWidget()
                            : Expanded(
                                child: LiveList(
                                  physics: const ClampingScrollPhysics(),
                                  showItemDuration:
                                      const Duration(milliseconds: 200),
                                  showItemInterval:
                                      const Duration(milliseconds: 150),
                                  reAnimateOnVisibility: false,
                                  itemCount: leaveController.loadingData.value
                                      ? 10
                                      : leaveController.vacationModel.length,
                                  itemBuilder: animationItemBuilder((index) {
                                    int reverseList =
                                        leaveController.vacationModel.length -
                                            1 -
                                            index;
                                    return leaveController.loadingData.value
                                        ? const SimmerLoadingData()
                                        : leaveController.vacationModel.isEmpty
                                            ? const EmptyDataWidget()
                                            : Container(
                                                margin:
                                                    const EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: ExpandableNotifier(
                                                  child: ScrollOnExpand(
                                                    scrollOnExpand: true,
                                                    scrollOnCollapse: true,
                                                    child: ExpandablePanel(
                                                      theme:
                                                          const ExpandableThemeData(
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .top,
                                                        tapBodyToCollapse: true,
                                                        hasIcon: false,
                                                      ),
                                                      header:
                                                          HeaderVacationWidget(
                                                        status: leaveController
                                                            .vacationModel[
                                                                reverseList]
                                                            .status
                                                            .toString(),
                                                        EmpName: leaveController
                                                            .vacationModel[
                                                                reverseList]
                                                            .empName!,
                                                        vacationType:
                                                            leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .vacationType!,
                                                      ),

                                                      //------------------------------------------------------------------------------------------collapse
                                                      collapsed: const Text(
                                                        "",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.grey,
                                                            fontSize: 11),
                                                        softWrap: true,
                                                        maxLines: 2,
                                                        //overflow: TextOverflow.ellipsis,
                                                      ),
                                                      expanded: Column(
                                                        children: [
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          ExpandedVacationHistory(
                                                            sNo: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .sNo
                                                                .toString(),
                                                            requestStatus:
                                                                leaveController
                                                                    .vacationModel[
                                                                        reverseList]
                                                                    .status!,
                                                            staffId: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .empID
                                                                .toString(),
                                                            year: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .year
                                                                .toString(),
                                                            month: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .month
                                                                .toString(),
                                                            name: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .empName!,
                                                            from: (leaveController
                                                                            .vacationModel[
                                                                                reverseList]
                                                                            .periodFrom ==
                                                                        null ||
                                                                    leaveController
                                                                            .vacationModel[
                                                                                reverseList]
                                                                            .periodFrom ==
                                                                        "")
                                                                ? ""
                                                                : DateTimeCastString(leaveController
                                                                        .vacationModel[
                                                                            reverseList]
                                                                        .periodFrom!)
                                                                    .toString(),
                                                            to: (leaveController
                                                                            .vacationModel[
                                                                                reverseList]
                                                                            .periodTo ==
                                                                        null ||
                                                                    leaveController
                                                                            .vacationModel[
                                                                                reverseList]
                                                                            .periodTo ==
                                                                        "")
                                                                ? ""
                                                                : DateTimeCastString(leaveController
                                                                        .vacationModel[
                                                                            reverseList]
                                                                        .periodTo!)
                                                                    .toString(),
                                                            noOfDays: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .numOfDays
                                                                .toString(),
                                                            leaveType: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .vacationType!,
                                                            leaveReason: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .leaveReson!,
                                                            deductedFromBalance:
                                                                leaveController
                                                                            .vacationModel[reverseList]
                                                                            .deductFromBalance ==
                                                                        0
                                                                    ? "No"
                                                                    : "Yes",
                                                            contactDetails: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .contactDetails!,
                                                            sendDate: leaveController
                                                                .vacationModel[
                                                                    reverseList]
                                                                .transDate!,
                                                          ),
                                                          //!buttons
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 16),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        12),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Builder(builder:
                                                                        (context) {
                                                                      return ButtonDeductionWidget(
                                                                        title: language
                                                                            .approve,
                                                                        titlecolor:
                                                                            Colors.white,
                                                                        bg: kMainColor,
                                                                        btnwidth:
                                                                            90,
                                                                        shadow:
                                                                            false,
                                                                        callback:
                                                                            () async {
                                                                          EasyLoading
                                                                              .show(
                                                                            status:
                                                                                language.loading,
                                                                          );
                                                                          var result = await leaveController.approveVacation(leaveController
                                                                              .vacationModel[reverseList]
                                                                              .sNo
                                                                              .toString());
                                                                          leaveController.vacationModel[reverseList] = leaveController
                                                                              .RejectAprovedModel
                                                                              .value;

                                                                          String
                                                                              message =
                                                                              language.approvedSuccessfully;

                                                                          if (result
                                                                              is String) {
                                                                            message =
                                                                                result;
                                                                          }
                                                                          EasyLoading.showSuccess(
                                                                              message);
                                                                          EasyLoading
                                                                              .dismiss();
                                                                        },
                                                                      );
                                                                    }),
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                    ButtonDeductionWidget(
                                                                      title: language
                                                                          .reject,
                                                                      titlecolor:
                                                                          kAlertColor,
                                                                      bg: kAlertColor
                                                                          .withOpacity(
                                                                              0.1),
                                                                      btnwidth:
                                                                          90,
                                                                      shadow:
                                                                          false,
                                                                      callback:
                                                                          () async {
                                                                        EasyLoading
                                                                            .show(
                                                                          status:
                                                                              language.loading,
                                                                        );
                                                                        var result = await leaveController.rejectVacation(leaveController
                                                                            .vacationModel[reverseList]
                                                                            .sNo
                                                                            .toString());
                                                                        leaveController.vacationModel[reverseList] = leaveController
                                                                            .RejectAprovedModel
                                                                            .value;
                                                                        String
                                                                            message =
                                                                            language.rejectedSuccessfully;

                                                                        if (result
                                                                            is String) {
                                                                          message =
                                                                              result;
                                                                        }
                                                                        EasyLoading.showSuccess(
                                                                            message);
                                                                        EasyLoading
                                                                            .dismiss();
                                                                      },
                                                                    )
                                                                  ],
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                  }),
                                ),
                              ),
                      ]),
                    )),
                const SizedBox(
                  height: 40,
                )
              ]),
        ));
  }
}
