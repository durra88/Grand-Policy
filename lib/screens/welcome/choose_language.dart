import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';

import '../../controller/translation/translation.dart';
import '../../value/style.dart';
import 'introduction_screen.dart';

class ChooseLanguage extends StatelessWidget {
  ChooseLanguage({Key? key}) : super(key: key);

  //  final userdata = GetStorage();
  final money = NumberFormat("#,##0.00", "en_US");
  Translation languageController = Get.put(Translation());

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Choose language ',
          maxLines: 2,
          style: kTextStyle.copyWith(color: Colors.white, fontSize: 16.0),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            // const SizedBox(
            //   height: 10.0,
            // ),
            const Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Choose Prefered Language",
                style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Center(
              child: Text(
                "اختر اللغة المفضلة",
                style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Material(
                elevation: 2.0,
                child: GestureDetector(
                  onTap: () async {
                    languageController.isArabic.value = true;
                    languageController.setlanguage();
                    print('arabic');

                    const OnBoard().launch(context, isNewTask: true);
                  },
                  child: Container(
                    // width: context.width(),
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.blue,
                          width: 3.0,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Icon(Icons.abc, color: Colors.white),
                        ),
                        Center(
                          widthFactor: 1,
                          child: Text(
                            ' عربي',
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Material(
                elevation: 2.0,
                child: GestureDetector(
                  onTap: () async {
                    languageController.isArabic.value = false;

                    languageController.setlanguage();
                    print('english');

                    const OnBoard().launch(context, isNewTask: true);
                  },
                  child: Container(
                    // width: context.width(),
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.blue,
                          width: 3.0,
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Icon(Icons.abc, color: Colors.white),
                            ),
                            Center(
                              widthFactor: 1,
                              child: Text(
                                'ُ English',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

          
          ],
        ),
      ),
    );
  }
}
