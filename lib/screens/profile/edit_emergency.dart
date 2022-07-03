import 'dart:developer';

import 'package:GrandPolicy/model/profile_model/profile_model.dart';
import 'package:GrandPolicy/screens/profile/profile_screen.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widget/common_widget/dropdownWidget.dart';
import '../../Widget/common_widget/home_widget/sendBottonWidget.dart';
import '../../controller/profile_controller/profile_controller.dart';

// ignore: must_be_immutable
class EditEmergencyDetails extends StatelessWidget {
  ProfileModel profileModel;
  EditEmergencyDetails(this.profileModel, {Key? key}) : super(key: key);
  final profileController = Get.put(ProfileController());

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
          language!.medicalEmergencyContact,
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetX<ProfileController>(builder: (profileController) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: profileController.enterMedical.value,
                      onChanged: (value) {
                        profileController.enterMedical.value = value!;
                        profileController.isVisibleMedical.value =
                            !profileController.isVisibleMedical.value;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      // side: MaterialStateBorderSide.resolveWith(
                      //   (states) =>
                      //       BorderSide(width: 8.0, color: Color.fromARGB(255, 39, 114, 128)),
                      // ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      language.medicalInfo,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8), fontSize: 16),
                    ),
                  ],
                ),
                Visibility(
                  visible: profileController.isVisibleMedical.value,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Obx(() => DropDownWidget(
                            lableText: language.bloodType,
                            hintText: profileController
                                        .profileModel.value.bloodType ==
                                    ""
                                ? language.bloodType
                                : profileController
                                    .profileModel.value.bloodType!,
                            listOfModel: profileController.bloodTypeModel,
                            selectedDropdownValue:
                                profileController.selectedBloodType.value,
                            // value: ,
                            callback: (String value) {
                              profileController.setSelectedBloodType(value);
                            },
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      //?----------------------------------------------doctor name
                      Obx(() => TextFormField(
                            textAlign: TextAlign.start,
                            controller: profileController.doctorName.value,
                            onChanged: (value) {
                              profileController.savedDoctorName.value = value;
                              log(value);
                            },
                            autofocus: false,
                            maxLines: 3,
                            cursorColor: Colors.white.withOpacity(0.2),
                            cursorRadius: const Radius.circular(30),
                            decoration: InputDecoration(
                              labelText: language.contactDetails,
                              hintText: language.contactDetails,
                              border: const OutlineInputBorder(),
                            ),
                          )),

                      const SizedBox(
                        height: 16,
                      ),
                      //?----------------------------------------------doctorAddress

                      Obx(() => TextFormField(
                            //autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: profileController.doctorAddress.value,
                            maxLines: 3,
                            cursorColor: Colors.white.withOpacity(0.2),
                            cursorRadius: const Radius.circular(30),
                            decoration: InputDecoration(
                              labelText: language.dorterAddress,
                              hintText: language.dorterAddress,
                              border: const OutlineInputBorder(),
                            ),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      //!----------------------------------------------Contact Details
                      Obx(() => TextFormField(
                            controller: profileController.doctorDetails.value,
                            maxLines: 3,
                            cursorColor: Colors.white.withOpacity(0.2),
                            cursorRadius: const Radius.circular(30),
                            decoration: InputDecoration(
                              labelText: language.contactDetails,
                              hintText: language.contactDetails,
                              border: const OutlineInputBorder(),
                            ),
                          )),

                      const SizedBox(
                        height: 16,
                      ),
                      //?----------------------------------------------Medical Conditions

                      Obx(() => TextFormField(
                            controller:
                                profileController.medicalConditions.value,

                            //  autocorrect: true,
                            maxLines: 3,
                            cursorColor: Colors.white.withOpacity(0.2),
                            cursorRadius: const Radius.circular(30),
                            decoration: InputDecoration(
                              labelText: language.medicalConditions,
                              hintText: language.medicalConditions,
                              border: const OutlineInputBorder(),
                            ),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      //?----------------------------------------------Allergies ...
                      Obx(() => TextFormField(
                            controller: profileController.allergies.value,
                            maxLines: 3,
                            cursorColor: Colors.white.withOpacity(0.2),
                            cursorRadius: const Radius.circular(30),
                            decoration: InputDecoration(
                              labelText: language.allergies,
                              hintText: language.allergies,
                              border: const OutlineInputBorder(),
                            ),
                          )),
                      const SizedBox(
                        height: 16,
                      ),

                      //?----------------------------------------------Current Medications ...
                      Obx(() => TextFormField(
                            controller:
                                profileController.currentMedications.value,
                            maxLines: 3,
                            cursorColor: Colors.white.withOpacity(0.2),
                            cursorRadius: const Radius.circular(30),
                            decoration: InputDecoration(
                              labelText: language.currentMedications,
                              hintText: language.currentMedications,
                              border: const OutlineInputBorder(),
                            ),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: profileController.enterEmergency.value,
                      onChanged: (value) {
                        profileController.enterEmergency.value = value!;
                        profileController.isVisibleEmergency.value =
                            !profileController.isVisibleEmergency.value;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      // side: MaterialStateBorderSide.resolveWith(
                      //   (states) =>
                      //       BorderSide(width: 8.0, color: Color.fromARGB(255, 39, 114, 128)),
                      // ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      language.emergencyContact,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8), fontSize: 16),
                    ),
                  ],
                ),
                //?---------------------------------------------- EmergencyName ...
                Visibility(
                  visible: profileController.isVisibleEmergency.value,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: profileController.emergContactName.value,
                        maxLines: 1,
                        cursorColor: Colors.white.withOpacity(0.2),
                        cursorRadius: const Radius.circular(30),
                        decoration: InputDecoration(
                          labelText: language.emergencyName,
                          hintText: language.emergencyName,
                          border: const OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      //?---------------------------------------------- EmergencyRelation ...

                      TextFormField(
                        controller:
                            profileController.emergContactRelationship.value,
                        maxLines: 3,
                        cursorColor: Colors.white.withOpacity(0.2),
                        cursorRadius: const Radius.circular(30),
                        decoration: InputDecoration(
                          labelText: language.emergencyRelation,
                          hintText: language.emergencyRelation,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //?---------------------------------------------- Emergency Address ...
                      TextFormField(
                        controller: profileController.emergContactAddress.value,
                        maxLines: 3,
                        cursorColor: Colors.white.withOpacity(0.2),
                        cursorRadius: const Radius.circular(30),
                        decoration: InputDecoration(
                          labelText: language.address,
                          hintText: language.address,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //?---------------------------------------------- Emergency contact details ...
                      TextFormField(
                        controller: profileController.emergContactPhone.value,
                        maxLines: 3,
                        cursorColor: Colors.white.withOpacity(0.2),
                        cursorRadius: const Radius.circular(30),
                        decoration: InputDecoration(
                          labelText: language.contactDetails,
                          hintText: language.contactDetails,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height > 700
                            ? 150
                            : 100,
                      ),
                    ],
                  ),
                ),
                ButtonGlobal(
                  buttontext: 'Submit',
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kMainColor),
                  onPressed: () async {
                    EasyLoading.show(
                      status: 'loading...',
                    );
                    await profileController.sendProfileContact();
                    await profileController.fetchProfileInfo();
                    EasyLoading.showSuccess('sent successfully!');
                    EasyLoading.dismiss();
                    Get.offAll(() => ProfileScreen());
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // void fillData() async{
  //   //?-----------------------------------------------Medical contact
  //   profileController.profileModel.value.bloodType!;
  //   profileController.doctorName.value.text = profileModel.doctorName!;
  //   profileController.doctorAddress.value.text = profileModel.doctorAddress!;
  //   profileController.medicalConditions.value.text =
  //       profileController.profileModel.value.medicalConditions!;
  //   profileController.allergies.value.text = profileModel.allergies!;
  //   profileController.currentMedications.value.text =
  //       profileModel.currentMedications!;
  //   profileController.doctorAddress.value.text = profileModel.doctorAddress!;
  //   //?-----------------------------------------------emergency contact
  //   profileController.emergContactName.value.text =
  //       profileController.profileModel.value.emergContactName!;
  //   profileController.emergContactRelationship.value.text =
  //       profileController.profileModel.value.emergContactRelationship!;
  //   profileController.emergContactAddress.value.text =
  //       profileController.profileModel.value.emergContactPhone!;
  //   profileController.emergContactPhone.value.text =
  //       profileController.profileModel.value.emergContactPhone!;

  //   // log("_________________doctor name${profileController.doctorName.value.text}");
  // }
}
