class ItemModel {
  int? id;
  String iname;

  ItemModel({required this.id, required this.iname});

  static ItemModel fromJson(Map<String, dynamic> json) =>
      ItemModel(id: json['id'], iname: json['iname']);
}
