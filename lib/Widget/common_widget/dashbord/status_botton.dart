import 'package:GrandPolicy/utils/utile.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';

class StatusBotton extends StatelessWidget {
  const StatusBotton({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: getColor(status)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(" $status",
                style: kTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 12),
                maxLines: 2,
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
