import 'package:auto_animated/auto_animated.dart';
import 'package:GrandPolicy/Widget/animation/animationlist_widget.dart';
import 'package:GrandPolicy/screens/request_services/request_services.dart';
import 'package:GrandPolicy/screens/request_services/view_document_rs.dart';
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
import '../../Widget/requestServices_widget/expandedrequestHistoryWidget.dart';
import '../../Widget/requestServices_widget/headerRequestServicesWidget.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/profile_controller/profile_controller.dart';
import '../../controller/request_services_controller/request_services_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controller/translation/translation.dart';
import '../../utils/utile.dart';
import '../home/home.dart';

// ignore: must_be_immutable
class RequestHistoriesScreen extends StatelessWidget {
  bool submit;
  RequestHistoriesScreen(this.submit, {Key? key}) : super(key: key);
  final RequestServicesontroller requestController =
      Get.put(RequestServicesontroller());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
           final translationcontroller = Get.put(Translation());

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ServicesRequestScreen());
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
          language!.services,
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: kBgColor,
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Obx(
                    () => connectivityController.connectionStatus.value == 0
                        ? const CheckInternetWidget()
                        : Column(children: [
                            Expanded(
                              child: LiveList(
                                // shrinkWrap: true,
                                showItemDuration:
                                    const Duration(milliseconds: 200),
                                showItemInterval:
                                    const Duration(milliseconds: 150),
                                reAnimateOnVisibility: false,
                                itemCount: requestController.loadingData.value
                                    ? 10
                                    : requestController
                                        .requestServicesModel.length,
                                itemBuilder: animationItemBuilder((
                                  index,
                                ) {
                                  int reverseList = index;
                                  // int reverseList = requestController
                                  //       .requestServicesModel.length -
                                  //   1;
                                  return requestController.loadingData.value ==
                                          true
                                      ? const SimmerLoadingData()
                                      : requestController
                                              .requestServicesModel.isEmpty
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
                                                      BorderRadius.circular(5)),
                                              child: ExpandableNotifier(
                                                initialExpanded:
                                                    index == 0 && submit
                                                        ? true
                                                        : false,
                                                controller:
                                                    ExpandableController.of(
                                                        context,
                                                        rebuildOnChange: false),
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
                                                        HeaderRequestServicesHistoryWidget(
                                                      name: requestController
                                                          .requestServicesModel[
                                                              reverseList]
                                                          .empName!,
                                                      status: requestController
                                                          .requestServicesModel[
                                                              reverseList]
                                                          .status!,
                                                      requestType: requestController
                                                          .requestServicesModel[
                                                              reverseList]
                                                          .requestType!,
                                                      requestDetail:
                                                          requestController
                                                              .requestServicesModel[
                                                                  reverseList]
                                                              .requestDetails
                                                              .toString(),
                                                      departement: requestController
                                                          .requestServicesModel[
                                                              reverseList]
                                                          .requestDepartment
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
                                                        ExpandedRequestServicesWidget(
                                                            sNo: requestController.requestServicesModel[reverseList].sNo!
                                                                .toString(),
                                                            status: requestController
                                                                .requestServicesModel[
                                                                    reverseList]
                                                                .status!,
                                                            employeeNo:
                                                                requestController.requestServicesModel[reverseList].empID
                                                                    .toString(),
                                                            employeeName: requestController
                                                                .requestServicesModel[
                                                                    reverseList]
                                                                .empName!,
                                                            requestType: requestController
                                                                .requestServicesModel[
                                                                    reverseList]
                                                                .requestType!,
                                                            requestDetails: requestController
                                                                .requestServicesModel[
                                                                    reverseList]
                                                                .requestDetails!,
                                                            requestDepartment:
                                                                requestController
                                                                    .requestServicesModel[
                                                                        reverseList]
                                                                    .requestDepartment!,
                                                            replyType: requestController
                                                                .requestServicesModel[
                                                                    reverseList]
                                                                .hrReplyType!,
                                                            replyInfo: requestController
                                                                .requestServicesModel[
                                                                    reverseList]
                                                                .hrReplyInfo!,
                                                            savedBy: requestController
                                                                .requestServicesModel[reverseList]
                                                                .hrReplyBy!,
                                                            savedDate: DateTimeCastString(requestController.requestServicesModel[reverseList].createdOn.toString())),
                                                        InkWell(
                                                          onTap: (() => Get.to(() =>
                                                              GetDocumentRequestServices(
                                                                id: requestController
                                                                    .requestServicesModel[
                                                                        reverseList]
                                                                    .sNo!,
                                                              ))),
                                                          child: Padding(
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
                                                                            5),
                                                                boxShadow: [
                                                                  transboxShadow
                                                                ],
                                                              ),
                                                              // color: mainColor,
                                                              width: double
                                                                  .infinity,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 12),
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
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child:
                                                                        FaIcon(
                                                                      (
                                                                              translationcontroller.isArabic
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
                                                        // SizedBox(height: 16,)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 16),
                                                          child: Container(
                                                            // gradient: smartkeygradient,

                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        12),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                ButtonDeductionWidget(
                                                                  title: language
                                                                      .cancel,
                                                                  titlecolor:
                                                                      Colors
                                                                          .red,
                                                                  bg: const Color(
                                                                      0xffFAE7E6),
                                                                  btnwidth: 90,
                                                                  shadow: true,
                                                                  callback:
                                                                      () async {
                                                                    EasyLoading
                                                                        .show(
                                                                      status: language
                                                                          .loading,
                                                                    );
                                                                    // var controller = ExpandableController.of(
                                                                    //     context,h
                                                                    //         true)!;
                                                                    var result = await requestController.cancelRequest(requestController
                                                                        .requestServicesModel[
                                                                            reverseList]
                                                                        .sNo
                                                                        .toString());
                                                                    String
                                                                        message =
                                                                        language
                                                                            .cancelsuccessfully;

                                                                    if (result
                                                                        is String) {
                                                                      message =
                                                                          result;
                                                                    } else {
                                                                      requestController
                                                                              .requestServicesModel[reverseList] =
                                                                          requestController
                                                                              .canceledReq
                                                                              .value;
                                                                    }

                                                                    EasyLoading
                                                                        .showSuccess(
                                                                            message);

                                                                    EasyLoading
                                                                        .dismiss();
                                                                  },
                                                                )
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
                                }),
                              ),
                            )
                          ]),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
