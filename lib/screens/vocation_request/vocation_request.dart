import 'dart:developer';
import 'package:GrandPolicy/screens/vocation_request/document_vocation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:GrandPolicy/controller/vocation_controller/vacation_controller.dart';
import 'package:GrandPolicy/screens/vocation_request/leave_history.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../Widget/common_widget/dashbord/whiteContainer.dart';
import '../../Widget/common_widget/dropdownWidget.dart';
import '../../Widget/common_widget/home_widget/month_widget.dart';
import '../../Widget/common_widget/home_widget/sendBottonWidget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/request_services_controller/request_services_controller.dart';
import '../../controller/vocation_request_controller/leave_history_controller.dart';
import '../../model/request_services_model/inform_model.dart';
import '../../utils/utile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class VacationRequest extends StatelessWidget {
  VacationRequest({Key? key}) : super(key: key);
  final VacationController vocationRequestController =
      Get.put(VacationController());
  final leaveController = Get.put(LeaveHistoryController());
  final requestServicesController = Get.put(RequestServicesontroller());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    var _items = requestServicesController.informToModel
        .map((informTo) =>
            MultiSelectItem<InformToModel>(informTo, informTo.name!))
        .toList();
    //--------------------------------------------time

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          language!.vacationRequest,
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(() => SingleChildScrollView(
              //--------------------------------------------------------------- body

              child: Column(children: [
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: connectivityController.connectionStatus.value == 0
                    ? const CheckInternetWidget()
                    : Form(
                        key: vocationRequestController.vacationRequestKey.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            //----------------------------------------------------------------------------------------------------------job details
                            ListTileTheme(
                              contentPadding: const EdgeInsets.all(0),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                //vocationRequestController
                                //  .titlementModelTemp.isNotEmpty,
                                // tilePadding: const EdgeInsets.symmetric(
                                //     vertical: 10, horizontal: 10),
                                title: ListTile(
                                  //  minLeadingWidth: 45,
                                  //  leading: Icon(FontAwesomeIcons.user, color: Color.fromARGB(255, 45, 49, 51), ),

                                  title: Text(
                                    language.vacationBalance,
                                    style: kTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                        columns: [
                                          DataColumn(
                                              label: Text(language.leaveType)),
                                          DataColumn(
                                              label: Text(language.daysTaken)),
                                          DataColumn(
                                              label:
                                                  Text(language.entitlement)),
                                          DataColumn(
                                              label: Text(language.balance)),
                                        ],
                                        rows: vocationRequestController
                                            .vacationTitlementModel
                                            .map((e) =>
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                      Text(e.vacationType!)),
                                                  DataCell(Text(
                                                      e.daysTaken.toString())),
                                                  DataCell(Text(
                                                      e.balance.toString())),
                                                  DataCell(
                                                      Text(e.days.toString()))
                                                ]))
                                            .toList()),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                            //---------------------------------------------------------------------Leave type
                            const SizedBox(
                              height: 20.0,
                            ),
                            Obx(
                              () => DropDownWidget(
                                hintText: language.leaveType,
                                lableText: language.leaveType,

                                listOfModel:
                                    vocationRequestController.leaveTypeModel,
                                selectedDropdownValue: vocationRequestController
                                    .selectedleaveType.value,
                                // value: ,
                                callback: (String value) {
                                  vocationRequestController
                                      .setSelectedleaveType(value);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            //---------------------------------------------------------------------date calender
                            MonthWidget(
                                controller: vocationRequestController
                                    .vacationRequestFromController.value,
                                hintText: language.from,
                                labelText: language.periodFrom,
                                //  dateKey: vocationRequestController.vacationRequestKey.value,
                                onChange: (val) {
                                  //  print("vacation date $val");

                                  vocationRequestController.vacationRequestFrom
                                      .value = val.toString();
                                  vocationRequestController.fetchHolidayList();

                                  vocationRequestController.noOfDAYS.value =
                                      daysBetween(
                                          DateTime.parse(
                                              vocationRequestController
                                                  .vacationRequestFrom.value),
                                          DateTime.parse(
                                              vocationRequestController
                                                  .vacationRequestTo.value));
                                },
                                validate: (val) {
                                  if (vocationRequestController
                                      .vacationRequestFrom.value.isEmpty) {
                                    return language.emptyField;
                                  }
                                  return val;
                                }),
                            const SizedBox(
                              height: 20.0,
                            ),
                            // //--------------------------------------------------------------------- calender
                            MonthWidget(
                              controller: vocationRequestController
                                  .vacationRequestToController.value,
                              //dateKey:vocationRequestController.vacationRequestKey.value ,
                              hintText: language.to,
                              labelText: language.to,
                              onChange: (val) {
                                if (kDebugMode) {
                                  print("overtime date $val");
                                }

                                vocationRequestController
                                    .vacationRequestTo.value = val.toString();

                                vocationRequestController.fetchHolidayList();
                                vocationRequestController.noOfDAYS.value =
                                    daysBetween(
                                        DateTime.parse(vocationRequestController
                                            .vacationRequestFrom.value),
                                        DateTime.parse(vocationRequestController
                                            .vacationRequestTo.value));
                              },

                              validate: (val) {
                                if (vocationRequestController
                                    .vacationRequestTo.value.isEmpty) {
                                  return language.emptyField;
                                }
                                return val;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            // //---------------------------------------------------------------------total num of Days
                            Obx(
                              () => Container(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "${language.totalNoOfDays}: ${vocationRequestController.noOfDAYS.toString()}",
                                        style: const TextStyle(
                                            color: Colors.blueAccent),
                                      ),
                                      Text(
                                        "${language.holidaysInBetween}: ${vocationRequestController.getTotalHoliday().toString()}",
                                        style: const TextStyle(
                                            color: Colors.blueAccent),
                                      ),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            //---------------------------------------------------------------------Leave Reson
                            TextFormField(
                              controller:
                                  vocationRequestController.leaveReason.value,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return language.emptyField;
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLines: 3,
                              cursorColor: Colors.white.withOpacity(0.2),
                              cursorRadius: const Radius.circular(30),
                              decoration: InputDecoration(
                                labelText: language.leaveReason,
                                hintText: language.leaveReason,
                                hintStyle: kTextStyle,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            MultiSelectDialogField(
                              items: _items,
                              title: Text(language.emptyField),
                              selectedColor: Colors.blue,
                              decoration: BoxDecoration(
                                // color: Colors.blue.withOpacity(0.1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0)),
                                border: Border.all(
                                  color: kBorderColorTextField,
                                  width: 1,
                                ),
                              ),
                              buttonIcon: const Icon(
                                Icons.supervised_user_circle,
                                color: kGreyTextColor,
                              ),
                              buttonText: Text(
                                language.informTo,
                              ),
                              onConfirm: (List<InformToModel> results) {
                                log(results[0].name!);
                                vocationRequestController.informTo.clear();

                                for (var i = 0; i < results.length; i++) {
                                  vocationRequestController.informTo
                                      .add(results[i].name!);
                                }

                                // exuseDuringDutyController.informTo.value =
                                //     results;
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            //---------------------------------------------------------------------Contact Details
                            TextFormField(
                              controller: vocationRequestController
                                  .contactDetails.value,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return language.emptyField;
                                }
                                return null;
                              },
                              maxLines: 3,
                              cursorColor: Colors.white.withOpacity(0.2),
                              cursorRadius: const Radius.circular(30),
                              decoration: InputDecoration(
                                labelText: language.contactDetails,
                                hintText: language.contactDetails,
                                hintStyle: kTextStyle,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            //----------------------------------------------------------------------------------------------------------Holiday List
                            Obx(() => ListTileTheme(
                                  contentPadding: const EdgeInsets.all(0),
                                  child: ExpansionTile(
                                    tilePadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    initiallyExpanded: true,
                                    //  vocationRequestController
                                    //     .holidayList.isNotEmpty,
                                    title: ListTile(
                                      //  leading: Icon(FontAwesomeIcons.user, color: Color.fromARGB(255, 45, 49, 51), ),

                                      title: Text(
                                        language.holidayList,
                                        style: kTextStyle.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //titleTextStyle: primaryTextStyle(),
                                      //     trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                                    ),
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: DataTable(
                                            columns: [
                                              DataColumn(
                                                  label: Text(language.title)),
                                              DataColumn(
                                                  label: Text(language.from)),
                                              DataColumn(
                                                  label: Text(language.to)),
                                            ],
                                            rows: vocationRequestController
                                                .holidayList
                                                .map((e) =>
                                                    DataRow(cells: <DataCell>[
                                                      DataCell(Text(
                                                          e.holidayTitle!)),
                                                      DataCell(Text(DateTimeCast(
                                                          DateTime.parse(e
                                                              .holidayDateFrom!)))),
                                                      DataCell(
                                                        Text(
                                                          DateTimeCast(
                                                            DateTime.parse(e
                                                                .holidayDateTo!),
                                                          ),
                                                        ),
                                                      ),
                                                    ]))
                                                .toList()),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  ),
                                )),

                            DocumentVacation(), //---------------------------------------------------------------------file
                            //---------------------------------------------------------------------Reset save
                            const SizedBox(
                              height: 20.0,
                            ),
                            ButtonGlobal(
                                buttontext: language.submit,
                                buttonDecoration: kButtonDecoration.copyWith(
                                    color: kMainColor),
                                onPressed: () {
                                  if (vocationRequestController
                                      .checkValidation()) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            child: Container(
                                              height: 320.0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    language.summary,
                                                    style: kTextStyle.copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.leaveType,
                                                    detail:
                                                        vocationRequestController
                                                            .selectedleaveType
                                                            .value,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.from,
                                                    detail:
                                                        vocationRequestController
                                                            .vacationRequestFrom
                                                            .value,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.to,
                                                    detail:
                                                        vocationRequestController
                                                            .vacationRequestTo
                                                            .value,
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Obx(
                                                        () => AbsorbPointer(
                                                          absorbing:
                                                              vocationRequestController
                                                                  .clickedBtn
                                                                  .value,
                                                          child: ButtonGlobal(
                                                              buttontext:
                                                                  language
                                                                      .confirm,
                                                              buttonDecoration:
                                                                  kButtonDecoration
                                                                      .copyWith(
                                                                          color:
                                                                              kMainColor),
                                                              onPressed:
                                                                  () async {
                                                                vocationRequestController
                                                                    .clickedBtn
                                                                    .value = true;
                                                                EasyLoading
                                                                    .show(
                                                                  status: language
                                                                      .loading,
                                                                );
                                                                await vocationRequestController
                                                                    .sendVacationRequest();

                                                                EasyLoading
                                                                    .showSuccess(
                                                                        language
                                                                            .sentSuccessfully);
                                                                EasyLoading
                                                                    .dismiss();
                                                                await leaveController
                                                                    .fetchLeaveHistory();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(false);
                                                                Get.to(() =>
                                                                    LeaveHistoriesScreen(
                                                                        false));

                                                                vocationRequestController
                                                                    .clickedBtn
                                                                    .value = false;
                                                              }),
                                                        ),
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      16.0),
                                                              primary:
                                                                  Colors.black,
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            child: Text(
                                                                language.close),
                                                            onPressed: () {
                                                               EasyLoading
                                                                    .dismiss();
                                                              vocationRequestController
                                                                  .clickedBtn
                                                                  .value = false;

                                                              Get.back();
                                                            }),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                }),
                          ],
                        )),
              ),
            ),
          ]))),
    );
  }

  TableRow buidRow(List<String> cells) => TableRow(
      children: cells
          .map((cell) => Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(cell),
                ),
              ))
          .toList());
}
