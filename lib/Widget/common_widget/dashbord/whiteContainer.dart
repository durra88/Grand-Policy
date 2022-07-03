import 'package:flutter/material.dart';

import '../../../value/style.dart';

class WhiteDashbordContainer extends StatelessWidget {
  const WhiteDashbordContainer(
      {Key? key, required this.title, required this.detail})
      : super(key: key);
  final String title, detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            //style: const TextStyle(color: Colors.grey),
          ),
          Text(
            detail,
            style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
