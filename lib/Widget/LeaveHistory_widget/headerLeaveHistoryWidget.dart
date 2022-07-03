import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller/profile_controller.dart';
import '../../controller/translation/translation.dart';
import '../../utils/utile.dart';

class HeaderLeaveHistoryWidget extends StatelessWidget {
  const HeaderLeaveHistoryWidget({
    Key? key,
    required this.vacationType,
    required this.status,
    required this.year,
    required this.month,
    //required this.overtimeController
  }) : super(key: key);
  final String vacationType, status, month, year;
  //final OvertimeController overtimeController;
  @override
  Widget build(BuildContext context) {
    final translateController = Get.put(Translation());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: kMainColor),
            child: Center(
                child: Text(
              firstChar(vacationType),
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 25,
                color: Colors.white,
              ),
            )),
          ),
          title: FittedBox(
            alignment: translateController.isArabic.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(
              vacationType,
              style: kTextStyle,
            ),
          ),
          subtitle: Text(
            "${month}/${year}",
            style: kTextStyle.copyWith(color: kGreyTextColor),
          ),
          trailing: Container(
            height: 45.0,
            width: 90.0,
            padding:
                const EdgeInsets.only(top: 4.0, left: 2, right: 2, bottom: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: getColor(status),
            ),
            child: Center(
              child: Text(" $status",
                  style: kTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                  maxLines: 2,
                  textAlign: TextAlign.center),
            ),
          ),
        ),
      ],
    );

//!!!!
  }
}
