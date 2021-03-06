import 'package:flutter/material.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';
import 'package:inventry_management_app/model/room_model.dart';

class RoomProvider extends ChangeNotifier {
  //,,,,,,,,,,,,,add new note

  final TextEditingController _rnameController = TextEditingController();

  TextEditingController get rnameController => _rnameController;

  final TextEditingController _rquantityController = TextEditingController();

  TextEditingController get rquantityController => _rquantityController;

  //create new note function
  Future<void> addNewRoom(BuildContext context) async {
    //showing a snackbar if title empty
    if (_rnameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    }
    await SqlHelper.createRoom(_rnameController.text);
    //refresh rooms
    await refreshRooms();
    _rnameController.clear();

    notifyListeners();
  }

  //fetch all rooms
  List<RoomModel> _allRooms = [];
  List<RoomModel> get allRooms => _allRooms;

  //calculate all rooms
  int _totalRooms = 0;
  String get totalRooms => _totalRooms.toString();
  Future<void> calAllrooms() async {
    _totalRooms = 0;
    for (int i = 0; i < _allRooms.length; i++) {
      print(_allRooms[i].rquantity.toString());
      _totalRooms = _totalRooms + int.parse(_allRooms[i].rquantity.toString());
    }
  }

  //get rooms
  Future<void> refreshRooms() async {
    _allRooms = await SqlHelper.getRooms();
    notifyListeners();
  }

  //,,,,,,,,,,,,set text controllers when update
  void setTextControllers(RoomModel model) {
    _rnameController.text = model.rname;
    _rquantityController.text = model.rquantity.toString();

    notifyListeners();
  }

  //,,,,,,,,,,,,set roomlist
  List<String> romms = [];
  void clearRoomList() {
    romms.clear();
  }

  Future<void> setRoomList(String data) async {
    romms.add(data);
    //print(romms.toString());
    //notifyListeners();
  }

  //Update note function
  Future<void> updateRoom(BuildContext context, int id) async {
    //update the room
    await SqlHelper.updateRoom(id, _rnameController.text);

    _rnameController.clear();
    //refresh rooms
    await refreshRooms();

    notifyListeners();
  }

//Update quantity room function
  Future<void> updateRoomQuantity(
      BuildContext context, int id, String rquantity) async {
    //update the room
    await SqlHelper.updateRoomQuantity(id, rquantity);

    _rquantityController.clear();
    //refresh rooms
    await refreshRooms();

    notifyListeners();
  }

  //Delete note function
  Future<void> deleteRoom(BuildContext context, int id) async {
    //delete the room
    await SqlHelper.deleteRoom(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("You deleted a Room")));

    //refresh rooms
    await refreshRooms();

    notifyListeners();
  }
}
