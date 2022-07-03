import 'package:auto_animated/auto_animated.dart';
import 'package:GrandPolicy/Widget/animation/animationlist_widget.dart';
import 'package:GrandPolicy/controller/exuse_during_duty_controller/excuse_during_duty_controller.dart';
import 'package:GrandPolicy/utils/utile.dart';
import 'package:GrandPolicy/value/colors.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Widget/common_widget/Empty_data_widget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../Widget/common_widget/shimmer_widget.dart';
import '../../Widget/deduction_widget/botton.dart';
import '../../Widget/excuse_widget/expandExcuseHistory.dart';
import '../../Widget/excuse_widget/headerExcuseHistory.dart';
import '../../controller/document_controller/document_controller.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/translation/translation.dart';
import '../home/home.dart';
import 'excuse_during_duty.dart';
import 'get_document_excuse.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class ExcuseHistoriesScreen extends StatelessWidget {
  bool submit;
  ExcuseHistoriesScreen(this.submit, {Key? key}) : super(key: key);
  final excuseController = Get.put(ExcuseDuringDutyController());
  final documentController = Get.put(DocumentController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    // Future _refresh() {
    //   excuseController.fetchExcuse();
    //   return Future.delayed(const Duration(seconds: 3));
    // }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => ExcuseDuringDutyScreen());
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
            language!.excuses,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Container(
                width: context.width,
                height: MediaQuery.of(context).size.height + 300,
                padding: const EdgeInsets.only(top: 20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: kBgColor,
                ),
                child: connectivityController.connectionStatus.value == 1
                    ? Column(
                        children: [
                          Expanded(
                              child: LiveList(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            showItemDuration: const Duration(milliseconds: 200),
                            showItemInterval: const Duration(milliseconds: 150),
                            reAnimateOnVisibility: false,
                            itemCount: excuseController.loader.value
                                ? 10
                                : excuseController.excuseModel.length,
                            itemBuilder: animationItemBuilder(
                              (index) {
                                int reverseList = index;
                                // excuseController.excuseModel
                                //         .length -
                                //     1 -
                                //     index;

                                return excuseController.loader.value
                                    ? const SimmerLoadingData()
                                    : excuseController.excuseModel.isEmpty
                                        ? const EmptyDataWidget()
                                        : Container(
                                            margin: const EdgeInsets.all(14),
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
                                              initialExpanded:
                                                  reverseList == 0 && submit
                                                      ? true
                                                      : false,
                                              child: ScrollOnExpand(
                                                scrollOnExpand: true,
                                                scrollOnCollapse: false,
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
                                                      HeaderExcuseHistoryWidget(
                                                    excuseFrom: excuseController
                                                        .excuseModel[
                                                            reverseList]
                                                        .excuseFrom!,
                                                    excuseType: excuseController
                                                        .excuseModel[
                                                            reverseList]
                                                        .execuseType!,
                                                    status: excuseController
                                                        .excuseModel[
                                                            reverseList]
                                                        .status!,
                                                    periodFrom: DateTimeCastString(
                                                            excuseController
                                                                .excuseModel[
                                                                    reverseList]
                                                                .periodFrom!)
                                                        .toString(),
                                                    periodTo: DateTimeCastString(
                                                            excuseController
                                                                .excuseModel[
                                                                    reverseList]
                                                                .periodTo!)
                                                        .toString(),
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
                                                      ExpandedExcuseHistoryWidget(
                                                          SNo: excuseController.excuseModel[reverseList].sNo!
                                                              .toString(),
                                                          status: excuseController
                                                              .excuseModel[
                                                                  reverseList]
                                                              .status!,
                                                          excuseType: excuseController
                                                              .excuseModel[
                                                                  reverseList]
                                                              .execuseType!,
                                                          excuseFrom: excuseController
                                                              .excuseModel[
                                                                  reverseList]
                                                              .excuseFrom!,
                                                          from: DateTimeCastString(excuseController.excuseModel[reverseList].periodFrom!)
                                                              .toString(),
                                                          to: DateTimeCastString(excuseController.excuseModel[reverseList].periodTo!)
                                                              .toString(),
                                                          hours: excuseController
                                                              .excuseModel[
                                                                  reverseList]
                                                              .noOfHours!,
                                                          leaveReason:
                                                              excuseController
                                                                  .excuseModel[
                                                                      reverseList]
                                                                  .leaveReson!,
                                                          // ignore: unrelated_type_equality_checks
                                                          backToWork:
                                                              excuseController.excuseModel[reverseList].backToWork.obs.toString() == "0"
                                                                  ? "No"
                                                                  : "Yes",
                                                          backToWorkTime: excuseController
                                                                      .excuseModel[reverseList]
                                                                      .backToWorkDate
                                                                      .obs ==
                                                                  ""
                                                              ? ""
                                                              : DateTimeCastString(excuseController.excuseModel[reverseList].backToWorkDate.obs.toString())),

                                                      //?-------------------------------view document
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 18,
                                                                left: 8,
                                                                right: 8),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                    0xff71E4BC)
                                                                .withOpacity(
                                                                    0.8),
                                                            //   gradient: buttonGradient,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            boxShadow: [
                                                              transboxShadow
                                                            ],
                                                          ),
                                                          // color: mainColor,
                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 12),
                                                          child: InkWell(
                                                            onTap: () {
                                                              Get.to(() =>
                                                                  GetDocumentExcuse(
                                                                    id: excuseController
                                                                        .excuseModel[
                                                                            reverseList]
                                                                        .sNo!,
                                                                  ));
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                                  child: Text(
                                                                      language
                                                                          .viewDocuments,
                                                                      style:
                                                                          const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255),
                                                                      )),
                                                                ),
                                                                //?---------------------------botton
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                                  child: FaIcon(
                                                                    (Translation()
                                                                            .isArabic
                                                                            .value
                                                                        ? FontAwesomeIcons
                                                                            .angleLeft
                                                                        : FontAwesomeIcons
                                                                            .angleRight),
                                                                    size: 14,
                                                                    color: Colors
                                                                        .white,
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
                                                                .only(top: 16),
                                                        child: Container(
                                                          // gradient: smartkeygradient,

                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 12),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              // ButtonDeductionWidget(
                                                              //   title: "Back To Work",
                                                              //   titlecolor: Colors.green,
                                                              //   bg: const Color(0xffFAE7E6),
                                                              //   btnwidth: 140,
                                                              //   shadow: true,
                                                              //   callback: () async {
                                                              //     EasyLoading.show(
                                                              //       status: 'loading...',
                                                              //     );
                                                              //     await excuseController.fetchBackToworkDate(excuseController.excuseModel[reverseList].sNo!);
                                                              //     await excuseController.fetchExcuse();
                                                              //     excuseController
                                                              //         // ignore: invalid_use_of_protected_member
                                                              //         .refresh();
                                                              //     EasyLoading.showSuccess('Sent successfully!');
                                                              //   },
                                                              // ),
                                                              // const SizedBox(
                                                              //   width: 60,
                                                              // ),
                                                              Builder(builder:
                                                                  (context) {
                                                                return ButtonDeductionWidget(
                                                                  title: language
                                                                      .cancel,
                                                                  titlecolor:
                                                                      Colors
                                                                          .red,
                                                                  bg: const Color(
                                                                      0xffFAE7E6),
                                                                  btnwidth: 140,
                                                                  shadow: true,
                                                                  callback:
                                                                      () async {
                                                                    EasyLoading
                                                                        .show(
                                                                      status: language
                                                                          .loading,
                                                                    );
                                                                    var result = await excuseController.cancelExcuse(excuseController
                                                                        .excuseModel[
                                                                            reverseList]
                                                                        .sNo!
                                                                        .toString());

                                                                    String
                                                                        message =
                                                                        language
                                                                            .sentSuccessfully;

                                                                    if (result
                                                                        is String) {
                                                                      message =
                                                                          result;
                                                                      EasyLoading
                                                                          .showError(
                                                                              message);
                                                                      EasyLoading
                                                                          .dismiss();
                                                                    } else {
                                                                      excuseController
                                                                              .excuseModel[reverseList] =
                                                                          excuseController
                                                                              .canceledExcuse
                                                                              .value;
                                                                      EasyLoading
                                                                          .showSuccess(
                                                                              message);
                                                                      EasyLoading
                                                                          .dismiss();
                                                                    }
                                                                  },
                                                                );
                                                              }),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                              },
                            ),
                          )),
                        ],
                      )
                    : const CheckInternetWidget(),
              ),
            )));
  }
}
