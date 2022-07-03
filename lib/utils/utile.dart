import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final currencyFormat = NumberFormat.simpleCurrency();
final currencyFormat2 = NumberFormat("#,##0.00", "en_US");

MaterialColor convertStatusToColor(String status) => status == "Pending"
    ? Colors.grey
    : status == "Approved"
        ? Colors.green
        : status == ""
            ? Colors.yellow
            : Colors.green;

DateTime getDate(String date) {
  return DateTime.parse(date);
}

String intialName(String? name) {
  //log("____________name_________$name");
  int firstSpace = name!.indexOf(" ");
  String secChar = "";

  String firstChar = name.substring(0, 1).toUpperCase();

  if (firstSpace + 1 < name.length) {
    secChar = name.substring(firstSpace + 1, firstSpace + 2).toUpperCase();
  }

  return firstChar + secChar;
}

String firstChar(String? name) {
  //log("____________name_________$name");
  int firstSpace = name!.indexOf(" ");
  String secChar = "";

  String firstChar = name.substring(0, 1).toUpperCase();

  if (firstSpace + 1 < name.length) {
    secChar = name.substring(firstSpace + 1, firstSpace + 1).toUpperCase();
  }

  return firstChar + secChar;
}

int daysBetween(DateTime from, DateTime to) {
  // from = DateTime(from.year, from.month, from.day);
  // to = DateTime(to.year, to.month, to.day);
  // return (to.difference(from).inHours / 24).round();

  return to.difference(from).inDays;
}

// ignore: non_constant_identifier_names
String DateTimeCast(DateTime date) {
  return "${date.day}/${date.month}/${date.year}";
}

// ignore: non_constant_identifier_names
DateTimeCastString(String dateFormat) {
  final date = DateTime.parse(dateFormat);

  return "${date.day}-${date.month}-${date.year}  ${date.hour}:${date.minute}";
}

getColor(
  String status,
) {
  if (status == "Pending") {
    return SYewllowColor;
  } else if (status.contains("Approved")) {
    return SGreenColor;
  } else if (status == "Deleted") {
    return kSRedColor;
  } else if (status.contains("Canceled") || status.contains("Cancel")) {
    return kSRedColor;
  } else if (status == "Sent") {
    return SOrangeColor;
  } else if (status == "Rejected by Direct Manager") {
    return kSRedxColor;
  } else {
    const Color.fromARGB(255, 63, 76, 82).withOpacity(1);
  }
}

//!
String greetingMessage(BuildContext context) {
  var language = AppLocalizations.of(context);
  var timeNow = DateTime.now().hour;

  if (timeNow <= 12) {
    return language!.goodMorning;
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return language!.goodAfternoon;
  } else if ((timeNow > 16) && (timeNow < 20)) {
    return language!.goodEvening;
  } else {
    return language!.goodNight;
  }
}

Icon timeOfTheDayIcon() {
  var timeNow = DateTime.now().hour;

  if (timeNow <= 12) {
    return const Icon(
      Icons.cloud,
      color: Colors.amber,
    );
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return const Icon(
      Icons.wb_sunny,
      color: Colors.orangeAccent,
    );
  } else if ((timeNow > 16) && (timeNow < 20)) {
    return const Icon(
      Icons.nightlight,
      color: Colors.blueAccent,
    );
  } else {
    return const Icon(
      Icons.nightlight_outlined,
      color: Colors.blueAccent,
    );
  }
}
