import 'package:GrandPolicy/Widget/common_widget/dashbord/greycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common_widget/dashbord/note_container_white.dart';

class ExpandedOverTimeHistoryWidget extends StatelessWidget {
  const ExpandedOverTimeHistoryWidget({
    Key? key,
    required this.status,
    required this.year,
    required this.month,
    required this.noOfHours,
    required this.amount,
    required this.notes,
    required this.createdBy,
    required this.createdOn,
  }) : super(key: key);
  final String status,
      year,
      month,
      noOfHours,
      amount,
      notes,
      createdBy,
      createdOn;

  get kGreyTextColor => null;

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //?---------------------------------------------------------------status

        //?---------------------------------------------------------------no of hour
        GreyDashbordContainer(
          title: language!.noOfHours,
          detail: noOfHours,
        ),
        //?---------------------------------------------------------------Amount

        //?---------------------------------------------------------------notes
        NoteContainerWhite(title: language.note, notes: notes),
        //?---------------------------------------------------------------created by

        //?---------------------------------------------------------------created on

        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
