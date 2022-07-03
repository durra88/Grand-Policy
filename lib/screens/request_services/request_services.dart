import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:GrandPolicy/Widget/common_widget/dropdownWidget.dart';
import 'package:GrandPolicy/screens/request_services/request_histories.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../Widget/common_widget/dashbord/whiteContainer.dart';
import '../../Widget/common_widget/home_widget/sendBottonWidget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/request_services_controller/request_services_controller.dart';
import '../../model/request_services_model/inform_model.dart';
import '../../value/loading.dart';
import 'document_request_services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class ServicesRequestScreen extends StatelessWidget {
  ServicesRequestScreen({Key? key}) : super(key: key);

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

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            language!.requestService,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
                //--------------------------------------------------------------------------------------------- body

                child: Container(
              margin: const EdgeInsets.only(top: 20),
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
                      key: requestServicesController.requestServicesKey.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          //--------------------------------------------------------------------- request type
                          Obx(
                            () => DropDownWidget(
                              hintText: language.requestType,
                              lableText: language.requestType,
                              listOfModel:
                                  requestServicesController.requestTypeModel,
                              selectedDropdownValue: requestServicesController
                                  .selectedRequestType.value,
                              // value: ,
                              callback: (String value) {
                                requestServicesController
                                    .setSelectedRequestType(value);
                              },
                            ),
                          ),

                          //---------------------------------------------------------------------departement type
                          const SizedBox(
                            height: 20.0,
                          ),
                          Obx(
                            () => DropDownWidget(
                              hintText: language.department,
                              lableText: language.department,
                              listOfModel:
                                  requestServicesController.departementModel,
                              selectedDropdownValue: requestServicesController
                                  .selectedDepartement.value,
                              // value: ,
                              callback: (String value) {
                                requestServicesController
                                    .setSelectedDepartement(value);

                                requestServicesController
                                    .selectedEmailingTo.value = "";
                                requestServicesController
                                    .emailingToModel.value = [];
                                requestServicesController.fetchEmailingTo(
                                    requestServicesController
                                        .selectedDepartement.value);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          //---------------------------------------------------------------------Emailing to

                          Obx(() => SizedBox(
                                height: 60.0,
                                child: DropdownButtonFormField<String>(
                                  // dropdownColor: dropdownItemColor,
                                  // style: kTextStyle,
                                  hint: Text(
                                    language.emailingTo,
                                    // style: TextStyle(
                                    //   fontWeight: FontWeight.w600,
                                    //   color: Color(0xFF35484E),
                                    // ),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelText: language.emailingTo,
                                      // labelStyle: const TextStyle(
                                      //   fontWeight: FontWeight.w600,
                                      //   color: Color(0xFF35484E),
                                      // ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),

                                  value: requestServicesController
                                                  .selectedEmailingTo.value ==
                                              "" ||
                                          !requestServicesController
                                              .emailingToModel
                                              .any((element) =>
                                                  element.name ==
                                                  requestServicesController
                                                      .selectedEmailingTo.value)
                                      ? null
                                      : requestServicesController
                                          .selectedEmailingTo.value,
                                  onChanged: (value) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    requestServicesController
                                        .setSelectedEmailingTo(value!);
                                    //callback(newValue!);
                                    requestServicesController
                                        .selectedEmailingTo.value = value;
                                  },
                                  validator: (value) => value == null
                                      ? language.emptyField
                                      : null,
                                  items: requestServicesController
                                      .emailingToModel
                                      .map((requestTypeItem) {
                                    return DropdownMenuItem<String>(
                                      value: requestTypeItem.name,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(requestTypeItem.name!),
                                      ),
                                    );
                                  }).toList(),
                                  icon: Obx(() {
                                    if (requestServicesController
                                        .emailingToModel.isEmpty) {
                                      return LoadingSpinner()
                                          .miniFadingCircleSpinner;
                                    }
                                    return const Icon(Icons.arrow_drop_down);
                                  }),
                                  isExpanded: true,
                                ),
                              )),
                          //---------------------------------------------------------------------Description
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: requestServicesController.notes.value,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return language.emptyField;
                              }
                              return null;
                            },
                            //  autocorrect: true,
                            maxLines: 3,
                            cursorColor: Colors.white.withOpacity(0.2),
                            cursorRadius: const Radius.circular(30),

                            // decoration: decorationText(
                            //     hintText: 'Request Details ...'),
                            decoration: InputDecoration(
                              labelText: language.requestDetail,
                              hintText: language.requestDetail,
                              border: const OutlineInputBorder(),
                            ),
                          ),

                          //---------------------------------------------------------------------inform to
                          const SizedBox(
                            height: 20.0,
                          ),
                          MultiSelectDialogField<InformToModel>(
                            items: _items,
                            title: Text(
                              language.employees,
                            ),
                            selectedColor: Colors.blue,

                            decoration: BoxDecoration(
                              // color: Colors.blue.withOpacity(0.1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
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
                              // style: kTextStyle,
                            ),
                            onConfirm: (List<InformToModel> results) {
                              requestServicesController.selectedListOfInformTo
                                  .clear();
                              for (var i = 0; i < results.length; i++) {
                                requestServicesController.selectedListOfInformTo
                                    .add(results[i].name!);
                              }
                            },
                            // chipDisplay: MultiSelectChipDisplay(
                            //   onTap: (value) {
                            //     log("_________________$value");
                            //   },
                            // ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          //---------------------------------------------------------------------file
                          DocumentRequestServices(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          //---------------------------------------------------------------------Reset save
                          ButtonGlobal(
                              buttontext: language.submit,
                              buttonDecoration:
                                  kButtonDecoration.copyWith(color: kMainColor),
                              onPressed: () async {
                                if (requestServicesController
                                    .isRequestServiseValidate()) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          child: Container(
                                            height: 321.0,
                                            padding: const EdgeInsets.symmetric(
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
                                                  title: language.requestType,
                                                  detail:
                                                      requestServicesController
                                                          .selectedRequestType
                                                          .value,
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                WhiteDashbordContainer(
                                                  title: language.department,
                                                  detail:
                                                      requestServicesController
                                                          .selectedDepartement
                                                          .value,
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                WhiteDashbordContainer(
                                                  title: language.emailingTo,
                                                  detail:
                                                      requestServicesController
                                                          .selectedEmailingTo
                                                          .value,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: [
                                                    Obx(
                                                      () => AbsorbPointer(
                                                        absorbing:
                                                            requestServicesController
                                                                .clickedBtn
                                                                .value,
                                                        child: ButtonGlobal(
                                                            buttontext: language
                                                                .confirm,
                                                            buttonDecoration:
                                                                kButtonDecoration
                                                                    .copyWith(
                                                                        color:
                                                                            kMainColor),
                                                            onPressed:
                                                                () async {
                                                              requestServicesController
                                                                  .clickedBtn
                                                                  .value = true;
                                                              if (requestServicesController
                                                                  .checkRequestServicesValidation()) {
                                                                EasyLoading
                                                                    .show(
                                                                  status: language
                                                                      .loading,
                                                                );
                                                                await requestServicesController
                                                                    .sendRequestServices();

                                                                // requestServicesController
                                                                //     .restRequestServices();
                                                                await requestServicesController
                                                                    .fetchRequestServices();

                                                                EasyLoading
                                                                    .showSuccess(
                                                                        language
                                                                            .uploadDocuments);
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(false);
                                                                // requestServicesController
                                                                //     .restRequestServices();
                                                                Get.offAll(() =>
                                                                    RequestHistoriesScreen(
                                                                        true));
                                                                EasyLoading
                                                                    .dismiss();

                                                                requestServicesController
                                                                    .clickedBtn
                                                                    .value = false;
                                                              }
                                                            }),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      15.0),
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
                                                              requestServicesController
                                                                  .clickedBtn
                                                                  .value = true;
                                                              Get.back();
                                                            }),
                                                      ),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height > 700
                                ? 280
                                : 20,
                          )
                        ],
                      ),
                    ),
            ))));
  }
}
