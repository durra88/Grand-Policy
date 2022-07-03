import 'package:GrandPolicy/screens/welcome/splash_screen.dart';
import 'package:GrandPolicy/utils/storage/storage_helper.dart';
import 'package:GrandPolicy/value/colors.dart';
import 'package:GrandPolicy/value/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'controller/controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'controller/translation/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageHelper.getInstance();
  await CallController.call();

  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Translation translationController = Get.put(Translation());
    //   var locale=ProfileController().locale.value;
    //  Get.updateLocale(locale);

    return Obx(() {
      // log(" local language is****************************************${translationController.locale.value.toString()}");

      log(" local language is****************************************${translationController.locale.value.toString()}");
      //log("text direction is ****************************************${translationController.textDirection.value.toString()}");
      log("is language arabic?****************************************${translationController.isArabic.value.toString()}");
      return GetMaterialApp(
        textDirection: translationController.isArabic.value?TextDirection.rtl:TextDirection.ltr,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
            translationController.locale.value,
          // const Locale('en', ''), // English, no country code
          // const Locale('ar', ''),
        
        ],
        theme: ThemeData(
          primaryColor: mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        //IntroductionController().checkiflogged(),
        builder: EasyLoading.init(),
      );
    });
  }
}
