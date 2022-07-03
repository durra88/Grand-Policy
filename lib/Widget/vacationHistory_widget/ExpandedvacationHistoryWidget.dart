import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../controller/vocation_controller/vacation_controller.dart';
import '../common_widget/dashbord/greycontainer.dart';
import '../common_widget/dashbord/note_container_white.dart';
import '../common_widget/dashbord/whiteContainer.dart';

class ExpandedVacationHistory extends StatelessWidget {
  const ExpandedVacationHistory({
    Key? key,
    required this.sNo,
    required this.requestStatus,
    required this.staffId,
    required this.year,
    required this.month,
    required this.name,
    required this.from,
    required this.to,
    required this.noOfDays,
    required this.leaveType,
    required this.leaveReason,
    required this.deductedFromBalance,
    required this.contactDetails,
    required this.sendDate,
  }) : super(key: key);
  final String requestStatus,
      staffId,
      name,
      year,
      month,
      from,
      to,
      noOfDays,
      leaveType,
      leaveReason,
      deductedFromBalance,
      contactDetails,
      sendDate,
      sNo;
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    final controller = Get.put(VacationController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GreyDashbordContainer(
          title: language!.year,
          detail: year,
        ),
        WhiteDashbordContainer(
          title: language.month,
          detail: month,
        ),
        GreyDashbordContainer(
          title: language.from,
          detail: from,
        ),
        WhiteDashbordContainer(
          title: language.to,
          detail: to,
        ),
        GreyDashbordContainer(
          title: language.noOfDays,
          detail: noOfDays,
        ),
        NoteContainerWhite(title: language.leaveReason, notes: leaveReason),
        GreyDashbordContainer(
          title: language.deductedFromBalance,
          detail: deductedFromBalance,
        ),
        NoteContainerWhite(
          title: language.contactDetails,
          notes: contactDetails,
        ),
        GreyDashbordContainer(
          title: language.date,
          detail: sendDate,
        ),
      ],
    );
  }
}
