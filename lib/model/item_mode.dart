class ItemModel {
  int? id;
  String iname;
  String? measurement;

  ItemModel({required this.id, required this.iname, required this.measurement});

  static ItemModel fromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id'],
        iname: json['iname'],
        measurement: json['mesure'],
      );
}
