import 'package:auto_animated/auto_animated.dart';
import 'package:GrandPolicy/Widget/animation/animationlist_widget.dart';
import 'package:GrandPolicy/Widget/overtimeHistory_widget/expandedHistoryWidget.dart';
import 'package:GrandPolicy/controller/overtime_controller/overtime_controller.dart';
import 'package:GrandPolicy/screens/home/home.dart';
import 'package:GrandPolicy/utils/utile.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/common_widget/Empty_data_widget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../Widget/common_widget/shimmer_widget.dart';
import '../../Widget/overtimeHistory_widget/headerOvertimeWidget.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../value/style.dart';
import 'overtime_request.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class OverTimeHistoriesScreen extends StatelessWidget {
  final overtimeController = Get.put(OvertimeController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  bool submitt;

  OverTimeHistoriesScreen(this.submitt, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => OvertimeScreen());
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
            Get.offAll(HomeScreen2());
          })),
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            language!.overtime,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(top: 10.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: kBgColor,
                ),
                child: Obx(() => connectivityController
                            .connectionStatus.value ==
                        0
                    ? const CheckInternetWidget()
                    : Column(children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Column(children: [
                              Expanded(
                                child: LiveList(
                                  // reverse: true,
                                  showItemDuration:
                                      const Duration(milliseconds: 200),
                                  showItemInterval:
                                      const Duration(milliseconds: 150),
                                  reAnimateOnVisibility: false,
                                  itemCount: overtimeController.loader.value
                                      ? 10
                                      : overtimeController.overtimeModel.length,
                                  itemBuilder: animationItemBuilder((index) {
                                    int reverseList = overtimeController
                                            .overtimeModel.length -
                                        1 -
                                        index;
                                    overtimeController.overtimeIndex.value =
                                        index;

                                    return overtimeController.loader.value ==
                                            true
                                        ? const SimmerLoadingData()
                                        : overtimeController
                                                .overtimeModel.isEmpty
                                            ? const EmptyDataWidget()
                                            : Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 14,
                                                        horizontal: 14),
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
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          top: 14,
                                                          bottom: 4,
                                                          right: 4),
                                                  child: ExpandableNotifier(
                                                    initialExpanded:
                                                        overtimeController
                                                                        .overtimeIndex
                                                                        .value ==
                                                                    0 &&
                                                                submitt
                                                            ? true
                                                            : false,
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
                                                          // iconPlacement:
                                                          //     ExpandablePanelIconPlacement
                                                          //         .left,
                                                          // iconPadding:
                                                          //     EdgeInsets.only(
                                                          //         top: 20,
                                                          //         right:
                                                          //             20,
                                                          //         left:
                                                          //             20),
                                                        ),
                                                        header:
                                                            HeaderOvertimeHistoryWidget(
                                                          amount: currencyFormat2.format(
                                                              overtimeController
                                                                  .overtimeModel[
                                                                      reverseList]
                                                                  .amount),
                                                          status:
                                                              overtimeController
                                                                  .overtimeModel[
                                                                      reverseList]
                                                                  .status!,
                                                          date: (overtimeController
                                                                          .overtimeModel[
                                                                              reverseList]
                                                                          .createdOn ==
                                                                      null ||
                                                                  overtimeController
                                                                          .overtimeModel[
                                                                              reverseList]
                                                                          .createdOn ==
                                                                      "")
                                                              ? ""
                                                              : DateTimeCastString(
                                                                  overtimeController
                                                                      .overtimeModel[
                                                                          reverseList]
                                                                      .createdOn
                                                                      .toString()),
                                                          month: overtimeController
                                                              .overtimeModel[
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
                                                        expanded:
                                                            ExpandedOverTimeHistoryWidget(
                                                          status:
                                                              overtimeController
                                                                  .overtimeModel[
                                                                      reverseList]
                                                                  .status!,
                                                          year: overtimeController
                                                              .overtimeModel[
                                                                  reverseList]
                                                              .year
                                                              .toString(),
                                                          month: overtimeController
                                                              .overtimeModel[
                                                                  reverseList]
                                                              .month
                                                              .toString(),
                                                          noOfHours:
                                                              overtimeController
                                                                  .overtimeModel[
                                                                      reverseList]
                                                                  .noOfHours
                                                                  .toString(),
                                                          amount: currencyFormat2.format(
                                                              overtimeController
                                                                  .overtimeModel[
                                                                      reverseList]
                                                                  .amount),
                                                          notes: overtimeController
                                                              .overtimeModel[
                                                                  reverseList]
                                                              .notes!,
                                                          createdBy:
                                                              overtimeController
                                                                  .overtimeModel[
                                                                      reverseList]
                                                                  .createdBy
                                                                  .toString(),
                                                          createdOn: (overtimeController
                                                                          .overtimeModel[
                                                                              reverseList]
                                                                          .createdOn ==
                                                                      null ||
                                                                  overtimeController
                                                                          .overtimeModel[
                                                                              reverseList]
                                                                          .createdOn ==
                                                                      "")
                                                              ? ""
                                                              : DateTimeCastString(
                                                                  overtimeController
                                                                      .overtimeModel[
                                                                          reverseList]
                                                                      .createdOn
                                                                      .toString()),

                                                          // getDate(overtimeController
                                                          //         .overtimeModel[
                                                          //             reverseList]
                                                          //         .createdOn
                                                          //         .toString())
                                                          //     .toString(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                  }),
                                ),
                              ),
                            ])),
                      ])))));
  }
}
