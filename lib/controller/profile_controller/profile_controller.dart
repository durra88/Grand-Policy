import 'dart:developer';

import 'package:GrandPolicy/model/profile_model/edit_profile_model.dart';
import 'package:GrandPolicy/model/profile_model/profile_model.dart';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/profile_model/blood_type_model.dart';
import '../../services/profile_services/profile_services.dart';
import '../../utils/storage/storage_helper.dart';
import '../../utils/storage/storage_keys.dart';

class ProfileController extends GetxController {
  //  var lang = "ar".obs;

  final profileModel = ProfileModel().obs;
  final editProfileModel = EditProfileModel().obs;
  final ProfileServices _profileServices = ProfileServices();
  var isVisibleMedical = false.obs;
  var enterMedical = false.obs;
  var enterEmergency = false.obs;

  var isVisibleEmergency = false.obs;
  var loadingData = true.obs;
  var loadingImage = true.obs;
  var loadingbloodType = true.obs;
  //--------------------------------medical info
  final bloodType = "".obs;
  var doctorName = TextEditingController().obs;
  var doctorAddress = TextEditingController().obs;
  final doctorDetails = TextEditingController().obs;
  final medicalConditions = TextEditingController().obs;
  final allergies = TextEditingController().obs;
  final currentMedications = TextEditingController().obs;

  //?-----------
  final savedDoctorName = "".obs;
  final savedDoctorAddress = "".obs;
  final savedDoctorDetails = "".obs;
  final savedMedicalConditions = "".obs;
  final saveAllergiese = "".obs;
  final savedCurrentMedications = "".obs;
  var name = "".obs;
  var photo = "".obs;

  //---------------------------------emergency
  final emergContactName = TextEditingController().obs;
  final emergContactRelationship = TextEditingController().obs;
  final emergContactAddress = TextEditingController().obs;
  final emergContactPhone = TextEditingController().obs;
  var medicalInfoGlobalKey = GlobalKey<FormState>().obs;

  @override
  void onInit() {
    fetchProfileInfo();
    fetchBloodType();

   
    // fillData();
    super.onInit();
  }

  // Future<void> setLocale(Locale value) async {

  //    locale.value =  value;
  //   print("****************************${locale.value}");
  //   if (value == const Locale.fromSubtags(languageCode: 'ar')) {
  //     isArabic.value = true;
  //     print("********************is arabic********${isArabic.value}");
  //   } else {
  //     isArabic.value = false;
  //     print("********************is arabic********${isArabic.value}");
  //   }

  // }

  //?----------------------------------------------get profile data
  Future<dynamic> fetchProfileInfo() async {
    loadingData.value = true;
    ResponseModel responseModel = await _profileServices.getProfileInfo();
    //  log("___response Model_____________${responseModel.toString()}");
    profileModel.value = ProfileModel.fromJson(responseModel.data);

    String base64Image = responseModel.data['photo'];
    StorageHelper.set(StorageKeys.userPhoto, base64Image);
    loadingData.value = false;
    // log("***profile-response***${profileModel.value.address}");
  }

  Future<dynamic> fetchImage() async {
    loadingImage.value = true;
    ResponseModel responseModel = await _profileServices.getProfileInfo();
    String base64Image = responseModel.data['photo'];
    StorageHelper.set(StorageKeys.userPhoto, base64Image);
    loadingImage.value = false;

    // log("***profile-response***${profileModel.value.address}");
  }

  //!--fetch blood type
  var selectedBloodType = "".obs;
  var bloodTypeModel = <BloodTypeModel>[].obs;
  //?---------------------------------------------requesttype
  Future<dynamic> fetchBloodType() async {
    loadingbloodType.value = true;
    ResponseModel responseModel = await _profileServices.getBloodType();
    bloodTypeModel.value = BloodTypeModel.toListOfModel(responseModel.data!);
    log("___BloodType_____________${responseModel.toString()}");
    loadingbloodType.value = false;
  }

  //?---------------------------------------------selected requesttype
  void setSelectedBloodType(String value) {
    selectedBloodType.value = value;
    log(selectedBloodType.toString());
  }

  //?----------------------------------------------Post data
  Future<bool> sendProfileContact() async {
    ResponseModel responseModel = await _profileServices.editProfileInfo(data: {
      "doctorName": doctorName.value.text,
      "doctorAddress": doctorAddress.value.text,
      "doctorPhoneNo": doctorDetails.value.text,
      "medicalConditions": medicalConditions.value.text,
      "allergies": allergies.value.text,
      "currentMedications": currentMedications.value.text,
      "emergContactName": emergContactName.value.text,
      "emergContactRelationship": emergContactRelationship.value.text,
      "emergContactAddress": emergContactAddress.value.text,
      "emergContactPhone": emergContactPhone.value.text,
      "bloodType": selectedBloodType.value,
    });
    if (!responseModel.status) {
      log("* edit profile from  *${responseModel.message}");

      log(responseModel.status.toString());
      return false;
    } else {
      return true;
    }
  }

  Future<bool> fillData() async {
    //?-----------------------------------------------Medical contact

    doctorName.value.text = profileModel.value.doctorName!;

    doctorAddress.value.text = profileModel.value.doctorAddress!;

    ///
    medicalConditions.value.text = profileModel.value.medicalConditions!;

    allergies.value.text = profileModel.value.allergies!;

    currentMedications.value.text = profileModel.value.currentMedications!;

    doctorAddress.value.text = profileModel.value.doctorAddress!;
    //?-----------------------------------------------emergency contact
    emergContactName.value.text = profileModel.value.emergContactName!;
    emergContactRelationship.value.text =
        profileModel.value.emergContactRelationship!;
    emergContactAddress.value.text = profileModel.value.emergContactPhone!;
    emergContactPhone.value.text = profileModel.value.emergContactPhone!;
    update();
    return true;
    // log("_________________doctor name${profileController.doctorName.value.text}");
  }

  @override
  void dispose() {
    // fetchProfileInfo();
    // fetchBloodType().dispose();
    Get.delete<ProfileController>();
    super.dispose();
  }
}
