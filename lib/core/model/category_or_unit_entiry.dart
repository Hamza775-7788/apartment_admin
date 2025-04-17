class EilmentModel {
  final int id;
  final String nameAr;
  final String nameEn;

  EilmentModel({required this.id, required this.nameAr, required this.nameEn});
  factory EilmentModel.fromJson(json) {
    return EilmentModel(
      id: json['id'],
      nameEn: json['nameEn'],
      nameAr: json["nameAr"],
    );
  }

  Map toJson() {
    return {"id": id, "nameAr": nameAr, "nameEn": nameEn};
  }
}
