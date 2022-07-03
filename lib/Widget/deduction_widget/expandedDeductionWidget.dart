// ignore: file_names
import 'package:GrandPolicy/Widget/common_widget/dashbord/whiteContainer.dart';
import 'package:GrandPolicy/strings/deduction_history_string.dart';
import 'package:flutter/material.dart';

import '../../value/style.dart';

class ExpandedDeductionWidget extends StatelessWidget {
  const ExpandedDeductionWidget({
    Key? key,
    required this.reason,
    required this.noOfDaysHours,
    required this.amount,
    required this.note,
    required this.createdBy,
    required this.createdOn,
    required this.status,
  }) : super(key: key);
  final String reason,
      noOfDaysHours,
      amount,
      note,
      createdBy,
      createdOn,
      status;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //?---------------------------------------------------------------reason
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 10),
          child: Container(
            color: const Color(0xffF8F8F9),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  reasonString,
                  //  style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        reason,
                        style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 3,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // GreyDashbordContainer(
        //   title: reasonString,
        //   detail: reason,
        // ),
        //?---------------------------------------------------------------status

        // WhiteDashbordContainer(
        //   title: statusString,
        //   detail: status,
        // ),
        //?---------------------------------------------------------------no of hour/days
        WhiteDashbordContainer(
          title: noOfDaysHoursString,
          detail: noOfDaysHours,
        ),
//?---------------------------------------------------------------ammount
        // GreyDashbordContainer(
        //   title: amountString,
        //   detail: amount,
        // ),
//?---------------------------------------------------------------note

        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 10),
          child: Container(
            color: const Color(0xffF8F8F9),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  noteString,
                  // style: kTextStyle.copyWith(color: kGreyTextColor),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        note,
                        style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 3,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        //?---------------------------------------------------------------Created by
        // WhiteDashbordContainer(
        //   title: createdByString,
        //   detail: createdBy,
        // ),
        //?---------------------------------------------------------------Created on
        // GreyDashbordContainer(
        //   title: createdOnString,
        //   detail: createdOn,
        // ),

        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
