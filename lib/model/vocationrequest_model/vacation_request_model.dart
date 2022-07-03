class VacationRequestModel {
  int? sNo;
  int? empID;
  String? empName;
  int? month;
  int? deductFromBalance;
  String? status;
  String? alternativeEmployees;
  int? year;
  String? vacationType;
  String? descr;
  String? leaveReson;
  String? contactDetails;
  String? periodFrom;
  String? periodTo;
  int? backToWork;
  String? backToWorkDate;
  String? savedBy;
  String? transDate;
  int? numOfDays;

  VacationRequestModel(
      {this.sNo,
      this.empID,
      this.empName,
      this.month,
      this.deductFromBalance,
      this.status,
      this.alternativeEmployees,
      this.year,
      this.vacationType,
      this.descr,
      this.leaveReson,
      this.contactDetails,
      this.periodFrom,
      this.periodTo,
      this.backToWork,
      this.backToWorkDate,
      this.savedBy,
      this.transDate,
      this.numOfDays});

  VacationRequestModel.fromJson(Map<String, dynamic> json) {
    sNo = json['sNo'] == null ? 0 : json['sNo'];
    empID = json['empID'] == null ? 0 : json['empID'].toInt();
    empName = json['empName'] ?? "";
    month = json['month'] == null ? 2 : json['month'].toInt();
    deductFromBalance = json['deductFromBalance'] == null
        ? 0
        : json['deductFromBalance'].toInt();
    status = json['status'] ?? "";
    alternativeEmployees = json['alternativeEmployees'] ?? "";
    year = json['year'] == null ? 2022 : json['year'].toInt();
    vacationType = json['vacationType'] ?? "";
    descr = json['descr'] ?? "";
    leaveReson = json['leaveReson'] ?? "";
    contactDetails = json['contactDetails'] ?? "";
    periodFrom = json['periodFrom'] ?? "";
    periodTo = json['periodTo'] ?? "";
    backToWork = json['backToWork'] == null ? 0 : json['backToWork'].toInt();
    backToWorkDate = json['backToWorkDate'] ?? "";
    savedBy = json['savedBy'] ?? "";
    transDate = json['transDate'] ?? "";
    numOfDays = json['numOfDays'] == null ? 0 : json['numOfDays'].toInt();
  }
  static List<VacationRequestModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => VacationRequestModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empID'] = empID;
    data['empName'] = empName;
    data['month'] = month;
    data['deductFromBalance'] = deductFromBalance;
    data['status'] = status;
    data['alternativeEmployees'] = alternativeEmployees;
    data['year'] = year;
    data['vacationType'] = vacationType;
    data['descr'] = descr;
    data['leaveReson'] = leaveReson;
    data['contactDetails'] = contactDetails;
    data['periodFrom'] = periodFrom;
    data['periodTo'] = periodTo;
    data['backToWork'] = backToWork;
    data['backToWorkDate'] = backToWorkDate;
    data['savedBy'] = savedBy;
    data['transDate'] = transDate;
    data['numOfDays'] = numOfDays;
    return data;
  }
}
