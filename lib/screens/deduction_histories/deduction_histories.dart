import 'package:auto_animated/auto_animated.dart';
import 'package:GrandPolicy/Widget/animation/animationlist_widget.dart';
import 'package:GrandPolicy/Widget/deduction_widget/expandedDeductionWidget.dart';
import 'package:GrandPolicy/Widget/deduction_widget/headerDeduction_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widget/common_widget/Empty_data_widget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../Widget/common_widget/shimmer_widget.dart';
import '../../controller/deduction_controller/deduction_controller.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../utils/utile.dart';
import '../../value/style.dart';

// ignore: must_be_immutable
class DeductionHistoriesScreen extends StatelessWidget {
  DeductionHistoriesScreen({Key? key}) : super(key: key);
  final deductionController = Get.put(DeductionController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  @override
  Widget build(BuildContext context) {
    var deductionList = deductionController.deductionModel;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Deduction',
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
              color: kBgColor,
            ),
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Obx(() => connectivityController
                            .connectionStatus.value ==
                        0
                    ? const CheckInternetWidget()
                    : Column(children: [
                        Expanded(
                          child: LiveList(
                            showItemDuration: const Duration(milliseconds: 200),
                            showItemInterval: const Duration(milliseconds: 150),
                            reAnimateOnVisibility: false,
                            itemCount: deductionController.loadingData.value
                                ? 10
                                : deductionList.length,
                            itemBuilder: animationItemBuilder((index) {
                              int reverseList =
                                  deductionList.length - 1 - index;

                              return deductionController.loadingData.value
                                  ? const SimmerLoadingData()
                                  : deductionList.isEmpty
                                      ? const EmptyDataWidget()
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 14, horizontal: 14),
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
                                                  BorderRadius.circular(5)),
                                          child: ExpandableNotifier(
                                            child: ScrollOnExpand(
                                              scrollOnExpand: true,
                                              scrollOnCollapse: true,
                                              child: ExpandablePanel(
                                                theme: const ExpandableThemeData(
                                                    headerAlignment:
                                                        ExpandablePanelHeaderAlignment
                                                            .top,
                                                    tapBodyToCollapse: true,
                                                    hasIcon: false,
                                                    iconPlacement:
                                                        ExpandablePanelIconPlacement
                                                            .left,
                                                    iconPadding:
                                                        EdgeInsets.only(
                                                            top: 20,
                                                            right: 20,
                                                            left: 20)),
                                                header: HeaderDeductionWidget(
                                                  item:
                                                      deductionList[reverseList]
                                                          .amount
                                                          .toString(),
                                                  status:
                                                      deductionList[reverseList]
                                                          .status!,
                                                  year:
                                                      deductionList[reverseList]
                                                          .year
                                                          .toString(),
                                                  date: (deductionList[
                                                                      reverseList]
                                                                  .createdOn ==
                                                              null ||
                                                          deductionList[
                                                                      reverseList]
                                                                  .createdOn ==
                                                              "")
                                                      ? ""
                                                      : DateTimeCastString(
                                                              deductionList[
                                                                      reverseList]
                                                                  .createdOn
                                                                  .toString())
                                                          .toString(),
                                                )
                                                //------------------------------------------------------------------------------------------collapse
                                                ,
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
                                                expanded:
                                                    ExpandedDeductionWidget(
                                                  reason:
                                                      deductionList[reverseList]
                                                          .item!,
                                                  noOfDaysHours:
                                                      deductionList[reverseList]
                                                          .noOfDays
                                                          .toString(),
                                                  amount:
                                                      deductionList[reverseList]
                                                          .amount
                                                          .toString(),
                                                  note:
                                                      deductionList[reverseList]
                                                          .notes!,
                                                  createdBy:
                                                      deductionList[reverseList]
                                                          .createdBy!,
                                                  createdOn: (deductionList[
                                                                      reverseList]
                                                                  .createdOn ==
                                                              null ||
                                                          deductionList[
                                                                      reverseList]
                                                                  .createdOn ==
                                                              "")
                                                      ? ""
                                                      : DateTimeCastString(
                                                              deductionList[
                                                                      reverseList]
                                                                  .createdOn
                                                                  .toString())
                                                          .toString(),
                                                  status:
                                                      deductionList[reverseList]
                                                          .status!,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                            }),
                          ),
                        )
                      ])),
              )
            ]),
          ),
        ));
  }
}
