class ExcuseModel {
  int? sNo;

  String? status;
  String? excuseFrom;
  String? execuseType;
  String? periodFrom;
  String? periodTo;
  String? noOfHours;
  String? leaveReson;
  int? backToWork;
  String? backToWorkDate;

  ExcuseModel(
      {this.sNo,
      this.status,
      this.excuseFrom,
      this.execuseType,
      this.periodFrom,
      this.periodTo,
      this.noOfHours,
      this.leaveReson,
      this.backToWork,
      this.backToWorkDate});

  ExcuseModel.fromJson(Map<dynamic, dynamic> json) {
    sNo = json['sNo'] == null ? 0 : json['sNo'];
    status = json['status'] ?? "";
    excuseFrom = json['excuseFrom'] ?? "";
    execuseType = json['execuseType'] ?? "";
    periodFrom = json['periodFrom'] ?? "";
    periodTo = json['periodTo'] ?? "";
    noOfHours = json['noOfHours'] ?? "";
    leaveReson = json['leaveReson'] ?? "";
    backToWork = json['backToWork'] == null ? 0 : json['backToWork'].toInt();
    backToWorkDate = json['backToWorkDate'] ?? "";
  }

  static List<ExcuseModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => ExcuseModel.fromJson(data)).toList();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['status'] = status;
    data['excuseFrom'] = excuseFrom;
    data['execuseType'] = execuseType;
    data['periodFrom'] = periodFrom;
    data['periodTo'] = periodTo;
    data['noOfHours'] = noOfHours;
    data['leaveReson'] = leaveReson;
    data['backToWork'] = backToWork;
    data['backToWorkDate'] = backToWorkDate;
    return data;
  }
}
