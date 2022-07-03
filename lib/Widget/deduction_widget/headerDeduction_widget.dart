import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/utile.dart';

class HeaderDeductionWidget extends StatelessWidget {
  const HeaderDeductionWidget({
    Key? key,
    required this.item,
    required this.year,
    required this.date,
    required this.status,
  }) : super(key: key);

  final String item, year, date, status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
          )),
      title: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Text(
          item,
          style: kTextStyle,
        ),
      ),
      subtitle: Text(
        date,
        style: kTextStyle.copyWith(color: kGreyTextColor),
      ),
      trailing: Container(
        height: 40.0,
        width: 90.0,
        padding: const EdgeInsets.only(top: 4.0, left: 2, right: 2, bottom: 2),
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
    );

    //!
    //  Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               Container(
    //                 width: 50,
    //                 height: 50,
    //                 decoration: const BoxDecoration(
    //                     shape: BoxShape.circle, color: kMainColor),
    //                 child: const Center(
    //                   child: FaIcon(
    //                     (FontAwesomeIcons.dollarSign),
    //                     color: Colors.white,
    //                     size: 25,
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 20.0),
    //                 child: Text(
    //                   item,
    //                   style: GoogleFonts.manrope(
    //                       fontWeight: FontWeight.w500,
    //                       color: Colors.red,
    //                       fontSize: 18),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           StatusBotton(status: status),
    //           // Padding(
    //           //   padding: const EdgeInsets.only(right: 8),
    //           //   child: Container(
    //           //     decoration: BoxDecoration(
    //           //         borderRadius: BorderRadius.circular(5.0),
    //           //         color: getColor(status)),
    //           //     child: Center(
    //           //       child: Padding(
    //           //         padding: const EdgeInsets.only(
    //           //             right: 16, left: 16, top: 8, bottom: 8),
    //           //         child: Text(" $status",
    //           //             style: kTextStyle.copyWith(
    //           //                 color: Colors.white,
    //           //                 fontWeight: FontWeight.w800,
    //           //                 fontSize: 12),
    //           //             maxLines: 2,
    //           //             textAlign: TextAlign.center),
    //           //       ),
    //           //     ),
    //           //   ),
    //           // ),
    //           //! Text(
    //           //   date,
    //           //   style: kTextStyle,
    //           // ),
    //         ],
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 60.0),
    //         child: Row(children: [
    //           SizedBox(
    //             width: 200,
    //             height: 20,
    //             child: Text(
    //               date,
    //               style: const TextStyle(
    //                 fontWeight: FontWeight.w600,
    //                 color: kGreyTextColor,
    //                 fontSize: 14,
    //               ),
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //           // Row(
    //           //   mainAxisAlignment: MainAxisAlignment.end,
    //           //   children: [
    //           //     // Text(item, style: kTextStyle.copyWith(color: Colors.red)),
    //           //     Text(
    //           //       date,
    //           //       style: kTextStyle,
    //           //     ),
    //           //   ],
    //           // ),
    //         ]),
    //       )
    //     ]));
  }
}
