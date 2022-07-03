import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';

Widget ListTileInfo({required String title, required IconData icon}) {
  return ListTile(
    leading: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: kMainColor),
      child: Icon(icon, color: Colors.white, size: 16),
    ),
    title: Text(
      title,
      style: titleProfileSTyle,
    ),
  );
}
