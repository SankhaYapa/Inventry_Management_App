import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';
import 'package:inventry_management_app/model/room_model.dart';

class RoomProvider extends ChangeNotifier {
  //,,,,,,,,,,,,,add new note

  final TextEditingController _rnameController = TextEditingController();

  TextEditingController get rnameController => _rnameController;

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

  //get rooms
  Future<void> refreshRooms() async {
    _allRooms = await SqlHelper.getRooms();
    notifyListeners();
  }

  //,,,,,,,,,,,,set text controllers when update
  void setTextControllers(RoomModel model) {
    _rnameController.text = model.rname;

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
