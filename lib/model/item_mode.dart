class ItemModel {
  int? id;
  String iname;
  String? measurement;
  String? room;

  ItemModel(
      {required this.id,
      required this.iname,
      required this.measurement,
      required this.room});

  static ItemModel fromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id'],
        iname: json['iname'],
        measurement: json['mesure'],
        room: json['room'],
      );
}
