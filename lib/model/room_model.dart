class RoomModel {
  int? id;
  String rname;
  String? rquantity;

  RoomModel({required this.id, required this.rname, this.rquantity});

  static RoomModel fromJson(Map<String, dynamic> json) => RoomModel(
      id: json['id'], rname: json['rname'], rquantity: json['rquantity']);
}
