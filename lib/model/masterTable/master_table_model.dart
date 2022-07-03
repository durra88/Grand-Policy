class MasterTableModel{

 int? id;
  String? name;
  String? nameAr;

  MasterTableModel({this.id, this.name, this.nameAr});

 MasterTableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['nameAr'];
  }
 static List<MasterTableModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => MasterTableModel.fromJson(data)).toList();
  }
}