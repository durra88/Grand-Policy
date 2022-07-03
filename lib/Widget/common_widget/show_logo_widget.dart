import 'package:GrandPolicy/strings/sign_in_string.dart';
import 'package:flutter/material.dart';

class ShowLogoWidget extends StatelessWidget {
  const ShowLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 170,
                height: 150,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                singninString,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ]),
      ),
    ]);
  }
}
