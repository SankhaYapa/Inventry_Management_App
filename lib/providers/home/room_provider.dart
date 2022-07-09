import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';
import 'package:inventry_management_app/model/room_model.dart';

class RoomProvider extends ChangeNotifier {
  //,,,,,,,,,,,,,add new note

  final TextEditingController _rname = TextEditingController();

  TextEditingController get rnameController => _rname;

  //create new note function
  Future<void> addNewRoom(BuildContext context) async {
    //showing a snackbar if title empty
    if (_rname.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    }
    await SqlHelper.createRoom(_rname.text);
    //refresh rooms
    await refreshRooms();
    _rname.clear();

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
}
