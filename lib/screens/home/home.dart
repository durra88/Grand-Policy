import 'package:GrandPolicy/screens/overtime_request/overtime_history.dart';
import 'package:get/get.dart';

import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Widget/home_widget/hr_panel_service_widget.dart';
import '../../controller/login_controller/introduction_controller.dart';
import '../../controller/login_controller/login_controller.dart';
import '../../controller/profile_controller/profile_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../controller/translation/translation.dart';
import '../../utils/storage/storage_helper.dart';
import '../../utils/storage/storage_keys.dart';
import '../../utils/utile.dart';
import '../excuse_during_duty/exuse_history.dart';
import '../loan_request/loan_history.dart';
import '../login/login_screen.dart';
import '../profile/profile_screen.dart';
import '../request_services/request_histories.dart';
import '../vacations/vacations.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HomeScreen2 extends StatelessWidget {
  bool isChecked = false;
  final profileController = Get.put(ProfileController());
  final translationcontroller = Get.put(Translation());
  var controlle = Get.put(LoginController());

  var checkcntroller = Get.put(IntroductionController());

  @override
  Widget build(BuildContext context) {
    // Locale myLocale = Localizations.localeOf(context);
    var language = AppLocalizations.of(context);
    var size = MediaQuery.of(context).size;
    // profileController.lang.value = language!.arabic;
    translationcontroller.lang.value =
        translationcontroller.isArabic.value ? "ُEnglish" : "Arabic";
    //String en = language.english;
    String logout = language!.logout;

    var menuItem = [
      translationcontroller.lang.value,
      logout,
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        //leading: IconButton(icon: Icons.menu,onPressed: (){},),
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            const SizedBox(
              width: 25,
            ),
            Text(
              language.hrPanel,
              maxLines: 2,
              style: kTextStyle.copyWith(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return menuItem.map((String choice) {
              return PopupMenuItem(
                child: Text(choice),
                value: choice,
              );
            }).toList();
          }, onSelected: (item) {
            if (item == translationcontroller.lang.value) {
              if (item == 'Arabic') {
                log("**************************************************is arabic: ${translationcontroller.isArabic.value}");
                translationcontroller.isArabic.value = true;
                translationcontroller.setlanguage();
              } else {
                translationcontroller.isArabic.value = false;
                translationcontroller.setlanguage();
                log("********************************************is arabic: ${translationcontroller.isArabic.value}");
              }
            } else if (item == logout) {
              logOutDialog(context);
             
            }
          })
        ],
      ),
      // drawer: MenuHR(
      //     profileController: profileController, checkcntroller: checkcntroller),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height > 700 ? size.height + 40 : size.height + 60,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${greetingMessage(context)} ",
                      style: kTextStyle.copyWith(fontSize: 16),
                      // maxLines: 1,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //  const Spacer(),
                    timeOfTheDayIcon(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: profileController.profileModel.value.photo == null
                          ? 100
                          : 100.0,
                      backgroundColor: kMainColor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          "assets/images/profile.jpg",
                        ),
                        // Image.asset("assets/images/profile.jpg",),
                        // Image.memory(
                        //     base64Decode(
                        //       profileController.profileModel.value.photo!,
                        //     ),
                        //     height: double.infinity,
                        //     width: double.infinity,
                        //     fit: BoxFit.fill,
                        //   ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => Text(
                              " ${profileController.profileModel.value.fullNameEn ?? ""}",
                              style: kTextStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            // maxLines: 1,
                          ),
                        ],
                      ),
                      Obx(
                        () => Text(
                          " ${profileController.profileModel.value.jobTitle ?? ""}",
                          style: kTextStyle.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 16),
                          // maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    HrPanelWidget(
                      title: language.profile,
                      color: const Color(0xFF1CC389),
                      onTap: () {
                        print("taap");
                        Get.to(() => ProfileScreen());
                      },
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    HrPanelWidget(
                      title: language.services,
                      color: const Color(0xFFFD72AF),
                      onTap: () {
                        Get.to(() => RequestHistoriesScreen(false));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    HrPanelWidget(
                      title: language.overtime,
                      color: const Color(0xFF7C69EE),
                      onTap: () {
                        Get.to(() => OverTimeHistoriesScreen(false));
                      },
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    HrPanelWidget(
                      title: language.loans,
                      color: const Color(0xFFFF8919),
                      onTap: () {
                        Get.to(() => LoanHistoriesScreen(false));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    HrPanelWidget(
                      title: language.excuses,
                      color: const Color(0xFF4ACDF9),
                      onTap: () {
                        Get.to(() => ExcuseHistoriesScreen(false));
                      },
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    HrPanelWidget(
                      title: language.vacations,
                      color: const Color(0xFF02B984),
                      onTap: () {
                        Get.to(() => const VacationsScreen());
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> logOutDialog(BuildContext context) {
    var language = AppLocalizations.of(context);

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: const Icon(
                Icons.warning,
                color: Colors.red,
                size: 35.0,
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text(
                      language!.ensuredLogout,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: translationcontroller.isArabic.value
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Center(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                language.cancel,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 14),
                              ),
                            ),
                          ),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          onPressed: () async {
                            if (true) {
                              print(
                                  "before${StorageHelper.sharedPreferences!.getString(StorageKeys.fullName)}");
                              // checkcntroller.userdata.value
                              //     .write('isLogged', false);
                              StorageHelper.sharedPreferences!
                                  .remove(StorageKeys.userPhoto);
                              StorageHelper.sharedPreferences!
                                  .remove(StorageKeys.token);
                              StorageHelper.sharedPreferences!
                                  .remove(StorageKeys.fullName);
                              print(
                                  "after${StorageHelper.sharedPreferences!.getString(StorageKeys.fullName)}");
                              //StorageHelper.clear();
                              StorageHelper.set(StorageKeys.isLogged, "false");
                              Get.delete<ProfileController>();
                              Get.offAll(() => LoginScreen());
                              Get.deleteAll();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Text(
                                language.yes,
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }
}
