import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller/profile_controller.dart';
import '../../controller/translation/translation.dart';

class HrPanelWidget extends StatelessWidget {
  HrPanelWidget(
      {Key? key, required this.title, required this.color, required this.onTap})
      : super(key: key);
  final String title;
  final Color color;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
     final translationcontroller = Get.put(Translation());
    // ignore: unused_local_variable
    var language = AppLocalizations.of(context);
    bool isArabic =translationcontroller.isArabic.value;
    return Expanded(
      child: Material(
        elevation: 2.0,
        child: GestureDetector(
          onTap: () {
            //    const EmployeeManagement().launch(context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: isArabic
                  ? Border(
                      right: BorderSide(
                      color: color,
                      width: 3.0,
                    ))
                  : Border(
                      left: BorderSide(
                      color: color,
                      width: 3.0,
                    )),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: color, borderRadius: BorderRadius.circular(4)),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  //!
                  Text(
                    title,
                    style: kTextStyle.copyWith(
                        color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
