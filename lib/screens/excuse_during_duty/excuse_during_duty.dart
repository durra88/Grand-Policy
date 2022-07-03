import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:GrandPolicy/screens/excuse_during_duty/exuse_history.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../Widget/common_widget/dashbord/whiteContainer.dart';
import '../../Widget/common_widget/dropdownWidget.dart';
import '../../Widget/common_widget/home_widget/sendBottonWidget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../controller/exuse_during_duty_controller/excuse_during_duty_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/request_services_controller/request_services_controller.dart';
import '../../model/request_services_model/inform_model.dart';
import 'document_excuse.dart';

// ignore: must_be_immutable
class ExcuseDuringDutyScreen extends StatelessWidget {
  ExcuseDuringDutyScreen({Key? key}) : super(key: key);
  final ExcuseDuringDutyController exuseDuringDutyController =
      Get.put(ExcuseDuringDutyController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  final requestServicesController = Get.put(RequestServicesontroller());
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    var _items = requestServicesController.informToModel
        .map((informTo) =>
            MultiSelectItem<InformToModel>(informTo, informTo.name!))
        .toList();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            language!.excuseRequest,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: kBgColor,
                ),
                child: connectivityController.connectionStatus.value == 0
                    ? const CheckInternetWidget()
                    : Form(
                        key: exuseDuringDutyController.excuseKey.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),

