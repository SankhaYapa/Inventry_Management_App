class RoomModel {
  int? id;
  String rname;

  RoomModel({required this.id, required this.rname});

  static RoomModel fromJson(Map<String, dynamic> json) =>
      RoomModel(id: json['id'], rname: json['rname']);
}
