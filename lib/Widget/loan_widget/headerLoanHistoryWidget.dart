import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/translation/translation.dart';
import '../../utils/utile.dart';
import '../../value/style.dart';

class HeaderLoanHistoryWidget extends StatelessWidget {
  const HeaderLoanHistoryWidget({
    Key? key,
    required this.amount,
    required this.status,
    required this.year,
    required this.month,
    //required this.overtimeController
  }) : super(key: key);
  final String amount, status, month, year;
  //final OvertimeController overtimeController;
  @override
  Widget build(BuildContext context) {
    final translateController = Get.put(Translation());

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: kMainColor),
          child: const Center(
            child: FaIcon(
              (FontAwesomeIcons.dollarSign),
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
        title: FittedBox(
          alignment: translateController.isArabic.value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            amount,
            style: kTextStyle,
          ),
        ),
        subtitle: Text(
          " $month - $year",
          style: kTextStyle.copyWith(color: kGreyTextColor),
        ),
        trailing: Container(
          height: 40.0,
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
    ]);
    //!
  }
}
