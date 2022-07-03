import 'package:auto_animated/auto_animated.dart';
import 'package:GrandPolicy/Widget/animation/animationlist_widget.dart';
import 'package:GrandPolicy/controller/vocation_request_controller/leave_history_controller.dart';
import 'package:GrandPolicy/screens/vocation_request/vocation_request.dart';
import 'package:GrandPolicy/value/colors.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Widget/LeaveHistory_widget/expandedLeaveHistoryWidget.dart';
import '../../Widget/LeaveHistory_widget/headerLeaveHistoryWidget.dart';
import '../../Widget/common_widget/Empty_data_widget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../Widget/common_widget/shimmer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widget/deduction_widget/botton.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/translation/translation.dart';
import '../../utils/utile.dart';
import '../vacations/vacations.dart';
import 'get_vacation_document.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore: must_be_immutable
class LeaveHistoriesScreen extends StatelessWidget {
  bool submit;
  LeaveHistoriesScreen(this.submit, {Key? key}) : super(key: key);
  final leaveController = Get.put(LeaveHistoryController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => VacationRequest());
          },
          backgroundColor: kMainColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          leading: BackButton(onPressed: (() {
            Get.offAll(const VacationsScreen());
          })),
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            language!.leaves,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                width: context.width,
                padding: const EdgeInsets.only(top: 20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: kBgColor,
                ),
                child: connectivityController.connectionStatus.value == 0
                    ? const CheckInternetWidget()
                    : Column(children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Container(
                            child: Column(
                              children: [
                                Flexible(child: GetX<LeaveHistoryController>(
                                    builder: (leaveController) {
                                  return LiveList(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    showItemDuration:
                                        const Duration(milliseconds: 200),
                                    showItemInterval:
                                        const Duration(milliseconds: 150),
                                    reAnimateOnVisibility: true,
                                    itemCount: leaveController.loadingData.value
                                        ? 10
                                        : leaveController
                                            .leaveHistoryModel.length,
                                    itemBuilder: animationItemBuilder((index) {
                                      int reverseList = leaveController
                                              .leaveHistoryModel.length -
                                          1 -
                                          index;

                                      return leaveController.loadingData.value
                                          ? const SimmerLoadingData()
                                          : leaveController
                                                  .leaveHistoryModel.isEmpty
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
                                                          offset: const Offset(
                                                              0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: ExpandableNotifier(
                                                    initialExpanded: false,
                                                    child: ScrollOnExpand(
                                                      scrollOnExpand: true,
                                                      scrollOnCollapse: true,
                                                      child: ExpandablePanel(
                                                        theme:
                                                            const ExpandableThemeData(
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .top,
                                                          tapBodyToCollapse:
                                                              true,
                                                          hasIcon: false,
                                                        ),
                                                        header:
                                                            HeaderLeaveHistoryWidget(
                                                          vacationType:
                                                              leaveController
                                                                  .leaveHistoryModel[
                                                                      reverseList]
                                                                  .vacationType
                                                                  .toString(),
                                                          status: leaveController
                                                              .leaveHistoryModel[
                                                                  reverseList]
                                                              .status!,
                                                          year: leaveController
                                                                      .leaveHistoryModel[
                                                                          reverseList]
                                                                      .year ==
                                                                  null
                                                              ? ""
                                                              :
                                                              //   "2022/3/1",

                                                              leaveController
                                                                  .leaveHistoryModel[
                                                                      reverseList]
                                                                  .year
                                                                  .toString(),
                                                          month: leaveController
                                                                      .leaveHistoryModel[
                                                                          reverseList]
                                                                      .month ==
                                                                  null
                                                              ? ""
                                                              :
                                                              // "2022/3/1"

                                                              leaveController
                                                                  .leaveHistoryModel[
                                                                      reverseList]
                                                                  .month
                                                                  .toString(),
                                                        ),

                                                        //------------------------------------------------------------------------------------------collapse
                                                        collapsed: const Text(
                                                          "",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 11),
                                                          softWrap: true,
                                                          maxLines: 2,
                                                          //overflow: TextOverflow.ellipsis,
                                                        ),
                                                        expanded: Column(
                                                          children: [
                                                            ExpandedLeaveHistoryWidget(
                                                                status: leaveController
                                                                    .leaveHistoryModel[
                                                                        reverseList]
                                                                    .status!,
                                                                year: leaveController
                                                                    .leaveHistoryModel[
                                                                        reverseList]
                                                                    .year
                                                                    .toString(),
                                                                month: leaveController
                                                                    .leaveHistoryModel[
                                                                        reverseList]
                                                                    .month
                                                                    .toString(),
                                                                from: leaveController.leaveHistoryModel[reverseList].periodFrom ==
                                                                        null
                                                                    ? ""
                                                                    :
                                                                    //leaveController.leaveHistoryModel[reverseList].periodFrom
                                                                    // .toString(),
                                                                    DateTimeCastString(leaveController
                                                                        .leaveHistoryModel[
                                                                            reverseList]
                                                                        .periodFrom
                                                                        .toString()),
                                                                to: leaveController
                                                                            .leaveHistoryModel[reverseList]
                                                                            .periodTo ==
                                                                        null
                                                                    ? ""
                                                                    :
                                                                    // : leaveController.leaveHistoryModel[reverseList].periodTo
                                                                    //     .toString(),
                                                                    DateTimeCastString(leaveController.leaveHistoryModel[reverseList].periodTo.toString()),
                                                                alternativeEmployes: leaveController.leaveHistoryModel[reverseList].alternativeEmployees!,
                                                                leaveReason: leaveController.leaveHistoryModel[reverseList].leaveReson!,
                                                                contactDetails: leaveController.leaveHistoryModel[reverseList].contactDetails!,
                                                                deductedFromBalance: leaveController.leaveHistoryModel[reverseList].deductFromBalance == 0 ? "No" : "Yes",
                                                                noOfDays: leaveController.leaveHistoryModel[reverseList].numOfDays.toString(),
                                                                savedBy: leaveController.leaveHistoryModel[reverseList].savedBy!,
                                                                savedDate: leaveController.leaveHistoryModel[reverseList].transDate == null ? "" : "2022/3/1",
                                                                // DateTimeCastString(leaveController.leaveHistoryModel[reverseList].transDate.toString()),
                                                                //  backToWork: leaveController.leaveHistoryModel[reverseList].backToWork == 0 ? "No" : "Yes"),
                                                                backToWork: leaveController.leaveHistoryModel[reverseList].backToWorkDate ?? leaveController.leaveHistoryModel[reverseList].backToWorkDate!),
                                                            InkWell(
                                                              onTap: () {
                                                                Get.to(GetDocumentVacaton(
                                                                    id: leaveController
                                                                        .leaveHistoryModel[
                                                                            reverseList]
                                                                        .sNo!));
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 18,
                                                                        left: 8,
                                                                        right:
                                                                            8),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                            0xff71E4BC)
                                                                        .withOpacity(
                                                                            0.8),
                                                                    //   gradient: buttonGradient,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                    boxShadow: [
                                                                      transboxShadow
                                                                    ],
                                                                  ),
                                                                  // color: mainColor,
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
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 8.0),
                                                                        child: Text(
                                                                            language
                                                                                .viewDocuments,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontWeight: FontWeight.w600,
                                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                                            )),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 8.0),
                                                                        child:
                                                                            FaIcon(
                                                                          (Translation().isArabic.value
                                                                              ? FontAwesomeIcons.angleLeft
                                                                              : FontAwesomeIcons.angleRight),
                                                                          size:
                                                                              14,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    return ButtonDeductionWidget(
                                                                      title: language
                                                                          .cancel,
                                                                      titlecolor:
                                                                          Colors
                                                                              .red,
                                                                      bg: const Color(
                                                                          0xffFAE7E6),
                                                                      btnwidth:
                                                                          90,
                                                                      shadow:
                                                                          true,
                                                                      callback:
                                                                          () async {
                                                                        EasyLoading
                                                                            .show(
                                                                          status:
                                                                              language.loading,
                                                                        );
                                                                        // var controller = ExpandableController.of(
                                                                        //     context,
                                                                        //     required: true)!;

                                                                        var result = await leaveController.cancelVacation(leaveController
                                                                            .leaveHistoryModel[reverseList]
                                                                            .sNo
                                                                            .toString());

                                                                        String
                                                                            message =
                                                                            language.sentSuccessfully;

                                                                        if (result
                                                                            is String) {
                                                                          message =
                                                                              result;
                                                                        }
                                                                        leaveController.leaveHistoryModel[reverseList] = leaveController
                                                                            .cancelLeaveModel
                                                                            .value;

                                                                        EasyLoading.showSuccess(
                                                                            message);
                                                                        // controller
                                                                        //     .toggle();
                                                                        EasyLoading
                                                                            .dismiss();

                                                                        leaveController
                                                                            .fetchLeaveHistory();
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                    }),
                                  );
                                })),
                              ],
                            ),
                          ),
                        ),
                      ]))));
  }
}
