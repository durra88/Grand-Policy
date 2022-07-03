import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatelessWidget {
  DropDownWidget({
    Key? key,
    //required selectedValue,
    required this.hintText,
    required this.selectedDropdownValue,
    required this.lableText,
    required this.callback,
    required this.listOfModel,
  }) : super(key: key);
  String hintText, lableText, selectedDropdownValue;
  final void Function(String) callback;
  // final RequestServicesController requestServicesController;
  // ignore: prefer_typing_uninitialized_variables
  var _selectedValue;
  var listOfModel = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);
    return Obx(() => SizedBox(
          height: 60.0,
          child: SizedBox(
            height: 60,
            child: DropdownButtonFormField<String>(
              // dropdownColor: dropdownItemColor,
              // style: const TextStyle(
              //     fontWeight: FontWeight.w600, color: Color(0xFF35484E)),
              hint: Text(
                hintText,
                // style: const TextStyle(
                //     fontWeight: FontWeight.w600, color: Color(0xFF35484E)),
              ),

              autovalidateMode: AutovalidateMode.onUserInteraction,

              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  labelText: lableText,
                  hintText: hintText,
                  //labelStyle: kTextStyle,
                  errorMaxLines: 2,
                  // errorBorder: OutlineInpu)tBorder(
                  //     borderRadius: BorderRadius.circular(5.0), gapPadding: 50),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),

              value: selectedDropdownValue == "" ||
                      !listOfModel.any(
                          (element) => element.name == selectedDropdownValue)
                  ? _selectedValue
                  : selectedDropdownValue,
              validator: (value) {
                if (value == null) {
                  return language!.emptyField;
                }
                return null;
              },
              onChanged: (newValue) {
                FocusScope.of(context).requestFocus(FocusNode());
                callback(newValue!);
                selectedDropdownValue = newValue;
              },

              items: listOfModel.map((requestTypeItem) {
                return DropdownMenuItem<String>(
                  value: requestTypeItem.name,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      requestTypeItem.name!,
                      // style: const TextStyle(
                      // fontWeight: FontWeight.w600,
                      // color: Color(0xFF35484E))
                    ),
                  ),
                );
              }).toList(),

              // add extra sugar..
              // icon: Icon(
              //   Icons.arrow_drop_down,
              //   color: Colors.black.withOpacity(0.6),
              // ),
              // iconSize: 30,
              isExpanded: true,
              // underline: const SizedBox(),
            ),
          ),
        ));
  }
}
