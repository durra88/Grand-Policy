class DepartementModel {
  int? id;
  String? name;
  String? nameAr;

  DepartementModel({this.id, this.name, this.nameAr});

  DepartementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }
  static List<DepartementModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => DepartementModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAr'] = nameAr;
    return data;
  }
}
