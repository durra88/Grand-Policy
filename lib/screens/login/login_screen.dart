import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widget/common_widget/home_widget/sendBottonWidget.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../controller/login_controller/introduction_controller.dart';
import '../../controller/translation/translation.dart';
import '../../utils/storage/storage_helper.dart';
import '../../utils/storage/storage_keys.dart';
import '../../value/style.dart';
import '../home/home.dart';
import '../../Widget/login_widget/show_name_widget.dart';
import '../../Widget/login_widget/show_password_widget.dart';
import '../../controller/login_controller/login_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  IntroductionController introductionController =
      Get.put(IntroductionController());
  LoginController loginController = Get.put(LoginController());
  final connectivity = Get.put(ConnectivityController());
  final translationcontroller = Get.put(Translation());

  //final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            language!.signIn,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                translationcontroller.isArabic.value =
                    !translationcontroller.isArabic.value;
                translationcontroller.setlanguage();
              },
              child: const Center(
                  child: Image(
                      image: AssetImage('assets/images/translateIcon.png'))),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                language.signInTitle,
                style: kTextStyle.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Form(
                    key: loginController.loginFormKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20.0,
                        ),
                        //     BackgroundWidget(),
                        Column(children: [
                          NameWidget(
                            name: language.name,
                            controller: loginController,
                          ),
                          const SizedBox(height: 30),
                          PasswordWidget(
                            password: language.password,
                            controller: loginController,
                          ),
                          const SizedBox(height: 50),
                          ButtonGlobal(
                            buttontext: language.signIn,
                            buttonDecoration:
                                kButtonDecoration.copyWith(color: kMainColor),
                            onPressed: () async {
                              EasyLoading.show();
                              if (await InternetConnectionChecker()
                                      .hasConnection ==
                                  false) {
                                EasyLoading.dismiss();
                                Get.snackbar(
                                    language.offline, language.offlineMesg,
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                var result = await loginController.login(
                                    username: loginController
                                        .usernameTextController.value.text,
                                    password: loginController
                                        .passwordTextController.value.text);
                                StorageHelper.set(StorageKeys.isLogged, "true");
                                if (result) {
                                  EasyLoading.dismiss();

                                  Get.offAll(() => HomeScreen2());
                                  log("message");

                                  // ignore: unrelated_type_equality_checks
                                } else {
                                  EasyLoading.dismiss();
                                  Get.snackbar(
                                      language.tryAgain, language.tryAgainMsg,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM);
                                }
                              }
                            },
                          ),
                        ])
                      ],
                    )),
              ),
            ),
          ],
        ));
  }
}
