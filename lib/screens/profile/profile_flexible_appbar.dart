import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../value/style.dart';

class ProfileFlexibleAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;

  String name, jobTitle, photo;

  ProfileFlexibleAppBar(this.name, this.jobTitle, this.photo);

  get kGreyTextColor => null;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: statusBarHeight, left: 50, right: 50),
      height: 150,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: ClipRRect(
                    child: Image.asset("assets/images/profile.jpg",
                        // Image.memory(base64Decode(photo),
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Text(name,
                  style: kTextStyle.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Text(jobTitle,
                    style: kTextStyle.copyWith(
                        color: kGreyTextColor, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      )),
      decoration: const BoxDecoration(
        color: kBgColor,
      ),
    );
  }

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }
}
