import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 50),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset('assets/animations/introductionTwo.json',
                width: 300, height: 240),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              " data is empty",
              style: GoogleFonts.actor(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ]),
    );
  }
}
