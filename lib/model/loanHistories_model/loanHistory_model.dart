// ignore: file_names
class LoanHistoryModel {
  String? status;
  int? staffID;
  String? notes;
  int? year;
  int? month;
  String? loanType;
  double? loanAmount;
  int? notDeductFromSalary;
  double? amount;
  String? createdBy;
  String? createdOn;
  int? setteled;

  LoanHistoryModel(
      {this.status,
      this.staffID,
      this.notes,
      this.year,
      this.month,
      this.loanType,
      this.loanAmount,
      this.notDeductFromSalary,
      this.amount,
      this.createdBy,
      this.createdOn,
      this.setteled});

  LoanHistoryModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'] ?? "";
    staffID = json['staffID'] ?? "";
    notes = json['notes'] ?? "";
    year = json['year'] ?? "";
    month = json['month'] ?? "";
    loanType = json['loanType'] ?? "";
    loanAmount = json['loanAmount'] == null ? 0.0 : json['loanAmount'].toDouble();
         amount = json['amount']    == null ? 0.0 : json['amount'].toDouble();
    notDeductFromSalary = json['notDeductFromSalary'];
    setteled = json['setteled'] == null ? 0 : json['setteled'].toInt();
    createdBy = json['createdBy'] ?? "";
    createdOn = json['createdOn'] ?? "";
  }
  static List<LoanHistoryModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => LoanHistoryModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['staffID'] = staffID;
    data['notes'] = notes;
    data['year'] = year;
    data['month'] = month;
    data['loanType'] = loanType;
    data['loanAmount'] = loanAmount;
    data['notDeductFromSalary'] = notDeductFromSalary;
    data['amount'] = amount;
    data['createdBy'] = createdBy;
    data['createdOn'] = createdOn;
    data['setteled'] = setteled;
    return data;
  }
}
