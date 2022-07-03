class EmailingToModel {
  int? id;
  String? name;
  String? nameAr;

  EmailingToModel({this.id, this.name, this.nameAr});

  EmailingToModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }
  static List<EmailingToModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => EmailingToModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAr'] = nameAr;
    return data;
  }
}
