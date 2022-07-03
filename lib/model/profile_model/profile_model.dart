class ProfileModel {
  int? empNo;
  String? fullNameEn;
  String? fullNameAr;
  String? maritalStatus;
  String? nationality;
  String? religionEn;
  String? gender;
  String? dateofBirth;
  String? extension;
  String? tele;
  String? mobile;
  String? fax;
  String? email;
  String? sponsor;
  String? gosiNo;
  String? address;
  String? branch;
  String? jobTitle;
  String? hireDate;
  String? department;
  String? labourStaffCardNo;
  String? labourCompanyNo;
  String? labourIssuePlace;
  String? labourIssueDate;
  String? labourExDate;
  String? idNo;
  String? idIssuePlace;
  String? idIssuePlaceAr;
  String? idIssueDate;
  String? idExDate;
  String? passportNo;
  String? passIssuePlace;
  String? passIssuePlaceAr;
  String? passIssueDate;
  String? exDate;
  double? salaryBS;
  double? salaryHA;
  double? salaryTA;
  double? others;
  double? totalSalary;

  String? photo;
  String? accessCardNo;
  String? passExpiryDateHijri;

  String? bloodType;
  String? doctorName;
  String? doctorAddress;
  String? doctorPhoneNo;

  String? idIssueDateHijri;
  String? idExDateHijri;

  String? emergContactName;
  String? emergContactRelationship;
  String? emergContactAddress;
  String? emergContactPhone;

  String? medicalConditions;
  String? allergies;
  String? currentMedications;

  ProfileModel({
    this.empNo,
    this.fullNameEn,
    this.fullNameAr,
    this.maritalStatus,
    this.nationality,
    this.religionEn,
    this.gender,
    this.dateofBirth,
    this.extension,
    this.tele,
    this.mobile,
    this.fax,
    this.email,
    this.sponsor,
    this.gosiNo,
    this.address,
    this.branch,
    this.jobTitle,
    this.hireDate,
    this.department,
    this.labourStaffCardNo,
    this.labourCompanyNo,
    this.labourIssuePlace,
    this.labourIssueDate,
    this.labourExDate,
    this.idNo,
    this.idIssuePlace,
    this.idIssuePlaceAr,
    this.idIssueDate,
    this.idExDate,
    this.passportNo,
    this.passIssuePlace,
    this.passIssuePlaceAr,
    this.passIssueDate,
    this.exDate,
    this.salaryBS,
    this.salaryHA,
    this.salaryTA,
    this.others,
    this.totalSalary,
    this.photo,
    this.accessCardNo,
    this.passExpiryDateHijri,
    this.bloodType,
    this.doctorName,
    this.doctorAddress,
    this.doctorPhoneNo,
    this.idIssueDateHijri,
    this.idExDateHijri,
    this.emergContactName,
    this.emergContactRelationship,
    this.emergContactAddress,
    this.emergContactPhone,
    this.medicalConditions,
    this.allergies,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    empNo = json['empNo'] ?? 0;
    fullNameEn = json['fullNameEn'] ?? "";
    fullNameAr = json['fullNameAr'] ?? "";
    maritalStatus = json['maritalStatus'] ?? "";
    nationality = json['nationality'] ?? "";
    religionEn = json['religionEn'] ?? "";
    gender = json['gender'] ?? "";
    dateofBirth = json['dateofBirth'] ?? "";
    extension = json['extension'] ?? "";
    tele = json['tele'] ?? "";
    mobile = json['mobile'] ?? "";
    fax = json['fax'] ?? "";
    email = json['email'] ?? "";
    sponsor = json['sponsor'] ?? "";
    gosiNo = json['gosiNo'] ?? "";
    address = json['address'] ?? "";
    branch = json['branch'] ?? "";
    jobTitle = json['jobTitle'] ?? "";
    hireDate = json['hireDate'] ?? "";
    department = json['department'] ?? "";
    labourStaffCardNo = json['labourStaffCardNo'] ?? " ";
    labourCompanyNo = json['labourCompanyNo'] ?? "";
    labourIssuePlace = json['labourIssuePlace'] ?? "";
    labourIssueDate = json['labourIssueDate'] ?? "";
    labourExDate = json['labourExDate'] ?? "";
    idNo = json['idNo'] ?? "";
    idIssuePlace = json['idIssuePlace'] ?? "";
    idIssuePlaceAr = json['idIssuePlaceAr'] ?? "";
    idIssueDate = json['idIssueDate'] ?? "";
    idExDate = json['idExDate'] ?? "";
    passportNo = json['passportNo'] ?? "";
    passIssuePlace = json['passIssuePlace'] ?? "";
    passIssuePlaceAr = json['passIssuePlaceAr'] ?? "";
    passIssueDate = json['passIssueDate'] ?? "";
    exDate = json['exDate'] ?? "";
    salaryBS = json['salaryBS'] == null ? 0.0 : json['salaryBS'].toDouble();
    salaryHA = json['salaryHA'] == null ? 0.0 : json['salaryHA'].toDouble();
    salaryTA = json['salaryTA'] == null ? 0.0 : json['salaryTA'].toDouble();
    others = json['others'] == null ? 0.0 : json['others'].toDouble();
    totalSalary =
        json['totalSalary'] == null ? 0.0 : json['totalSalary'].toDouble();
    photo = json['photo'] ?? "";
    accessCardNo = json['accessCardNo'] ?? "";
    passExpiryDateHijri = json['passExpiryDateHijri'] ?? "";
    bloodType = json['bloodType'] ?? "";
    doctorName = json['doctorName'] ?? "";
    doctorAddress = json['doctorAddress'] ?? "";
    doctorPhoneNo = json['doctorPhoneNo'] ?? "";
    idIssueDateHijri = json['idIssueDateHijri'] ?? "";
    idExDateHijri = json['idExDateHijri'] ?? "";
    medicalConditions = json['medicalConditions'] ?? "";
    allergies = json['allergies'] ?? "";
    currentMedications = json['currentMedications'] ?? "";
    emergContactName = json['emergContactName'] ?? "";
    emergContactRelationship = json['emergContactRelationship'] ?? "";
    emergContactAddress = json['emergContactAddress'] ?? "";
    emergContactPhone = json['emergContactPhone'] ?? "";
    //currentMedications=json['']
  }
}
