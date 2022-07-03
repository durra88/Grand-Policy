import 'package:flutter/material.dart';

import '../common_widget/dashbord/greycontainer.dart';
import '../common_widget/dashbord/note_container_grey.dart';
import '../common_widget/dashbord/whiteContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExpandedExcuseHistoryWidget extends StatelessWidget {
  const ExpandedExcuseHistoryWidget({
    Key? key,
    required this.SNo,
    required this.status,
    required this.excuseType,
    required this.excuseFrom,
    required this.from,
    required this.to,
    required this.hours,
    required this.leaveReason,
    required this.backToWork,
    required this.backToWorkTime,
  }) : super(key: key);
  final String SNo,
      status,
      excuseType,
      excuseFrom,
      from,
      to,
      hours,
      leaveReason,
      backToWorkTime,
      backToWork;

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        NoteContainerGrey(
          title: language!.excuseFrom,
          notes: excuseFrom,
        ),
        WhiteDashbordContainer(
          title: language.from,
          detail: from,
        ),
        GreyDashbordContainer(
          title: language.to,
          detail: to,
        ),
        WhiteDashbordContainer(
          title: language.noOfHours,
          detail: hours,
        ),
        NoteContainerGrey(
          title: language.leaveReason,
          notes: leaveReason,
        ),
        WhiteDashbordContainer(
          title: language.backToWorkTime,
          detail: backToWorkTime,
        ),
      ],
    );
  }
}
