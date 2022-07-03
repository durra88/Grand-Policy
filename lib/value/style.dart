import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent,
//     statusBarIconBrightness: Brightness.dark,
class Style {
  TextStyle textStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  TextStyle titleStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  TextStyle headerStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.w900,
    fontSize: 14,
  );
}

//------------------------------------------------------------------------------------Introduction Style
TextStyle introductionTitleStyle = GoogleFonts.alatsi(
  color: const Color(0xFF020202),
  fontSize: 22.0,
);
TextStyle introductionBodyStyle = GoogleFonts.alata(
  color: const Color(0x75020202),
  fontSize: 16.0,
);

TextStyle introductionFooterStyle = GoogleFonts.alatsi(
  color: const Color(0x75020202),
  fontSize: 11.0,
);

//-------------------------------------------------------------profile style
TextStyle titleProfileSTyle = GoogleFonts.roboto(
  color: const Color(0xB9020202),
  fontWeight: FontWeight.w600,
  fontSize: 16.0,
);
TextStyle ProfileDetailsSTyle = GoogleFonts.alef(
    fontWeight: FontWeight.w300, fontSize: 16, color: const Color(0x8d100e0e));
//-----------------------------------------------------------------------------padding
const mainPadding = EdgeInsets.only(top: 15, left: 16, right: 16);

const containerPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 5);
//-----------------------------------------------------------------------------decoration Text
InputDecoration decorationText({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    ),
  );
}

InputDecoration decorationError({required String hintText}) {
  return InputDecoration.collapsed(
    hintText: hintText,
    hintStyle: const TextStyle(fontSize: 15),
    // contentPadding:
    //     const EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 3),
    // errorStyle: const TextStyle(
    //   fontSize: 11.0,
    //   letterSpacing: .5,
    // ),
    //  labelStyle: const TextStyle(color: Colors.grey),
    border: InputBorder.none,
  );
}

InputDecoration decorationNoteError({required String hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(fontSize: 15),
    contentPadding:
        const EdgeInsets.only(left: 11, right: 3, top: 200, bottom: 100),
    errorStyle: const TextStyle(
      height: 10,
      fontSize: 12.0,
      letterSpacing: .5,
    ),
    labelStyle: const TextStyle(color: Colors.grey),
    border: InputBorder.none,
  );
}

BoxDecoration dropdownDecoration = BoxDecoration(
    color: const Color(0xff73BDEE).withOpacity(0.2),
    borderRadius: BorderRadius.circular(5),
    border: Border.all(width: 1.5, color: Colors.white.withOpacity(0.1)));

//!/////////////////////////// new hr

const kMainColor = Color(0xFF567DF4);
const kGreyTextColor = Color.fromARGB(255, 109, 109, 128);
const kBorderColorTextField = Color(0xFFC2C2C2);
const kDarkWhite = Color(0xFFF1F7F7);
const kTitleColor = Color(0xFF22215B);
const kAlertColor = Color(0xFFFF8919);
const kBgColor = Color(0xFFFAFAFA);
const kHalfDay = Color(0xFFE8B500);
const kGreenColor = Color(0xFF08BC85);
//!container status
const kSRedColor = Color(0xFFff4d6d);
const kSRedxColor = Color.fromARGB(255, 240, 11, 53);
const kSYewllowColor = Color(0xffffd166);
const kSGreenColor = Color.fromARGB(255, 202, 243, 231);
//! status color
// ignore: constant_identifier_names
const SRedColor = Color.fromARGB(255, 163, 66, 66);
// ignore: constant_identifier_names
const SYewllowColor = Color(0xffffd166);
// ignore: constant_identifier_names
const SGreenColor = Color(0xff06d6a0);
const SOrangeColor = Color(0xFFFF8919);
// const kredColor = Color.fromARGB(80, 255, 25, 25);
// const kredColor = Color.fromARGB(80, 255, 25, 25);

final kTextStyle = GoogleFonts.manrope(
  color: kTitleColor,
);

const kButtonDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: kBorderColorTextField),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: kMainColor.withOpacity(0.1)),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);
