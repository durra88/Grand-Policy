class LeaveTypeModel {
  int? id;
  String? name;
  String? nameAr;

  LeaveTypeModel({this.id, this.name, this.nameAr});

  LeaveTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }
  static List<LeaveTypeModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => LeaveTypeModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAr'] = nameAr;
    return data;
  }
}
