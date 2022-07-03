class LoanDashBoardModel {
  double? totalloans;
  double? totalPaid;
  double? totalPendding;

  LoanDashBoardModel({this.totalloans, this.totalPaid, this.totalPendding});

  LoanDashBoardModel.fromJson(Map<String, dynamic> json) {
    totalloans =
        json['totalloans'] == null ? 0.0 : json['totalloans'].toDouble();
    totalPaid = json['totalPaid'] == null ? 0.0 : json['totalPaid'].toDouble();
    totalPendding =
        json['totalPendding'] == null ? 0.0 : json['totalPendding'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalloans'] = totalloans;
    data['totalPaid'] = totalPaid;
    data['totalPendding'] = totalPendding;
    return data;
  }
}
