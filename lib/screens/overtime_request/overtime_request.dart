import 'package:GrandPolicy/screens/overtime_request/overtime_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Widget/common_widget/dashbord/whiteContainer.dart';
import '../../Widget/common_widget/home_widget/month_widget.dart';
import '../../Widget/common_widget/home_widget/sendBottonWidget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/overtime_controller/overtime_controller.dart';
import '../../utils/utile.dart';
import '../../value/style.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class OvertimeScreen extends StatelessWidget {
  OvertimeScreen({Key? key}) : super(key: key);

  final overtimeController = Get.put(OvertimeController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
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
            language!.overtimeRequest,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body:

            //--------------------------------------------------------------------------------------------- body

            SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height - 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              //    ,
              child: SingleChildScrollView(
                child: Obx(
                  () => connectivityController.connectionStatus.value == 0
                      ? const CheckInternetWidget()
                      : Form(
                          key: overtimeController.overTimeKey.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              //................................................................................. ...................................................//
                              //................................................. Month Widget ..................................................//
                              //................................................................................. ...................................................//
                              MonthWidget(
                                controller:
                                    overtimeController.overtimedate.value,
                                //    dateKey: overtimeController. overTimeKey.value,
                                hintText: language.date,
                                labelText: language.date,
                                onChange: (val) {
                                  print("overtime date $val");
                                  var datetime = DateTime.parse(val);
                                  // overtimeController.showDatetime.value = datetime;
                                  overtimeController.overtimeyear.value =
                                      datetime.year.toString();
                                  overtimeController.overtimeMonth.value =
                                      datetime.month.toString();
                                },
                                validate: (val) {
                                  if (val == null) {
                                    return language.emptyField;
                                  }
                                  return val.toString();
                                },
                              ),
                              //................................................................................. ...................................................//
                              //................................................. No of Hours Widget ..................................................//
                              //................................................................................. ...................................................//
                              const SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                // width: width,
                                // height: 45,
                                child: TextFormField(
                                  controller:
                                      overtimeController.noOfHours.value,
                                  keyboardType: TextInputType.number,
                                  cursorRadius: const Radius.circular(30),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return language.emptyField;
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    overtimeController.getAmount();
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    labelText: language.noOfHours,
                                    hintText: language.noOfHours,
                                    border: const OutlineInputBorder(),
                                  ),
                                  // decoration: decorationError(
                                  //     hintText: "No of Hours"),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                              ),

                              //--------------------------------------------------------------------- Amount
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${language.amount}: ${currencyFormat2.format(overtimeController.amount.value)}",
                                    style: const TextStyle(
                                        color: Colors.blueAccent),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  // TextField(
                                  //   style: const TextStyle(color: Colors.red),
                                  //   onChanged: (value) {},
                                  //   //  "Amount: ${currencyFormat.format(overtimeController.getAmount())}",
                                  //   //   style: TextStyle(color: Colors.blueAccent),
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              //---------------------------------------------------------------------Description
                              TextFormField(
                                textAlign: TextAlign.start,
                                //  textAlignVertical: TextAlignVertical.top,
                                controller: overtimeController.notes.value,
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
                                  labelText: language.note,
                                  hintText: language.note,
                                  border: const OutlineInputBorder(),
                                ),
                                // decoration: const InputDecoration(
                                //   border: InputBorder.none,
                                //   errorStyle: TextStyle(),
                                //   //  contentPadding: EdgeInsets.only(top: 300),
                                //   // alignLabelWithHint: false,
                                //   // constraints: const BoxConstraints.expand(height: 40, width: 100),
                                //   // isCollapsed: true,
                                //   //   hintStyle: TextStyle(),
                                //   hintText: "Notes",
                                // ),
                                // decoration: decorationError(hintText: "Notes"),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              //---------------------------------------------------------------------Reset Send Button
                              ButtonGlobal(
                                buttontext: language.submit,
                                buttonDecoration: kButtonDecoration.copyWith(
                                    color: kMainColor),
                                onPressed: () {
                                  if (overtimeController.checkValidation()) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            // title:
                                            //     " ${currencyFormat.format(overtimeController.amount.value)} Overtime",
                                            // content:
                                            child: Container(
                                              height: 350.0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Column(
                                                children: [
                                                  // Row(
                                                  //   children: const [
                                                  //     Expanded(
                                                  //       child: Text(
                                                  //         'Your Overtime request has been proccessed successfully',
                                                  //         overflow: TextOverflow.fade,
                                                  //         maxLines: 4,
                                                  //         style: TextStyle(
                                                  //             color: Colors.black45),
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  const SizedBox(
                                                    height: 30,
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
                                                    title: language.date,
                                                    detail: overtimeController
                                                        .overtimedate
                                                        .value
                                                        .text,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.noOfHours,
                                                    detail:
                                                        '${overtimeController.noOfHours.value.text} ',
                                                  ),
                                                  WhiteDashbordContainer(
                                                    title: language.amount,
                                                    detail:
                                                        "${overtimeController.amount.value}",
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),

                                                  const SizedBox(
                                                    height: 8,
                                                  ),

                                                  Obx(
                                                    () => AbsorbPointer(
                                                      absorbing:
                                                          overtimeController
                                                              .clickedBtn.value,
                                                      child: ButtonGlobal(
                                                          buttontext:
                                                              language.confirm,
                                                          buttonDecoration:
                                                              kButtonDecoration
                                                                  .copyWith(
                                                                      color:
                                                                          kMainColor),
                                                          onPressed: () async {
                                                            overtimeController
                                                                .clickedBtn
                                                                .value = true;

                                                            EasyLoading.show(
                                                              status: language
                                                                  .loading,
                                                            );

                                                            await overtimeController
                                                                .sendOvertimeRequest();

                                                            EasyLoading.showSuccess(
                                                                language
                                                                    .sentSuccessfully);
                                                            await overtimeController
                                                                .fetchOvertimeHistory();
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false);
                                                            Get.offAll(() =>
                                                                OverTimeHistoriesScreen(
                                                                    true));

                                                            await overtimeController
                                                                .fetchOvertimeDashboard();
                                                            overtimeController
                                                                .clickedBtn
                                                                .value = false;
                                                            EasyLoading
                                                                .dismiss();
                                                          }),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          primary: Colors.black,
                                                          textStyle:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        child: Text(
                                                            language.close),
                                                        onPressed: () {
                                                          EasyLoading.dismiss();
                                                           overtimeController
                                                                .clickedBtn
                                                                .value = true;
                                                          Get.back();
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),

//!

                                            // bool barrierDismissible = false,
                                            // Widget close,
                                          );
                                        });
                                  }

                                  //   onPressed: () {},
                                },
                                //? ButtonGlobal(
                                //   buttontext: 'clear',
                                //   buttonDecoration: kButtonDecoration.copyWith(
                                //       color: kBorderColorTextField),
                                //   onPressed: () {
                                //     overtimeController.noOfHours.value.clear();
                                //     overtimeController.notes.value.clear();
                                //   },
                                //? ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            )
          ]),
        ));
  }
}
