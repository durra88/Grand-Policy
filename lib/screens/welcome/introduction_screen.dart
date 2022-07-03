import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import '../../controller/translation/translation.dart';
import '../login/login_screen.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  String buttonText = 'Next';
  double percent = 0.34;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  final translationcontroller = Get.put(Translation());

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);
    List<Map<String, dynamic>> sliderList = [
      {
        "icon": 'assets/animations/introductionOne.json',
        "title": language!.grandPolicy,
        "description": language.welcomeScreenDescriptionOne,
      },
      {
        "icon": 'assets/animations/introductionTwo.json',
        "title": language.grandPolicy,
        "description": language.welcomeScreenDescriptionOne,
      },
      {
        "icon": 'assets/animations/introductionThree.json',
        "title": language.grandPolicy,
        "description": language.welcomeScreenDescriptionOne,
      },
    ];

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF0FDFF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFCF1F0)),
        backgroundColor: const Color(0xFFF0FDFF),
        elevation: 0.0,
        actions: [
          const SizedBox(
            width: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      translationcontroller.isArabic.value =
                          !translationcontroller.isArabic.value;
                      translationcontroller.setlanguage();
                    },
                    child: const Center(
                        child: Image(
                            image:
                                AssetImage('assets/images/translateIcon.png'))),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      language.skip,
                      style: GoogleFonts.dmSans(
                        fontSize: 16.0,
                        color: kTitleColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 30.0,
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20),
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                itemCount: sliderList.length,
                controller: pageController,
                onPageChanged: (int index) =>
                    setState(() => currentIndexPage = index),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Lottie.asset(
                        sliderList[index]['icon'],
                        fit: BoxFit.fill,
                        width: 250,
                        height: 200,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 30.0,
                                    top: 15.0,
                                    bottom: 15.0),
                                child: Text(
                                  sliderList[index]['title'].toString(),
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.jost(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, right: 20.0),
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    width: size.width,
                                    child: Text(
                                      sliderList[index]['description']
                                          .toString(),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                      style: GoogleFonts.jost(
                                        fontSize: 15.0,
                                        color: kGreyTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DotIndicator(
                        currentDotSize: 15,
                        dotSize: 6,
                        pageController: pageController,
                        pages: sliderList,
                        indicatorColor: kMainColor,
                        unselectedIndicatorColor: Colors.grey,
                      ),
                    ),
                  ),
                  //  const Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularPercentIndicator(
                        radius: 80.0,
                        lineWidth: 3.0,
                        progressColor: kMainColor,
                        percent: percent,
                        animation: true,
                        center: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndexPage < 2
                                  ? percent = percent + 0.33
                                  : percent = 1.0;
                              currentIndexPage < 2
                                  ? pageController.nextPage(
                                      duration:
                                          const Duration(microseconds: 3000),
                                      curve: Curves.bounceInOut)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
                            });
                          },
                          child: const CircleAvatar(
                            radius: 35.0,
                            backgroundColor: kMainColor,
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
