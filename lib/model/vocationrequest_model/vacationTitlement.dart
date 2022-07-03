class VacationTitlementModel {
  String? vacationType;
  int? days;
  double? balance;
  double? daysTaken;

  VacationTitlementModel(
      {this.vacationType, this.days, this.balance, this.daysTaken});

  VacationTitlementModel.fromJson(Map<String, dynamic> json) {
    vacationType = json['vacationType'] ?? "";
    days = json['days'] ?? "";
    balance = json['balance'] == null ? 0.0 : json['balance'].toDouble();
    daysTaken = json['daysTaken'] == null ? 0.0 : json['daysTaken'].toDouble();
  }
  static List<VacationTitlementModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => VacationTitlementModel.fromJson(data)).toList();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['vacationType'] = vacationType;
    data['days'] = days;
    data['balance'] = balance;
    data['daysTaken'] = daysTaken;
    return data;
  }
}
