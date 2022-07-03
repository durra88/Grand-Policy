import 'dart:convert';

import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller/introduction_controller.dart';
import '../../controller/profile_controller/profile_controller.dart';
import '../../utils/storage/storage_helper.dart';
import '../../utils/storage/storage_keys.dart';
import '../login/login_screen.dart';
import '../profile/profile_screen.dart';

class MenuHR extends StatelessWidget {
  const MenuHR({
    Key? key,
    required this.profileController,
    required this.checkcntroller,
  }) : super(key: key);

  final ProfileController profileController;
  final IntroductionController checkcntroller;

  @override
  Widget build(BuildContext context) {
    // String? photo = StorageHelper.get(StorageKeys.userPhoto) as String?;

    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
              color: kMainColor,
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Obx(() => Column(
                          children: [
                            CircleAvatar(
                              radius: 60.0,
                              backgroundColor: Colors.white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: profileController
                                            .profileModel.value.photo ==
                                        null
                                    ? const Icon(
                                        Icons.person,
                                        color: kGreyTextColor,
                                        size: 90,
                                      )
                                    : Image.memory(
                                        base64Decode(
                                          profileController
                                              .profileModel.value.photo!,
                                        ),
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                            Text(
                              profileController.profileModel.value.fullNameEn ==
                                      null
                                  ? ""
                                  : profileController
                                      .profileModel.value.fullNameEn!,
                              style: kTextStyle.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              profileController.profileModel.value.jobTitle ==
                                      null
                                  ? ""
                                  : profileController
                                      .profileModel.value.jobTitle!,
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ],
                        )),
                    // .onTap(() {
                    //   // const ProfileScreen().launch(context);
                    // }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(() => ProfileScreen());
                },
                leading: const Icon(
                  Icons.person,
                  color: kGreyTextColor,
                  size: 30,
                ),
                title: Text(
                  'Profile',
                  style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: kGreyTextColor,
                ),
              ),

              ListTile(
                onTap: () {
                  //     const PricingScreen().launch(context);
                },
                leading: const Icon(
                  Icons.policy_outlined,
                  color: kGreyTextColor,
                  size: 30,
                  //color: kGreyTextColor,
                ),
                title: Text(
                  'Terms & Conditions',
                  style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: kGreyTextColor,
                ),
              ),
              ListTile(
                onTap: () {
                  //    const EmptyHoliday().launch(context);
                },
                leading: const Icon(
                  Icons.info_outline,
                  color: kGreyTextColor,
                  size: 30,
                ),
                title: Text(
                  'About us',
                  style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: kGreyTextColor,
                ),
              ),
              // ListTile(
              // onTap: () {
              //   //   const EmptyHoliday().launch(context);
              // },
              //   leading: const Icon(
              //     FontAwesomeIcons.idBadge,
              //     color: kGreyTextColor,
              //   ),
              //   title: Text(
              //     'ID Details',
              //     style: kTextStyle.copyWith(color: kGreyTextColor),
              //   ),
              //   trailing: const Icon(
              //     Icons.arrow_forward_ios,
              //     color: kGreyTextColor,
              //   ),
              // ),
              ListTile(
                onTap: () {
                  // setState(() {
                  //   //        Share.share('check out This Awesome HRM');
                  // });
                },
                leading: const Icon(
                  Icons.contact_page_outlined,
                  color: kGreyTextColor,
                  size: 30,
                ),
                title: Text(
                  'Contact us',
                  style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: kGreyTextColor,
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
          const Spacer(),
          //?--------------------------------------------------------------------------LogOUt

          Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            title: const Icon(
                              Icons.warning,
                              color: Colors.red,
                              size: 35.0,
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                children: const <Widget>[
                                  Text(
                                    ' Are you sure do you want to logout',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
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
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14),
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0))),
                                        ),
                                        onPressed: () async {
                                          if (true) {
                                            // checkcntroller.userdata.value
                                            //     .write('isLogged', false);
                                            StorageHelper.sharedPreferences!
                                                .remove(StorageKeys.userPhoto);
                                            StorageHelper.sharedPreferences!
                                                .remove(StorageKeys.token);
                                            StorageHelper.sharedPreferences!
                                                .remove(StorageKeys.fullName);
                                            StorageHelper.set(
                                                StorageKeys.isLogged, "false");

                                            //StorageHelper.clear();

                                            Get.offAll(LoginScreen());
                                          }
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Center(
                                            child: Text(
                                              'yes',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 14),
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
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        color: kGreyTextColor,
                      ),
                      const SizedBox(
                        width: 35.0,
                      ),
                      Text(
                        'Logout',
                        style: kTextStyle.copyWith(color: kGreyTextColor),
                      ),
                    ],
                  ),
                ),
              )),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 16),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           const Icon(
          //             Icons.logout_sharp,
          //             color: Colors.white,
          //           ),
          //           const SizedBox(
          //             width: 30,
          //           ),
          //           Text(
          //             'Logout ',
          //             style: GoogleFonts.abel(
          //                 fontSize: 18,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w900),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
