import 'dart:developer';

import 'package:GrandPolicy/screens/welcome/choose_language.dart';
import 'package:GrandPolicy/utils/storage/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../screens/home/home.dart';
import '../../screens/welcome/introduction_screen.dart';
import '../../utils/storage/storage_keys.dart';

class IntroductionController extends GetxController {
  var name = "".obs;

  @override
  void onInit() {
    
  Future.delayed(const Duration(seconds: 2), () async {
      checkiflogged();
    });
  

    super.onInit();
  }

  Widget checkiflogged() {
    var checklooged = (StorageHelper.sharedPreferences!.get(
      StorageKeys.isLogged,
    ));
    Widget x;
    log("$checklooged");
    if (checklooged == "true") {
      x = HomeScreen2();
    } else {
      x =  ChooseLanguage();
    }

    return x;
  }


}
