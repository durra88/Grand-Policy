import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller/profile_controller.dart';
import '../../controller/translation/translation.dart';
import '../../utils/utile.dart';

class HeaderVacationWidget extends StatelessWidget {
  const HeaderVacationWidget({
    Key? key,
    required this.vacationType,
    required this.EmpName,
    required this.status,

    //required this.overtimeController
  }) : super(key: key);
  final String vacationType, EmpName, status;
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
              intialName(EmpName),
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
              EmpName,
              style: kTextStyle,
            ),
          ),
          subtitle: Text(
            vacationType,
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
                      fontWeight: FontWeight.w800,
                      fontSize: 14),
                  maxLines: 2,
                  textAlign: TextAlign.center),
            ),
          ),
        )
      ],
    );
  }
}

class Common {}
