class RequestTypeModel {
  int? id;
  String? name;
  String? nameAr;

  RequestTypeModel({this.id, this.name, this.nameAr});

  RequestTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }
  static List<RequestTypeModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => RequestTypeModel.fromJson(data)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] ;
    data['name'] = name;
    data['nameAr'] = nameAr;
    return data;
  }
}
