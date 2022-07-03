import 'package:flutter/material.dart';

const Color dropdownItemColor = Color.fromARGB(255, 201, 230, 248);
const Color sendColor = Color.fromARGB(255, 0, 90, 163);
const Color mainColor2 = Color(0xff73BDEE);
const Color homeBackgroundColor = Color(0xffF0F3F8);
const Color pagesBackgroundColor = Color(0xffEDF5FA);
const Color mainColor = Color(0xff18A0FB);
//const appbarColor = Color(0xff18A0FB);

//////////////////////////////////////////////////
// const Color login1 = Color(0xff2a2a72);
// const Color login2 = Color(0xff009ffd);
const Color login1 = Color.fromARGB(255, 81, 124, 197);
const Color login2 = Color.fromARGB(255, 23, 123, 189);
const Color buttoncolor1 = Color(0xFFD4FCEE);
const Color boxColor1 = Color(0xff6A0FC4);
const Color boxColor2 = Color(0xffD998FA);
////////////////////////////////////////////nav color
// ignore: constant_identifier_names
const double ICON_OFF = -3;
// ignore: constant_identifier_names
const double ICON_ON = 0;
// ignore: constant_identifier_names
const double TEXT_OFF = 2;
// ignore: constant_identifier_names
const double TEXT_ON = 1;
// ignore: constant_identifier_names
const double ALPHA_OFF = 0;
// ignore: constant_identifier_names
const double ALPHA_ON = 1;
// ignore: constant_identifier_names
const int ANIM_DURATION = 300;
// ignore: constant_identifier_names
const Color PURPLE = Color(0xFF8c77ec);
////////////////////////////////////////////
Gradient buttonGradient = const LinearGradient(
  begin: Alignment(1.0, 1.0),
  end: Alignment(-1.0, -1.0),
  colors: [login1, login2],
  stops: [0.0, 1.0],
);
BoxShadow boxShadow = const BoxShadow(
  color: Colors.black12,
  offset: Offset(3, 3),
  blurRadius: 5,
);
BoxShadow transboxShadow = BoxShadow(
  color: Colors.white.withOpacity(0.0),
  offset: const Offset(3, 3),
  blurRadius: 5,
);
MaterialColor convertStatusToColor(String status) => status == "Approved"
    ? Colors.green
    : status == "Pending"
        ? Colors.grey
        : status == "Deleted"
            ? Colors.red
            : Colors.green;
