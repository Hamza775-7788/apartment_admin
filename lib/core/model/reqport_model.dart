class ReportModel {
  String name;
  String count;

  ReportModel({required this.count, required this.name});
  factory ReportModel.fromJson(json) {
    return ReportModel(
      count: json['count'].toString(),
      name: json['name'].toString(),
    );
  }
}
