class BloodTypeModel {
  int? id;
  String? name;
  String? nameAr;

  BloodTypeModel({this.id, this.name, this.nameAr});

  BloodTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?? "";
    name = json['name']?? "";
    nameAr = json['nameAr']?? "";
  }
static List<BloodTypeModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => BloodTypeModel.fromJson(data)).toList();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id?? "";
    data['name'] = name?? "";
    data['nameAr'] = nameAr?? "";
    return data;
  }
}
