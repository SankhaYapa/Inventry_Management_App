class ItemModel {
  int? id;
  String iname;
  String? measurement;
  String? room;
  String? rroom;
  String? quantity;

  ItemModel({
    required this.id,
    required this.iname,
    required this.measurement,
    required this.room,
    required this.rroom,
    this.quantity,
  });

  static ItemModel fromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'],
      iname: json['iname'],
      measurement: json['mesure'],
      room: json['room'],
      rroom: json['rroom'],
      quantity: json['quantity']);
}
