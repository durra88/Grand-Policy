// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
// import 'package:multi_select_flutter/util/multi_select_item.dart';

// // ignore: must_be_immutable
// class MultiSelectionWidget extends StatelessWidget {
//   MultiSelectionWidget({
//     Key? key,
//     required this.items,
//     required this.selectedList,
//   }) : super(key: key);

//   late List<MultiSelectItem> items;
//   late List selectedList;

//   // final RequestServicesController requestServicesController;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15, left: 16, right: 16, bottom: 15),
//       child: MultiSelectDialogField(
//         items: items,
//         title: const Text("Employees"),
//         selectedColor: Colors.blue,
//         decoration: BoxDecoration(
//           color: Colors.blue.withOpacity(0.1),
//           borderRadius: const BorderRadius.all(Radius.circular(5)),
//           border: Border.all(
//             color: const Color.fromARGB(255, 183, 211, 235),
//             width: 2,
//           ),
//         ),
//         buttonIcon: const Icon(
//           Icons.supervised_user_circle,
//           color: Color.fromARGB(255, 104, 144, 177),
//         ),
//         buttonText: Text(
//           "Inform To",
//           style: TextStyle(
//             color: Colors.blue[800],
//             fontSize: 16,
//           ),
//         ),
//         onConfirm: (List<dynamic> results) {
//           selectedList = results;
//         },
//       ),
//     );
//   }
// }
