import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common_widget/dashbord/greycontainer.dart';
import '../common_widget/dashbord/whiteContainer.dart';

class ExpandedLoanHistoryWidget extends StatelessWidget {
  const ExpandedLoanHistoryWidget({
    Key? key,
    required this.status,
    required this.settled,
    required this.notes,
    required this.loanAmount,
    required this.installmentAmount,
    required this.year,
    required this.month,
    required this.deductedFromSalary,
    required this.createdBy,
    required this.createdOn,
  }) : super(key: key);
  final String status,
      settled,
      notes,
      loanAmount,
      installmentAmount,
      year,
      month,
      deductedFromSalary,
      createdBy,
      createdOn;

  get kGreyTextColor => null;
  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        WhiteDashbordContainer(
          title: language!.settled,
          detail: settled,
        ),
        GreyDashbordContainer(title: language.note, detail: notes),
        WhiteDashbordContainer(
          title: language.loanAmount,
          detail: loanAmount.toString(),
        ),
        GreyDashbordContainer(
          title: language.deductedFromSalary,
          detail: deductedFromSalary,
        ),
        WhiteDashbordContainer(
          title: language.createdOn,
          detail: createdOn,
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
