class OvertimeModel {
  String? status;
  int? year;
  int? month;
  int? noOfHours;
  double? amount;
  String? notes;
  String? createdBy;
  String? createdOn;

  OvertimeModel(
      {this.status,
      this.year,
      this.month,
      this.noOfHours,
      this.amount,
      this.notes,
      this.createdBy,
      this.createdOn});

  OvertimeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    year = json['year'] ?? "";
    month = json['month'] ?? "";
    noOfHours = json['noOfHours'] ?? "";
    amount = json['amount'] == null ? 0.0 : json['amount'].toDouble();
    notes = json['notes'] ?? "";
    createdBy = json['createdBy'] ?? "";
    createdOn = json['createdOn'] ?? "";
  }
  static List<OvertimeModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => OvertimeModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status ?? "";
    data['year'] = year ?? "";
    data['month'] = month ?? "";
    data['noOfHours'] = noOfHours ?? "";
    data['amount'] = amount == null ? 0.0 : data['amount'].toDouble();
    data['notes'] = notes ?? "";
    data['createdBy'] = createdBy ?? "";
    data['createdOn'] = createdOn ?? "";
    return data;
  }
}
