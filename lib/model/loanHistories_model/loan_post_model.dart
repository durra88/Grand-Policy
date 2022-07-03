class LoanPostModel {
  String? notes;
  int? year;
  int? month;
  String? loanType;
  String? loanAmount;
  int? notDeductFromSalary;
  double? amount;

  LoanPostModel(
      {this.notes,
      this.year,
      this.month,
      this.loanType,
      this.loanAmount,
      this.notDeductFromSalary,
      this.amount});

  LoanPostModel.fromJson(Map<String, dynamic> json) {
    notes = json['notes'];
    year = json['year'];
    month = json['month'];
    loanType = json['loanType'];
    loanAmount = json['loanAmount'];
    notDeductFromSalary = json['notDeductFromSalary'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notes'] = notes;
    data['year'] = year;
    data['month'] = month;
    data['loanType'] = loanType;
    data['loanAmount'] = loanAmount;
    data['notDeductFromSalary'] = notDeductFromSalary;
    data['amount'] = amount;
    return data;
  }
}
