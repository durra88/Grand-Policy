import 'package:GrandPolicy/Widget/common_widget/home_widget/sendBottonWidget.dart';
import 'package:GrandPolicy/screens/loan_request/loan_history.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Widget/common_widget/dashbord/whiteContainer.dart';
import '../../Widget/common_widget/dropdownWidget.dart';
import '../../Widget/common_widget/home_widget/month_widget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/loan_request_controller/loan_histories_controller.dart';
import '../../controller/loan_request_controller/loan_request_controller.dart';
import '../../utils/utile.dart';

// ignore: must_be_immutable
class LoanRequestScreen extends StatelessWidget {
  final LoanRequestController loanRequestController =
      Get.put(LoanRequestController());
  final LoanHistoriesController loanHistoryController =
      Get.put(LoanHistoriesController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  LoanRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            language!.loanRequest,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
                child: Column(children: [
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: connectivityController.connectionStatus.value == 0
                    ? const CheckInternetWidget()
                    : SingleChildScrollView(
                        child: Form(
                          key: loanRequestController.loanKey.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //---------------------------------------------------------------------Description
                              const SizedBox(
                                height: 20.0,
                              ),
                              DropDownWidget(
                                hintText: language.loanType,
                                lableText: language.loanType,

                                listOfModel:
                                    loanRequestController.loanTypeModel,
                                selectedDropdownValue: loanRequestController
                                    .selectedLoanType.value,
                                // value: ,
                                callback: (String value) {
                                  loanRequestController
                                      .setSelectedLoanType(value);
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              //---------------------------------------------------------------------Laon Amount
                              TextFormField(
                                onChanged: (v) {
                                  if (loanRequestController
                                              .noOfInstallement.value.text !=
                                          "" &&
                                      loanRequestController
                                              .loanAmount.value.text !=
                                          "" &&
                                      // ignore: unrelated_type_equality_checks
                                      loanRequestController.laonDate != "") {
                                    loanRequestController.genarateTableList();
                                  }
                                },
                                controller:
                                    loanRequestController.loanAmount.value,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.white.withOpacity(0.2),
                                cursorRadius: const Radius.circular(30),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  labelText: language.loanAmount,
                                  hintText: language.loanAmount,
                                  hintStyle: kTextStyle,
                                  border: const OutlineInputBorder(),
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return language.emptyField;
                                  }
                                  return null;
                                },
                              ),
                              //---------------------------------------------------------------------No of Installement
                              const SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                controller: loanRequestController
                                    .noOfInstallement.value,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.white.withOpacity(0.2),
                                cursorRadius: const Radius.circular(30),
                                // decoration: decorationText(
                                //     hintText: 'No of Installement'),
                                onChanged: (val) {
                                  if (loanRequestController
                                              .noOfInstallement.value.text !=
                                          "" &&
                                      loanRequestController
                                              .loanAmount.value.text !=
                                          "" &&
                                      // ignore: unrelated_type_equality_checks
                                      loanRequestController.laonDate.value !=
                                          "") {
                                    loanRequestController.genarateTableList();
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  labelText: language.noOfInstallment,
                                  hintText: language.noOfInstallment,
                                  hintStyle: kTextStyle,
                                  border: const OutlineInputBorder(),
                                ),

                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return language.emptyField;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    onChanged: (value) {
                                      loanRequestController.isDeducted.value =
                                          value!;
                                    },
                                    value:
                                        loanRequestController.isDeducted.value,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    // side: MaterialStateBorderSide.resolveWith(
                                    //   (states) =>
                                    //       BorderSide(width: 8.0, color: Colors.red),
                                    // ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    language.notdeductedFromSalary,
                                    style: kTextStyle,
                                  ),
                                ],
                              ),
                              //--------------------------------------------------------------------- Salary type
                              const SizedBox(
                                height: 20.0,
                              ),

                              //---------------------------------------------------------------------Instalment Start
                              MonthWidget(
                                controller: loanRequestController
                                    .loanDateController.value,
                                labelText: language.installmentStart,
                                //  dateKey: loanRequestController.loanKey.value,
                                hintText: language.installmentStart,

                                onChange: (val) {
                                  loanRequestController.loanDate.value =
                                      val.toString();
                                  if (kDebugMode) {
                                    //  print("loan date date $val");
                                  }
                                  var datetime = DateTime.parse(val);
                                  loanRequestController.loanyear.value =
                                      datetime.year.toString();
                                  loanRequestController.loanMonth.value =
                                      datetime.month.toString();
                                  loanRequestController.laonDate.value =
                                      datetime;
                                  if (loanRequestController
                                              .noOfInstallement.value.text !=
                                          "" &&
                                      loanRequestController
                                              .loanAmount.value.text !=
                                          "" &&
                                      // ignore: unrelated_type_equality_checks
                                      loanRequestController.laonDate.value !=
                                          "") {
                                    loanRequestController.genarateTableList();
                                  }
                                },
                                validate: (val) {
                                  if (val.isEmpty) {
                                    return language.emptyField;
                                  }
                                  return val.toString();
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),

                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return language.emptyField;
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: loanRequestController.notes.value,
                                maxLines: 4,
                                cursorColor: Colors.white.withOpacity(0.2),
                                cursorRadius: const Radius.circular(30),
                                decoration: InputDecoration(
                                  labelText: language.note,
                                  hintText: language.note,
                                  border: const OutlineInputBorder(),
                                ),
                                // decoration:
                                //     decorationText(hintText: 'Note ...'),
                              ),

                              //---------------------        ------------------------------------------------not deducted from salary
//!---------------------
                              Obx(
                                () => ListTileTheme(
                                  contentPadding: const EdgeInsets.all(0),
                                  child: ExpansionTile(
                                    initiallyExpanded: true,
                                    tilePadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    title: ListTile(
                                      title: Text(
                                        language.installementDetails,
                                        style: kTextStyle,
                                      ),
                                    ),
                                    children: [
                                      (loanRequestController
                                                  .loanModelTemp.isEmpty &&
                                              loanRequestController
                                                      .loanDate.value ==
                                                  "")
                                          ? const SizedBox(
                                              height: 8,
                                            )
                                          : SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: DataTable(
                                                  columns: [
                                                    DataColumn(
                                                        label: Text(
                                                            language.year)),
                                                    DataColumn(
                                                        label: Text(
                                                            language.month)),
                                                    DataColumn(
                                                        label: Text(
                                                            language.amount)),
                                                  ],
                                                  rows: loanRequestController
                                                      .loanModelTemp
                                                      .map((e) => DataRow(
                                                              cells: <DataCell>[
                                                                DataCell(Text(e
                                                                    .year
                                                                    .toString())),
                                                                DataCell(Text(e
                                                                    .month
                                                                    .toString())),
                                                                DataCell(Text(e
                                                                    .amount
                                                                    .toString())),
                                                              ]))
                                                      .toList()),
                                            ),
                                      const SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ButtonGlobal(
                                buttontext: language.submit,
                                buttonDecoration: kButtonDecoration.copyWith(
                                    color: kMainColor),
                                onPressed: () {
                                  if (loanRequestController
                                      .checkovertimeRequestValidation()) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Container(
                                              height: 365.0,
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
                                                    title: language.loanAmount,
                                                    detail:
                                                        loanRequestController
                                                            .loanAmount
                                                            .value
                                                            .text
                                                            .toString(),
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language
                                                        .deductedFromSalary,
                                                    detail: loanRequestController
                                                                .deductedvalue
                                                                .value ==
                                                            0
                                                        ? "No"
                                                        : "yes",
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.loanType,
                                                    detail:
                                                        loanRequestController
                                                            .selectedLoanType
                                                            .value,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                      title: language
                                                          .installmentStart,
                                                      detail: DateTimeCast(
                                                              loanRequestController
                                                                  .laonDate
                                                                  .value)
                                                          .toString()),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Obx(
                                                        () => AbsorbPointer(
                                                          absorbing:
                                                              loanRequestController
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
                                                                loanRequestController
                                                                    .clickedBtn
                                                                    .value = true;
                                                                EasyLoading
                                                                    .show(
                                                                  status: language
                                                                      .loading,
                                                                );
                                                                await loanRequestController
                                                                    .sendLoanRequest();

                                                                EasyLoading
                                                                    .showSuccess(
                                                                        language
                                                                            .sentSuccessfully);

                                                                EasyLoading
                                                                    .dismiss();
                                                                await loanHistoryController
                                                                    .fetchLoanHistories();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(false);
                                                                Get.to(() =>
                                                                    LoanHistoriesScreen(
                                                                        false));

                                                                loanRequestController
                                                                    .clickedBtn
                                                                    .value = false;
                                                                //   Navigator.of(context).pop;
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
                                                                loanRequestController
                                                                    .clickedBtn
                                                                    .value = true;
                                                              EasyLoading
                                                                  .dismiss();
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
                                },
                              ),
                              //---------------------------------------------------------------------Reset save
                            ],
                          ),
                        ),
                      ),
              ),
            ]))));
  }
}
