// ignore_for_file: avoid_unnecessary_containers

import 'package:GrandPolicy/controller/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class NameWidget extends StatelessWidget {
  String? name;
  LoginController controller;

  NameWidget({Key? key, required this.name, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Container(
      child: TextFormField(
        controller: controller.usernameTextController.value,
        decoration: InputDecoration(
          labelText: language!.name,
          hintText: language.name,
          //labelStyle: kTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return language.emptyField;
          }
          return null;
        },
      ),
    );
  }
}
