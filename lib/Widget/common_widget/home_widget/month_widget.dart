import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import '../../../value/style.dart';

// ignore: must_be_immutable
class MonthWidget extends StatelessWidget {
  const MonthWidget({
    this.validate,
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.onChange,
    required this.controller,

    // required this.dateKey
  }) : super(key: key);
  final String hintText, labelText;
  final void Function(String) onChange;
  final TextEditingController controller;
// final GlobalKey dateKey;
  final String Function(String)? validate;
// final GlobalKey dateKey;
  @override
  Widget build(BuildContext context) {
    //final overtimeController = Get.put(OvertimeController());
    return DateTimePicker(
      controller: controller,
      dateMask: 'yyyy/MM/dd',
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      icon: const Icon(
        Icons.event,
        color: Color(0xff18A0FB),
      ),

      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Icon(
            Icons.date_range_rounded,
            color: kGreyTextColor,
          ),
          labelText: labelText,
          hintText: hintText),

      //dateHintText: hintText,
      onChanged: (val) {
        onChange(val);

        //   print("overtime date $val");
        // var datetime = DateTime.parse(val);
        // overtimeController.overtimeyear.value = datetime.year.toString();
        // overtimeController.overtimeMonth.value =
        //     datetime.month.toString();
      },
      validator: (val) {
        if (val!.isEmpty) {
          return "this field is required!";
        }

        validate!(val);
        return null;
      },
    );
  }
}
