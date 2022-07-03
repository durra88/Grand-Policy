class OvertimeDashBoardModel {
  double? totalOvertime;
  double? totalPendding;
  double? totalPaid;

  OvertimeDashBoardModel(
      {this.totalOvertime, this.totalPendding, this.totalPaid});

  OvertimeDashBoardModel.fromJson(Map<String, dynamic> json) {
    totalOvertime =
        json['totalOvertime'] == null ? 0.0 : json['totalOvertime'].toDouble();
    totalPendding =
        json['totalPendding'] == null ? 0.0 : json['totalPendding'].toDouble();
    totalPaid = json['totalPaid'] == null ? 0.0 : json['totalPaid'].toDouble();
  }
}
