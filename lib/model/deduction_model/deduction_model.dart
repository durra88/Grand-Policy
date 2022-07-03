class DeductionModel {
  String? status;
  int? staffID;
  String? item;
  String? notes;
  int? year;
  int? month;
  int? noOfDays;
  double? loanAmount;
  double? amount;
  String? createdBy;
  String? createdOn;

  DeductionModel(
      {this.status,
      this.staffID,
      this.item,
      this.notes,
      this.year,
      this.month,
      this.noOfDays,
      this.loanAmount,
      this.amount,
      this.createdBy,
      this.createdOn});

  DeductionModel.fromJson(Map<dynamic, dynamic> json) {
    status = json['status']?? "";  
    staffID = json['staffID']== null ? 0 : json['staffID'].toInt();
    item = json['item']?? "";
    notes = json['notes']?? "";
    year = json['year']== null ? 0 : json['year'].toInt();
    month = json['month']== null ? 0 : json['month'].toInt();
    noOfDays = json['noOfDays']== null ? 0 : json['noOfDays'].toInt();
    loanAmount = json['loanAmount'] == null ? 0.0 : json['loanAmount'].toDouble();
    amount = json['amount'] == null ? 0.0 : json['amount'].toDouble();
    createdBy = json['createdBy']?? "";
    createdOn = json['createdOn']?? "";
  }
 static List<DeductionModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => DeductionModel.fromJson(data)).toList();
  }

}
