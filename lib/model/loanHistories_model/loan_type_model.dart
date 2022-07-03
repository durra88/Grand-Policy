class LoanTypeModel {
  int? id;
  String? name;
  String? nameAr;

  LoanTypeModel({this.id, this.name, this.nameAr});

  LoanTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }
 static List<LoanTypeModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => LoanTypeModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['nameAr'] = nameAr;
    return data;
  }
}
