import 'package:flutter/material.dart';

import '../../../value/style.dart';

class GreyDashbordContainer extends StatelessWidget {
  const GreyDashbordContainer(
      {Key? key, required this.title, required this.detail})
      : super(key: key);
  final String title, detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10),
      child: Container(
        color: const Color(0xffF8F8F9),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              // style: const TextStyle(color: Colors.grey),
            ),
            Text(detail,
                style: kTextStyle.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
