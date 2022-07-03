import 'package:GrandPolicy/Widget/profile/data_row.dart';
import 'package:GrandPolicy/controller/profile_controller/profile_controller.dart';
import 'package:GrandPolicy/screens/profile/profile_flexible_appbar.dart';
import 'package:GrandPolicy/value/colors.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Widget/common_widget/dashbord/greycontainer.dart';
import 'package:get/get.dart';
import '../../Widget/common_widget/dashbord/note_container_white.dart';
import '../../Widget/common_widget/dashbord/whiteContainer.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../Widget/common_widget/shimmer_widget.dart';
import '../../Widget/profile/listTile.dart';
import '../../controller/internet_connection/connectivity_controller.dart';
import '../../utils/utile.dart';
import 'edit_emergency.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  final profileController = Get.put(ProfileController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);
//profileController.profileModel.value.fullNameEn==null?Container():
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Get.back();
          }),
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            language!.profile,
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: (profileController.loadingData.value == true &&
                profileController.loadingImage.value == true &&
                profileController.loadingbloodType.value == true)
            ? const SimmerLoadingData()
            : Obx(
                () => SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //  height: MediaQuery.of(context).size.height * 2,
                        padding: const EdgeInsets.only(top: 10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                          color: kBgColor,
                        ),
                        child: connectivityController.connectionStatus.value ==
                                0
                            ? const CheckInternetWidget()
                            : Column(
                                children: [
                                  ProfileFlexibleAppBar(
                                      profileController
                                          .profileModel.value.fullNameEn!,
                                      profileController
                                          .profileModel.value.jobTitle!,
                                      profileController
                                          .profileModel.value.photo!),
                                  Container(
                                    width: double.infinity,

                                    //height: MediaQuery.of(context).size.height - 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(children: [
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      //      const Divider(thickness: 0.3, color: Colors.blue),
                                      ListTileTheme(
                                        contentPadding: const EdgeInsets.all(0),
                                        child: ExpansionTile(
                                          title: ListTileInfo(
                                            title: language.personalInfo,
                                            icon: Icons.person,
                                          ),
                                          children: [
                                            ListView(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                children: [
                                                  GreyDashbordContainer(
                                                      title: language.staffID,
                                                      detail:
                                                          "${profileController.profileModel.value.empNo}"),
                                                  WhiteDashbordContainer(
                                                      title:
                                                          language.oldStaffID,
                                                      detail:
                                                          "${profileController.profileModel.value.accessCardNo}"),
                                                  // const SizedBox(
                                                  //   height: 16,
                                                  // ),
                                                  // GreyDashbordContainer(
                                                  //     title: fullNameString,
                                                  //     detail:
                                                  //         " ${profileController.profileModel.value.fullNameEn}"),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16, bottom: 0),
                                                    child: Container(
                                                      color: const Color(
                                                          0xffF8F8F9),
                                                      width: double.infinity,
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 16, 10, 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            language.fullName,
                                                            // style: const TextStyle(color: Colors.grey),
                                                          ),
                                                          Text(
                                                              " ${profileController.profileModel.value.fullNameEn}",
                                                              style: kTextStyle.copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0, bottom: 10),
                                                    child: Container(
                                                      color: const Color(
                                                          0xffF8F8F9),
                                                      width: double.infinity,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          // Text(
                                                          //   title,
                                                          //   // style: const TextStyle(color: Colors.grey),
                                                          // ),
                                                          Text(
                                                            "${profileController.profileModel.value.fullNameAr}",
                                                            style: kTextStyle
                                                                .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            textAlign:
                                                                TextAlign.right,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  // WhiteDashbordContainer(
                                                  //     title: arabicFullNameString,
                                                  //     detail:
                                                  //         "${profileController.profileModel.value.fullNameAr}"),
                                                  // const SizedBox(
                                                  //   height: 16,
                                                  // ),
                                                  WhiteDashbordContainer(
                                                      title:
                                                          language.dateOfBirth,
                                                      detail:
                                                          "${profileController.profileModel.value.dateofBirth == null ? "" : DateTimeCastString(profileController.profileModel.value.dateofBirth!)}"),

                                                  GreyDashbordContainer(
                                                      title: language.gender,
                                                      detail:
                                                          "${profileController.profileModel.value.gender}"),
                                                  WhiteDashbordContainer(
                                                      title: language
                                                          .maritalStatus,
                                                      detail:
                                                          "${profileController.profileModel.value.maritalStatus}"),
                                                  GreyDashbordContainer(
                                                      title:
                                                          language.nationality,
                                                      detail:
                                                          "${profileController.profileModel.value.nationality}"),
                                                  // const SizedBox(
                                                  //   height: 16,
                                                  // ),
                                                  WhiteDashbordContainer(
                                                      title: language.religion,
                                                      detail:
                                                          "${profileController.profileModel.value.religionEn}"),

                                                  // const SizedBox(
                                                  //   height: 16,
                                                  // ),
                                                  GreyDashbordContainer(
                                                      title: language.extention,
                                                      detail:
                                                          "${profileController.profileModel.value.extension}"),

                                                  WhiteDashbordContainer(
                                                      title: language.tele,
                                                      detail:
                                                          "${profileController.profileModel.value.tele}"),
                                                  GreyDashbordContainer(
                                                      title: language.mobile,
                                                      detail:
                                                          "${profileController.profileModel.value.mobile}"),
                                                  // const SizedBox(
                                                  //   height: 16,
                                                  // ),

                                                  // const SizedBox(
                                                  //   height: 16,
                                                  // ),
                                                  WhiteDashbordContainer(
                                                      title: language.faxNo,
                                                      detail:
                                                          "${profileController.profileModel.value.fax}"),
                                                  GreyDashbordContainer(
                                                      title: language.email,
                                                      detail:
                                                          "${profileController.profileModel.value.email}"),
                                                  WhiteDashbordContainer(
                                                      title: language.sponsor,
                                                      detail:
                                                          "${profileController.profileModel.value.sponsor}"),
                                                  GreyDashbordContainer(
                                                      title: language.gosiNo,
                                                      detail:
                                                          "${profileController.profileModel.value.gosiNo}"),

                                                  NoteContainerWhite(
                                                    title: language.address,
                                                    notes: profileController
                                                        .profileModel
                                                        .value
                                                        .address!,
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ),
                                      ListTileTheme(
                                        contentPadding: const EdgeInsets.all(0),
                                        child: ExpansionTile(
                                          title: ListTileInfo(
                                            title: language.jobDetails,
                                            icon: FontAwesomeIcons.briefcase,
                                          ),
                                          children: [
                                            ListView(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                children: [
                                                  GreyDashbordContainer(
                                                      title: language.branch,
                                                      detail:
                                                          "${profileController.profileModel.value.branch}"),
                                                  WhiteDashbordContainer(
                                                      title:
                                                          language.department,
                                                      detail:
                                                          "${profileController.profileModel.value.fullNameEn}"),
                                                  GreyDashbordContainer(
                                                      title: language.jobTitle,
                                                      detail:
                                                          "${profileController.profileModel.value.jobTitle}"),
                                                  WhiteDashbordContainer(
                                                      title: language.hireDate,
                                                      detail:
                                                          "${profileController.profileModel.value.hireDate == null ? "" : DateTimeCastString(profileController.profileModel.value.hireDate!)}"),
                                                  GreyDashbordContainer(
                                                      title: language.division,
                                                      detail:
                                                          "${profileController.profileModel.value.department}"),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ),
                                      //  const Divider(thickness: 0.3, color: Colors.blue),
                                      ListTileTheme(
                                        contentPadding: const EdgeInsets.all(0),
                                        child: ExpansionTile(
                                          title: ListTileInfo(
                                            title: language.labourCard,
                                            icon: FontAwesomeIcons.addressCard,
                                          ),
                                          children: [
                                            ListView(
                                              scrollDirection: Axis.vertical,
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              shrinkWrap: true,
                                              children: [
                                                GreyDashbordContainer(
                                                    title: language.staffCardNo,
                                                    detail:
                                                        "${profileController.profileModel.value.labourStaffCardNo}"),
                                                WhiteDashbordContainer(
                                                    title: language.companyNo,
                                                    detail:
                                                        "${profileController.profileModel.value.labourCompanyNo}"),
                                                GreyDashbordContainer(
                                                    title: language.issuePlace,
                                                    detail:
                                                        "${profileController.profileModel.value.labourIssuePlace}"),
                                                WhiteDashbordContainer(
                                                    title: language.issueDate,
                                                    detail:
                                                        "${profileController.profileModel.value.labourIssueDate == null ? "" : DateTimeCastString(profileController.profileModel.value.labourIssueDate!)}"),
                                                GreyDashbordContainer(
                                                    title: language.expiryDate,
                                                    detail:
                                                        "${profileController.profileModel.value.labourExDate == null ? "" : DateTimeCastString(profileController.profileModel.value.labourExDate!)}"),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // const Divider(thickness: 0.3, color: Colors.blue),
                                      ListTileTheme(
                                        contentPadding: const EdgeInsets.all(0),
                                        child: ExpansionTile(
                                          title: ListTileInfo(
                                            title: language.idDetails,
                                            icon: FontAwesomeIcons.idBadge,
                                          ),
                                          children: [
                                            ListView(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                children: [
                                                  GreyDashbordContainer(
                                                      title: language.idNo,
                                                      detail:
                                                          "${profileController.profileModel.value.idNo}"),
                                                  WhiteDashbordContainer(
                                                      title:
                                                          language.issuePlace,
                                                      detail:
                                                          "${profileController.profileModel.value.idIssuePlace}"),
                                                  // GreyDashbordContainer(
                                                  //     title: idIssuePlaceArabicString,
                                                  //     detail:
                                                  //         "${profileController.profileModel.value.idIssuePlaceAr}"),
                                                  GreyDashbordContainer(
                                                      title: language.issueDate,
                                                      detail:
                                                          "${profileController.profileModel.value.idIssueDate == null ? "" : DateTimeCastString(profileController.profileModel.value.idIssueDate!)}"),
                                                  WhiteDashbordContainer(
                                                      title:
                                                          language.expiryDate,
                                                      detail:
                                                          "${profileController.profileModel.value.idExDate == null ? "" : DateTimeCastString(profileController.profileModel.value.idExDate!)}"),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                ]),
                                          ],
                                        ),
                                      ),
                                      //  const Divider(thickness: 0.3, color: Colors.blue),
                                      ListTileTheme(
                                        contentPadding: const EdgeInsets.all(0),
                                        child: ExpansionTile(
                                          title: ListTileInfo(
                                            title: language.passportDetails,
                                            icon:
                                                FontAwesomeIcons.planeDeparture,
                                          ),
                                          children: [
                                            ListView(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                children: [
                                                  GreyDashbordContainer(
                                                      title:
                                                          language.passportNo,
                                                      detail:
                                                          "${profileController.profileModel.value.passportNo}"),
                                                  WhiteDashbordContainer(
                                                      title:
                                                          language.issuePlace,
                                                      detail:
                                                          "${profileController.profileModel.value.passIssuePlace}"),
                                                  // GreyDashbordContainer(
                                                  //     title:
                                                  //         passportIssuePlaceArabicString,
                                                  //     detail:
                                                  //         "${profileController.profileModel.value.passIssuePlaceAr}"),
                                                  GreyDashbordContainer(
                                                      title: language.issueDate,
                                                      detail:
                                                          "${profileController.profileModel.value.passIssueDate == null ? "" : DateTimeCastString(profileController.profileModel.value.passIssueDate!)}"),
                                                  WhiteDashbordContainer(
                                                      title:
                                                          language.expiryDate,
                                                      detail: profileController
                                                          .profileModel
                                                          .value
                                                          .passExpiryDateHijri!),
                                                  const SizedBox(
                                                    height: 16,
                                                  )
                                                ]),
                                          ],
                                        ),
                                      ),
                                      // const Divider(thickness: 0.3, color: Colors.blue),
                                      ListTileTheme(
                                        contentPadding: const EdgeInsets.all(0),
                                        child: ExpansionTile(
                                          title: ListTileInfo(
                                            title: language.salaryDetails,
                                            icon:
                                                FontAwesomeIcons.commentDollar,
                                          ),
                                          children: [
                                            ListView(
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                children: [
                                                  GreyDashbordContainer(
                                                      title:
                                                          language.basicSalary,
                                                      detail: profileController
                                                                  .profileModel
                                                                  .value
                                                                  .salaryBS ==
                                                              null
                                                          ? ""
                                                          : currencyFormat2.format(
                                                              profileController
                                                                  .profileModel
                                                                  .value
                                                                  .salaryBS)),
                                                  WhiteDashbordContainer(
                                                      title: language
                                                          .housingAllowance,
                                                      detail: profileController
                                                                  .profileModel
                                                                  .value
                                                                  .salaryHA ==
                                                              null
                                                          ? ""
                                                          : currencyFormat2.format(
                                                              profileController
                                                                  .profileModel
                                                                  .value
                                                                  .salaryHA)),
                                                  GreyDashbordContainer(
                                                      title: language
                                                          .transportationAllowance,
                                                      detail: profileController
                                                                  .profileModel
                                                                  .value
                                                                  .salaryTA ==
                                                              null
                                                          ? ""
                                                          : currencyFormat2.format(
                                                              profileController
                                                                  .profileModel
                                                                  .value
                                                                  .salaryTA)),
                                                  WhiteDashbordContainer(
                                                      title: language
                                                          .otherAllowance,
                                                      detail: profileController
                                                                  .profileModel
                                                                  .value
                                                                  .others ==
                                                              null
                                                          ? ""
                                                          : currencyFormat2.format(
                                                              profileController
                                                                  .profileModel
                                                                  .value
                                                                  .others)),
                                                  GreyDashbordContainer(
                                                      title:
                                                          language.totalSalary,
                                                      detail: profileController
                                                                  .profileModel
                                                                  .value
                                                                  .totalSalary ==
                                                              null
                                                          ? ""
                                                          : currencyFormat2.format(
                                                              profileController
                                                                  .profileModel
                                                                  .value
                                                                  .totalSalary)),
                                                ]),
                                          ],
                                        ),
                                      ),
                                      //?-----------------------------------------------------------------------------------------------------------------------------------------medical info

                                      //    const Divider(thickness: 0.3, color: Colors.blue),
                                      Column(
                                        children: [
                                          ListTileTheme(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            child: ExpansionTile(
                                              title: ListTileInfo(
                                                title: language.medicalInfo,
                                                icon: FontAwesomeIcons.firstAid,
                                              ),
                                              children: [
                                                ListView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    physics:
                                                        const ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    children: [
                                                      NoteContainerWhite(
                                                          title: language
                                                              .bloodType,
                                                          notes:
                                                              "${profileController.profileModel.value.bloodType}"),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                          title: language
                                                              .doctorsName,
                                                          notes:
                                                              "${profileController.profileModel.value.doctorName}"),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                        title: language.address,
                                                        notes: profileController
                                                            .profileModel
                                                            .value
                                                            .doctorAddress!,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                        title: language
                                                            .contactDetails,
                                                        notes: profileController
                                                            .profileModel
                                                            .value
                                                            .doctorPhoneNo!,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                        title: language
                                                            .medicalConditions,
                                                        notes: profileController
                                                            .profileModel
                                                            .value
                                                            .medicalConditions!,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                        title:
                                                            language.allergies,
                                                        notes: profileController
                                                            .profileModel
                                                            .value
                                                            .allergies!,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                        title: language
                                                            .currentMedications,
                                                        notes: profileController
                                                            .profileModel
                                                            .value
                                                            .currentMedications!,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 18,
                                                                  left: 8,
                                                                  right: 8),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: kMainColor,
                                                              //   gradient: buttonGradient,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              boxShadow: [
                                                                transboxShadow
                                                              ],
                                                            ),
                                                            // color: mainColor,
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        12),
                                                            child: InkWell(
                                                              onTap: () {
                                                                profileController
                                                                    .fillData();
                                                                profileController
                                                                    .isVisibleMedical
                                                                    .value = true;
                                                                profileController
                                                                    .enterMedical
                                                                    .value = true;
                                                                profileController
                                                                    .isVisibleEmergency
                                                                    .value = false;
                                                                profileController
                                                                    .enterEmergency
                                                                    .value = false;
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder: (context) => EditEmergencyDetails(profileController
                                                                            .profileModel
                                                                            .value)));

                                                                // Get.to(() {
                                                                //   EditEmergencyDetails();
                                                                // });
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child: Text(
                                                                        language
                                                                            .edit,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              255,
                                                                              255),
                                                                        )),
                                                                  ),
                                                                  //?---------------------------botton
                                                                  const Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child:
                                                                        FaIcon(
                                                                      (FontAwesomeIcons
                                                                          .userEdit),
                                                                      size: 14,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                      const SizedBox(
                                                        height: 18,
                                                      )
                                                    ]),
                                              ],
                                            ),
                                          ),
//?-----------------------------------------------------------------------------------------------------------------------------------------emergency conttacts
                                          // const Divider(thickness: 0.3, color: Colors.blue),
                                          ListTileTheme(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            child: ExpansionTile(
                                              title: ListTileInfo(
                                                title:
                                                    language.emergencyContact,
                                                icon:
                                                    FontAwesomeIcons.idCardAlt,
                                              ),
                                              children: [
                                                ListView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    physics:
                                                        const ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    children: [
                                                      NoteContainerWhite(
                                                          title: language
                                                              .emergencyName,
                                                          notes:
                                                              "${profileController.profileModel.value.emergContactName}"),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                        title: language
                                                            .emergencyRelation,
                                                        notes: profileController
                                                            .profileModel
                                                            .value
                                                            .emergContactRelationship!,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                        title: language.address,
                                                        notes: profileController
                                                            .profileModel
                                                            .value
                                                            .emergContactAddress!,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      NoteContainerWhite(
                                                        title: language
                                                            .contactDetails,
                                                        notes: profileController
                                                            .profileModel
                                                            .value
                                                            .emergContactPhone!,
                                                      ),
                                                      const SizedBox(
                                                        height: 40,
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 18,
                                                                  left: 8,
                                                                  right: 8),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: kMainColor,
                                                              //   gradient: buttonGradient,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              boxShadow: [
                                                                transboxShadow
                                                              ],
                                                            ),
                                                            // color: mainColor,
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        12),
                                                            child: InkWell(
                                                              onTap: () {
                                                                profileController
                                                                    .fillData();
                                                                connectivityController
                                                                        .status
                                                                        .value =
                                                                    false;

                                                                profileController
                                                                    .isVisibleEmergency
                                                                    .value = true;
                                                                profileController
                                                                    .enterEmergency
                                                                    .value = true;
                                                                ////////
                                                                profileController
                                                                    .isVisibleMedical
                                                                    .value = false;
                                                                profileController
                                                                    .enterMedical
                                                                    .value = false;
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder: (context) => EditEmergencyDetails(profileController
                                                                            .profileModel
                                                                            .value)));
                                                                // Get.to(() {
                                                                //   EditEmergencyDetails();
                                                                // });
                                                              },
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child: Text(
                                                                        language
                                                                            .edit,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              255,
                                                                              255),
                                                                        )),
                                                                  ),
                                                                  //?---------------------------botton
                                                                  const Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8.0),
                                                                    child:
                                                                        FaIcon(
                                                                      (FontAwesomeIcons
                                                                          .userEdit),
                                                                      size: 14,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          )),
                                                      const SizedBox(
                                                        height: 30,
                                                      )
                                                    ]),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      //const Divider(thickness: 0.3, color: Colors.blue),
                                      const SizedBox(
                                        height: 90.0,
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}

Widget buildRows(text1, text2) {
  return DataRows(text1: text1, text2: text2);
}
