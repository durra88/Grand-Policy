import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common_widget/dashbord/note_container_grey.dart';
import '../common_widget/dashbord/whiteContainer.dart';

class ExpandedRequestServicesWidget extends StatelessWidget {
  const ExpandedRequestServicesWidget({
    Key? key,
    required this.sNo,
    required this.status,
    required this.employeeNo,
    required this.employeeName,
    required this.requestType,
    required this.requestDetails,
    required this.requestDepartment,
    required this.replyType,
    required this.replyInfo,
    required this.savedBy,
    required this.savedDate,
  }) : super(key: key);
  final String sNo,
      status,
      employeeNo,
      requestType,
      employeeName,
      requestDetails,
      requestDepartment,
      replyType,
      replyInfo,
      savedBy,
      savedDate;
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //?------------------------------------------------------------------------------------------Status

        //?------------------------------------------------------------------------------------------Request Details

        NoteContainerGrey(
            title: language!.requestDetail, notes: requestDetails),

        //?------------------------------------------------------------------------------------------saved Date
        WhiteDashbordContainer(
          title: language.date,
          detail: savedDate,
        ),
      ],
    );
  }
}
