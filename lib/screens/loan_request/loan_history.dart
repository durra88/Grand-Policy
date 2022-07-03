import 'package:auto_animated/auto_animated.dart';
import 'package:GrandPolicy/Widget/animation/animationlist_widget.dart';
import 'package:GrandPolicy/Widget/loan_widget/headerLoanHistoryWidget.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/common_widget/Empty_data_widget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../Widget/common_widget/shimmer_widget.dart';
import '../../Widget/loan_widget/ExpandLoanHistoryWidget.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/loan_request_controller/loan_histories_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/utile.dart';
import '../home/home.dart';
import 'loan_request.dart';

// ignore: must_be_immutable
class LoanHistoriesScreen extends StatelessWidget {
  bool submit;
  LoanHistoriesScreen(this.submit, {Key? key}) : super(key: key);
  final loanHistoryController = Get.put(LoanHistoriesController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    // loanHistoryController.loanModel.value[0].amount;
    // print("${loanHistoryController.loanModel.length}");
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => LoanRequestScreen());
          },
          backgroundColor: kMainColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          leading: BackButton(onPressed: (() {
            Get.offAll(HomeScreen2());
          })),
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            language!.loans,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
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
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 10.0, left: 10.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                        left: 10.0,
                                        right: 20.0),
                                    decoration: BoxDecoration(
                                      border: const Border(
                                          top: BorderSide(
                                        color: kMainColor,
                                      )),
                                      color: kMainColor.withOpacity(0.1),
                                    ),
                                    child: loanHistoryController
                                            .dashbordLoadData.value
                                        ? const SimmerHeaderData()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                loanHistoryController
                                                            .loandashboardModel
                                                            .value
                                                            .totalloans ==
                                                        null
                                                    ? "0"
                                                    : currencyFormat2.format(
                                                        loanHistoryController
                                                            .loandashboardModel
                                                            .value
                                                            .totalloans),
                                                style: kTextStyle.copyWith(
                                                    color: kMainColor,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                language.totalLoan,
                                                style: kTextStyle,
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                        left: 10.0,
                                        right: 20.0),
                                    decoration: BoxDecoration(
                                      border: const Border(
                                          top: BorderSide(
                                        color: kAlertColor,
                                      )),
                                      color: kAlertColor.withOpacity(0.1),
                                    ),
                                    child: loanHistoryController
                                            .dashbordLoadData.value
                                        ? const SimmerHeaderData()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                loanHistoryController
                                                            .loandashboardModel
                                                            .value
                                                            .totalPaid ==
                                                        null
                                                    ? "0"
                                                    : currencyFormat2.format(
                                                        loanHistoryController
                                                            .loandashboardModel
                                                            .value
                                                            .totalPaid),
                                                style: kTextStyle.copyWith(
                                                    color: kAlertColor,
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                language.totalPaid,
                                                style: kTextStyle,
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                        left: 10.0,
                                        right: 20.0),
                                    decoration: BoxDecoration(
                                      border: const Border(
                                          top: BorderSide(
                                        color: Color(0xFF4CE364),
                                      )),
                                      color: const Color(0xFF4CE364)
                                          .withOpacity(0.1),
                                    ),
                                    child: loanHistoryController
                                            .dashbordLoadData.value
                                        ? const SimmerHeaderData()
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                loanHistoryController
                                                            .loandashboardModel
                                                            .value
                                                            .totalPendding ==
                                                        null
                                                    ? "0"
                                                    : currencyFormat2.format(
                                                        loanHistoryController
                                                            .loandashboardModel
                                                            .value
                                                            .totalPendding),
                                                style: kTextStyle.copyWith(
                                                    color:
                                                        const Color(0xFF4CE364),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                language.totalPending,
                                                style: kTextStyle,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Column(children: [
                            Expanded(
                              child: LiveList(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  showItemDuration:
                                      const Duration(milliseconds: 200),
                                  showItemInterval:
                                      const Duration(milliseconds: 150),
                                  reAnimateOnVisibility: false,
                                  itemCount: loanHistoryController
                                          .loadingData.value
                                      ? 10
                                      : loanHistoryController.loanModel.length,
                                  itemBuilder: animationItemBuilder((index) {
                                    int reverseList =
                                        loanHistoryController.loanModel.length -
                                            1 -
                                            index;

                                    return loanHistoryController
                                                .loadingData.value ==
                                            true
                                        ? const SimmerLoadingData()
                                        : loanHistoryController
                                                .loanModel.isEmpty
                                            ? const EmptyDataWidget()
                                            : Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 14,
                                                        horizontal: 8),
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
                                                // margin:
                                                //     const EdgeInsets.all(14),
                                                // decoration: BoxDecoration(
                                                //   borderRadius:
                                                //       BorderRadius.circular(
                                                //           10.0),
                                                //   border: Border.all(
                                                //       color: kGreyTextColor
                                                //           .withOpacity(0.5)),
                                                // ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          top: 14,
                                                          bottom: 4,
                                                          right: 4),
                                                  child: ExpandableNotifier(
                                                    initialExpanded:
                                                        reverseList == 0 &&
                                                                submit
                                                            ? true
                                                            : false,
                                                    child: ScrollOnExpand(
                                                      scrollOnExpand: true,
                                                      scrollOnCollapse: true,
                                                      child: ExpandablePanel(
                                                        theme: const ExpandableThemeData(
                                                            headerAlignment:
                                                                ExpandablePanelHeaderAlignment
                                                                    .top,
                                                            tapBodyToCollapse:
                                                                true,
                                                            hasIcon: false,
                                                            iconPlacement:
                                                                ExpandablePanelIconPlacement
                                                                    .left,
                                                            iconPadding:
                                                                EdgeInsets.only(
                                                                    top: 20,
                                                                    right: 20,
                                                                    left: 20)),
                                                        header:
                                                            HeaderLoanHistoryWidget(
                                                          amount: currencyFormat2.format(
                                                              loanHistoryController
                                                                  .loanModel[
                                                                      reverseList]
                                                                  .amount),
                                                          status:
                                                              loanHistoryController
                                                                  .loanModel[
                                                                      reverseList]
                                                                  .status!,
                                                          month:
                                                              loanHistoryController
                                                                  .loanModel[
                                                                      reverseList]
                                                                  .month
                                                                  .toString(),
                                                          year: loanHistoryController
                                                              .loanModel[
                                                                  reverseList]
                                                              .year
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
                                                        expanded:
                                                            ExpandedLoanHistoryWidget(
                                                          status:
                                                              loanHistoryController
                                                                  .loanModel[
                                                                      reverseList]
                                                                  .status!,
                                                          settled:
                                                              // ignore: unrelated_type_equality_checks
                                                              loanHistoryController
                                                                          .loanModel[
                                                                              reverseList]
                                                                          .setteled
                                                                          .toString() ==
                                                                      0
                                                                  ? "No"
                                                                  : "Yes",
                                                          notes:
                                                              loanHistoryController
                                                                  .loanModel[
                                                                      reverseList]
                                                                  .notes!,
                                                          loanAmount: currencyFormat2.format(
                                                              loanHistoryController
                                                                  .loanModel[
                                                                      reverseList]
                                                                  .loanAmount),
                                                          installmentAmount:
                                                              currencyFormat2.format(
                                                                  loanHistoryController
                                                                      .loanModel[
                                                                          reverseList]
                                                                      .amount),
                                                          year: loanHistoryController
                                                              .loanModel[
                                                                  reverseList]
                                                              .year
                                                              .toString(),
                                                          month:
                                                              loanHistoryController
                                                                  .loanModel[
                                                                      reverseList]
                                                                  .month
                                                                  .toString(),
                                                          deductedFromSalary:
                                                              // ignore: unrelated_type_equality_checks
                                                              loanHistoryController
                                                                          .loanModel[
                                                                              reverseList]
                                                                          .notDeductFromSalary
                                                                          .toString() ==
                                                                      0
                                                                  ? "No"
                                                                  : "Yes",
                                                          createdBy:
                                                              loanHistoryController
                                                                  .loanModel[
                                                                      reverseList]
                                                                  .createdBy!,
                                                          createdOn: loanHistoryController
                                                                      .loanModel[
                                                                          reverseList]
                                                                      .createdOn ==
                                                                  null
                                                              ? ""
                                                              : DateTimeCastString(
                                                                  loanHistoryController
                                                                      .loanModel[
                                                                          reverseList]
                                                                      .createdOn!),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                  })),
                            ),
                          ]),
                        ),
                      ]),
              ),
            )));
  }
}
