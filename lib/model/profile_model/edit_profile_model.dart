class EditProfileModel {
  String? doctorName;
  String? doctorAddress;
  String? doctorPhoneNo;
  String? bloodType;
  String? medicalConditions;
  String? allergies;
  String? currentMedications;
  String? emergContactName;
  String? emergContactRelationship;
  String? emergContactAddress;
  String? emergContactPhone;

  EditProfileModel(
      {this.doctorName,
      this.doctorAddress,
      this.doctorPhoneNo,
      this.bloodType,
      this.medicalConditions,
      this.allergies,
      this.currentMedications,
      this.emergContactName,
      this.emergContactRelationship,
      this.emergContactAddress,
      this.emergContactPhone});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctorName'];
    doctorAddress = json['doctorAddress'];
    doctorPhoneNo = json['doctorPhoneNo'];
    bloodType = json['bloodType'];
    medicalConditions = json['medicalConditions'];
    allergies = json['allergies'];
    currentMedications = json['currentMedications'];
    emergContactName = json['emergContactName'];
    emergContactRelationship = json['emergContactRelationship'];
    emergContactAddress = json['emergContactAddress'];
    emergContactPhone = json['emergContactPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctorName'] = doctorName;
    data['doctorAddress'] = doctorAddress;
    data['doctorPhoneNo'] = doctorPhoneNo;
    data['bloodType'] = bloodType;
    data['medicalConditions'] = medicalConditions;
    data['allergies'] = allergies;
    data['currentMedications'] = currentMedications;
    data['emergContactName'] = emergContactName;
    data['emergContactRelationship'] = emergContactRelationship;
    data['emergContactAddress'] = emergContactAddress;
    data['emergContactPhone'] = emergContactPhone;
    return data;
  }
}
