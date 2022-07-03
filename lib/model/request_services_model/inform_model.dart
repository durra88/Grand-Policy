class InformToModel {
  int? id;
  String? name;
  String? nameAr;

  InformToModel({this.id, this.name, this.nameAr});

  InformToModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }
  static List<InformToModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => InformToModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAr'] = nameAr;
    return data;
  }
}
