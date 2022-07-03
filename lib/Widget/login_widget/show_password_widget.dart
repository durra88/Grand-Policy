import 'package:GrandPolicy/controller/login_controller/login_controller.dart';
import 'package:GrandPolicy/strings/sign_in_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:get/get.dart';

class PasswordWidget extends StatelessWidget {
  String? password;
  LoginController controller;

  PasswordWidget({Key? key, required this.password, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Obx(() => TextFormField(
          controller: controller.passwordTextController.value,
          // style: const TextStyle(
          //     //  color: Colors.grey,
          //     ),
          decoration: InputDecoration(
            labelText: language!.password,
            // labelStyle: Colors.grey,
            hintText: passwordString,
            border: const OutlineInputBorder(),
            suffixIcon: GestureDetector(
              child: Icon(
                controller.obscureText.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey,
              ),
              onTap: () {
                controller.obscureText.value = !controller.obscureText.value;
              },
            ),
          ),
          obscureText: controller.obscureText.value,

          validator: (value) {
            if (value!.isEmpty) {
              return language.emptyField;
            }
            return null;
          },
          onSaved: (value) => password = value!.trim(),
        ));
  }
}
