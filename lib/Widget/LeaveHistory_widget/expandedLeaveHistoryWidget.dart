import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common_widget/dashbord/greycontainer.dart';
import '../common_widget/dashbord/note_container_white.dart';
import '../common_widget/dashbord/note_container_grey.dart';
import '../common_widget/dashbord/whiteContainer.dart';

class ExpandedLeaveHistoryWidget extends StatelessWidget {
  const ExpandedLeaveHistoryWidget({
    Key? key,
    required this.status,
    required this.year,
    required this.month,
    required this.from,
    required this.to,
    required this.alternativeEmployes,
    required this.leaveReason,
    required this.contactDetails,
    required this.deductedFromBalance,
    required this.noOfDays,
    required this.savedBy,
    required this.savedDate,
    required this.backToWork,
  }) : super(key: key);
  final String status,
      year,
      month,
      from,
      to,
      alternativeEmployes,
      leaveReason,
      contactDetails,
      deductedFromBalance,
      noOfDays,
      savedBy,
      savedDate,
      backToWork;
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GreyDashbordContainer(
          title: language!.from,
          detail: from,
        ),

        //?------------------------------------------------------------------------------------------to

        WhiteDashbordContainer(
          title: language.to,
          detail: to,
        ),
        //?------------------------------------------------------------------------------------------No of Days
        GreyDashbordContainer(
          title: language.noOfDays,
          detail: noOfDays,
        ),

        //?------------------------------------------------------------------------------------------Alternative Employee
        NoteContainerWhite(
          title: language.alternativeEmployes,
          notes: alternativeEmployes,
        ),

        NoteContainerGrey(
          title: language.leaveReason,
          notes: leaveReason,
        ),

        NoteContainerWhite(
          title: language.contactDetails,
          notes: contactDetails,
        ),

        GreyDashbordContainer(
          title: language.deductedFromBalance,
          detail: deductedFromBalance,
        ),

        WhiteDashbordContainer(
          title: language.backToWork,
          detail: backToWork,
        ),
      ],
    );
  }
}