                            TextFormField(
                              initialValue: exuseDuringDutyController
                                      .excuseFromModel.isNotEmpty
                                  ? exuseDuringDutyController
                                      .excuseFromModel[0].name
                                  : "",
                              decoration: InputDecoration(
                                labelText: language.excuseFrom,
                                hintStyle: kTextStyle,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            //---------------------------------------------------------------------Excuse From
                            // DropDownWidget(
                            //   lableText: "Excuse From",
                            //   hintText: "Excuse From",
                            //   listOfModel:
                            //       exuseDuringDutyController.excuseFromModel,
                            //   selectedDropdownValue: exuseDuringDutyController
                            //       .selectedExcuseFrom.value,
                            //   // value: ,
                            //   callback: (String value) {
                            //     exuseDuringDutyController
                            //         .setSelectedExcuseFrom(value);
                            //   },
                            // ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            //---------------------------------------------------------------------'HR Manager Email
                            TextFormField(
                              initialValue: exuseDuringDutyController
                                  .HrEmailModel.length>0?
                                  exuseDuringDutyController.HrEmailModel[0].name:"",
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: language.emailingTo,
                                hintStyle: kTextStyle,
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),

                            //---------------------------------------------------------------------Excuse Type
                            const SizedBox(
                              height: 20.0,
                            ),
                            DropDownWidget(
                              lableText: language.excuseType,
                              hintText: language.excuseType,
                              listOfModel:
                                  exuseDuringDutyController.excuseTypeModel,
                              selectedDropdownValue: exuseDuringDutyController
                                  .selectedExcuseType.value,
                              // value: ,

                              callback: (String value) {
                                exuseDuringDutyController
                                    .setSelectedExcuseType(value);
                              },
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            //---------------------------------------------------------------------from text
                            // Container(
                            //     alignment: Alignment.centerLeft,
                            //     child: const Text("Date")),
                            const SizedBox(
                              height: 10.0,
                            ),
                            //!---------------------------------------------------------------------date calender
                            DateTimePicker(
                              controller: exuseDuringDutyController
                                  .dateController.value,
                              type: DateTimePickerType.date,
                              // initialDate: DateTime.now(),
                              dateMask: 'yyyy-MM-dd',
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              icon: const Icon(Icons.event),
                              dateHintText: language.date,
                              timeHintText: language.hour,
                              fieldLabelText: language.date,
                              fieldHintText: language.time,
                              style: const TextStyle(fontSize: 14),
                              autovalidate: false,
                              // exuseDuringDutyController.isValideDate.value,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return language.emptyField;
                                }
                                return null;
                              },

                              // onChange: (val) {
                              //   print("overtime date $val");
                              //   var datetime = DateTime.parse(val);
                              //   // overtimeController.showDatetime.value = datetime;
                              //   overtimeController.overtimeyear.value =
                              //       datetime.year.toString();
                              //   overtimeController.overtimeMonth.value =
                              //       datetime.month.toString();
                              // },
                              onChanged: (val) {
                                exuseDuringDutyController.dateFrom.value = val;
                                // exuseDuringDutyController.numOfHours.value =
                                //     exuseDuringDutyController
                                //         .daysBetween(
                                //           DateTime.parse(
                                //               exuseDuringDutyController
                                //                   .dateFrom.value),
                                //           DateTime.parse(val),
                                //         )
                                //         .toString();

                                //  exuseDuringDutyController.dateFrom.value = val;
                              },
                            ),
                            //---------------------------------------------------------------------to text
                            const SizedBox(
                              height: 40.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(language.periodFrom),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                  ),
                                  Text(language.to),
                                ],
                              ),
                            ),
                            //?--------------------------------------------------------------------- calender
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  //   width: 200,
                                  child: DateTimePicker(
                                    controller: exuseDuringDutyController
                                        .priodFrom.value,
                                    type: DateTimePickerType.time,
                                    dateMask: 'yyyy-MM-dd',
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    icon: const Icon(Icons.event),
                                    dateHintText: language.date,
                                    timeHintText: language.hour,
                                    fieldLabelText: language.date,
                                    fieldHintText: language.time,
                                    style: const TextStyle(fontSize: 14),
                                    autovalidate: false,
                                    // exuseDuringDutyController.isValideDate.value,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return language.emptyField;
                                      }
                                      return null;
                                    },
                                    onChanged: (val) {
                                      exuseDuringDutyController
                                          .priodFrom.value.text = val;
                                      // exuseDuringDutyController
                                      //         .numOfHours.value =
                                      //     exuseDuringDutyController
                                      //         .daysBetween(
                                      //             DateTime.parse(
                                      //                 exuseDuringDutyController
                                      //                     .dateFrom.value),
                                      //             DateTime.parse(val))
                                      //         .toString();
                                    },
                                    // selectableDayPredicate: (date) {
                                    //   if (date.weekday == 6 || date.weekday == 7) {
                                    //     return false;
                                    //   }
                                    //   return true;
                                    // },
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 20.0,
                                // ),
                                Expanded(
                                  //    width: 150,
                                  child: DateTimePicker(
                                    controller:
                                        exuseDuringDutyController.priodTo.value,
                                    type: DateTimePickerType.time,
                                    dateMask: 'yyyy-MM-dd',
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    icon: const Icon(Icons.event),
                                    dateHintText: language.date,
                                    timeHintText: language.hour,
                                    fieldLabelText: language.date,
                                    fieldHintText: language.time,
                                    style: const TextStyle(fontSize: 14),
                                    autovalidate: false,
                                    // exuseDuringDutyController.isValideDate.value,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return language.emptyField;
                                      }
                                      return null;
                                    },
                                    onChanged: (val) {
                                      var start = DateTime.parse(
                                          "${exuseDuringDutyController.dateController.value.text} ${exuseDuringDutyController.priodFrom.value.text}");

                                      var end = DateTime.parse(
                                          "${exuseDuringDutyController.dateController.value.text} ${exuseDuringDutyController.priodTo.value.text}");

                                      exuseDuringDutyController
                                          .priodTo.value.text = val;
                                      exuseDuringDutyController
                                              .numOfHours.value =
                                          exuseDuringDutyController
                                              .daysBetween(start, end)
                                              .toString();
                                      print(exuseDuringDutyController
                                          .numOfHours.value);
                                    },
                                    // selectableDayPredicate: (date) {
                                    //   if (date.weekday == 6 || date.weekday == 7) {
                                    //     return false;
                                    //   }
                                    //   return true;
                                    // },
                                  ),
                                ),
                              ],
                            ),
                            //---------------------------------------------------------------------total num of hour
                            const SizedBox(
                              height: 20.0,
                            ),
                            Obx(() => Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${language.totalHours}: ${exuseDuringDutyController.numOfHours.value.obs()}",
                                  style:
                                      const TextStyle(color: Colors.blueAccent),
                                ))),
                            //---------------------------------------------------------------------Leave Reson
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller:
                                  exuseDuringDutyController.leaveReason.value,
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
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            //?
                            const SizedBox(
                              height: 20.0,
                            ),
                            //---------------------------------------------------------------------inform to
                            MultiSelectDialogField(
                              items: _items,
                              title: Text(language.employees),
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
                                log(results.toString());
                                requestServicesController.selectedListOfInformTo
                                    .clear();
                                for (var i = 0; i < results.length; i++) {
                                  exuseDuringDutyController.informTo
                                      .add(results[i].name!);
                                }

                                // exuseDuringDutyController.informTo.value =
                                //     results;
                              },
                            ),
                            // //---------------------------------------------------------------------file\
                            const SizedBox(
                              height: 20.0,
                            ), //---------------------------------------------------------------------file
                            ExcuseDocument(),
                            //---------------------------------------------------------------------Reset save
                            const SizedBox(
                              height: 20.0,
                            ),
                            ButtonGlobal(
                                buttontext: language.submit,
                                buttonDecoration: kButtonDecoration.copyWith(
                                    color: kMainColor),
                                onPressed: () {
                                  if (exuseDuringDutyController
                                      .checkValidation()) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          // exuseDuringDutyController
                                          //     .isValideDate.value = false;
                                          return Dialog(
                                            child: Container(
                                              height: 400.0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    language.leaveReason,
                                                    style: kTextStyle.copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.excuseFrom,
                                                    detail: exuseDuringDutyController
                                                            .excuseFromModel[0]
                                                            .name ??
                                                        exuseDuringDutyController
                                                            .excuseFromModel[0]
                                                            .name!,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.emailingTo,
                                                    detail: exuseDuringDutyController
                                                            .HrEmailModel[0]
                                                            .name ??
                                                        exuseDuringDutyController
                                                            .HrEmailModel[0]
                                                            .name!,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.date,
                                                    detail:
                                                        exuseDuringDutyController
                                                            .dateFrom.value,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  // WhiteDashbordContainer(
                                                  //   title: "Date To:",
                                                  //   detail:
                                                  //       exuseDuringDutyController
                                                  //           .dateTo.value,
                                                  // ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.totalHours,
                                                    detail:
                                                        exuseDuringDutyController
                                                            .numOfHours
                                                            .toString(),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Builder(
                                                          builder: (context) {
                                                        return Obx(
                                                          () => AbsorbPointer(
                                                            absorbing:
                                                                exuseDuringDutyController
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
                                                                  exuseDuringDutyController
                                                                      .clickedBtn
                                                                      .value = true;
                                                                  EasyLoading
                                                                      .show(
                                                                    status: language
                                                                        .loading,
                                                                  );
                                                                  await exuseDuringDutyController
                                                                      .sendExcuseRequest();

                                                                  EasyLoading
                                                                      .showSuccess(
                                                                          language
                                                                              .sentSuccessfully);
                                                                  EasyLoading
                                                                      .dismiss();
                                                                  await exuseDuringDutyController
                                                                      .fetchExcuse();
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop(
                                                                          false);
                                                                  Get.to(() =>
                                                                      ExcuseHistoriesScreen(
                                                                          false));

                                                                  exuseDuringDutyController
                                                                      .clickedBtn
                                                                      .value = false;
                                                                }),
                                                          ),
                                                        );
                                                      }),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16.0),
                                                            primary:
                                                                Colors.black,
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          //   hoverColor: Colors.transparent,
                                                          //    highlightColor: Colors.transparent,
                                                          child: Text(
                                                              language.close),
                                                          onPressed: () {
                                                            EasyLoading
                                                                .dismiss();
                                                            exuseDuringDutyController
                                                                .clickedBtn
                                                                .value = true;
                                                            // exuseDuringDutyController
                                                            //     .isValideDate
                                                            //     .value = false;
                                                            Get.offAll(
                                                                ExcuseHistoriesScreen(
                                                                    false));
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                }),
                          ],
                        ),
                      ),
              ),
            )));
  }
}
