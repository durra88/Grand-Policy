class HolidayListModel {
  int? sNo;
  int? year;
  String? holidayTitle;
  String? holidayDateFrom;
  String? holidayDateTo;
  String? savedBy;
  int? numOdDays;

  HolidayListModel(
      {this.sNo,
      this.year,
      this.holidayTitle,
      this.holidayDateFrom,
      this.holidayDateTo,
      this.savedBy,
      this.numOdDays});

  HolidayListModel.fromJson(Map<String, dynamic> json) {
    sNo = json['sNo'];
    year = json['year'];
    holidayTitle = json['holidayTitle'];
    holidayDateFrom = json['holidayDateFrom'];
    holidayDateTo = json['holidayDateTo'];
    savedBy = json['savedBy'];
    numOdDays = json['numOdDays'] == null ? 0.0 : json['numOdDays'].toInt();
  }

  static List<HolidayListModel> toListOfModel(List<dynamic> data) {
    return data.map((data) => HolidayListModel.fromJson(data)).toList();
  }
}
