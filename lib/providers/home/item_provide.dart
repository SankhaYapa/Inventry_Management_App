import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';

import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/model/room_model.dart';

class ItemProvider extends ChangeNotifier {
  //,,,,,,,,,,,,,add new note

  final TextEditingController _inameController = TextEditingController();

  TextEditingController get inameController => _inameController;

  //create new note function
  Future<void> addNewItem(BuildContext context, String selectValue) async {
    //showing a snackbar if title empty
    if (_inameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    }

    await SqlHelper.createItem(_inameController.text, selectValue);
    //refresh rooms
    await refreshItems();
    _inameController.clear();

    notifyListeners();
  }

  //fetch all rooms
  List<ItemModel> _allItems = [];
  List<ItemModel> get allItems => _allItems;

  //get rooms
  Future<void> refreshItems() async {
    _allItems = await SqlHelper.getItems();
    notifyListeners();
  }

  String? _selectValue;
  String? get getSelectValue => _selectValue;
  //,,,,,,,,,,,,set text controllers when update
  void setTextControllers(ItemModel model) {
    _inameController.text = model.iname;
    _selectValue = model.measurement;

    notifyListeners();
  }

  //Update item function
  Future<void> updateItem(
      BuildContext context, int id, String selectNewValue) async {
    //update the room
    await SqlHelper.updateItem(id, _inameController.text, selectNewValue);

    _inameController.clear();
    //refresh rooms
    await refreshItems();

    notifyListeners();
  }

  //Delete item function
  Future<void> deleteItem(BuildContext context, int id) async {
    //delete the room
    await SqlHelper.deleteItem(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("You deleted a Item")));

    //refresh rooms
    await refreshItems();

    notifyListeners();
  }
}
