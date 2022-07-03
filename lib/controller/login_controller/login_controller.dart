import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/response_model/response_model.dart';
import '../../services/login_services/login_services.dart';
import '../../utils/storage/storage_helper.dart';
import '../../utils/storage/storage_keys.dart';
import '../profile_controller/profile_controller.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  final loginFormKey = GlobalKey<FormState>();
  var usernameTextController = TextEditingController().obs;
  var passwordTextController = TextEditingController().obs;
  var obscureText = true.obs;
  final authLoader = false.obs;
  final loginProcess = false.obs;
  var visible = false.obs;

  // final userdata = GetStorage().obs;

  
//?--------------------------------------------------------------------------------------------------------------------------------------------
//?----------------------------------------------------------------------Login Method---------------------------------------------------------
//?--------------------------------------------------------------------------------------------------------------------------------------------

  Future<bool> login({String? username, String? password}) async {
    authLoader.value = true;
    notifyChildrens();
    final String? fcmToken = await StorageHelper.get(StorageKeys.fcm_token);
    ResponseModel responseModel = await LoginAuthService().getLogin(loginData: {
      "userName": usernameTextController.value.text,
      "pass": passwordTextController.value.text,
      "fCMToken": fcmToken
    }).timeout(Duration(seconds: 5));
    authLoader.value = false;
    notifyChildrens();
    if (responseModel != null && !responseModel.status) {
      log(responseModel.message);
      return false;
    }

    log(responseModel.status.toString());

    StorageHelper.set(StorageKeys.fullName, responseModel.data['fulleName']);
    StorageHelper.set(StorageKeys.token, responseModel.data['token']);
    StorageHelper.set(StorageKeys.isLogged, "true");

    return true;
  }


  @override
  void dispose() {
    Get.deleteAll();
    Get.delete<LoginController>();
    super.dispose();
  }
}
