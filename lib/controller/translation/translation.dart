import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Translation extends GetxController {
  var isArabic = true.obs;
  var lang = "Arabic".obs;
  //var textDirection = TextDirection.rtl.obs;
  var locale = const Locale(
    'ar',
  ).obs;

  @override
  void onInit() {
 //  setlanguage();
    // getTextDirection();
    super.onInit();
  }

  // getTextDirection() {
  //   if (isArabic.value) {
  //     textDirection.value = TextDirection.rtl;
  //   } else if (!isArabic.value) {
  //     textDirection.value = TextDirection.ltr;
  //   }
  // }

  void setlanguage() {
    if (isArabic.value) {
    
      setLocale(const Locale.fromSubtags(
        languageCode: 'ar',
      ));
       //textDirection.value = TextDirection.rtl;
      Get.updateLocale(locale.value);
     

      //   log("****************************************$locale.value");
    } else if (!isArabic.value) {
         setLocale(const Locale.fromSubtags(languageCode: 'en'));
     // textDirection.value = TextDirection.ltr;
      Get.updateLocale(locale.value);

      log("********************************************$locale.value");
    }
  }

  //Locale  locale;

  void setLocale(Locale value) {
    locale.value = value;
  }
}
