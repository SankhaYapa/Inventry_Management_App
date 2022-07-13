import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';

import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:logger/logger.dart';

class ItemProvider extends ChangeNotifier {
  //,,,,,,,,,,,,,add new note

  final TextEditingController _inameController = TextEditingController();

  TextEditingController get inameController => _inameController;

  final TextEditingController _quantityController = TextEditingController();

  TextEditingController get quantityController => _quantityController;

  //create new note function
  Future<void> addNewItem(BuildContext context, String selectValue,
      String selectValueR, String selectValueRR) async {
    //showing a snackbar if title empty
    if (_inameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill the field")));
    }

    await SqlHelper.createItem(
        _inameController.text, selectValue, selectValueR, selectValueRR);
    //refresh rooms
    await refreshItems();
    _inameController.clear();
    _selectValue = null;

    notifyListeners();
  }

  //fetch all items
  List<ItemModel> _allItems = [];
  List<ItemModel> get allItems => _allItems;

  //calculate all rooms
  int _totalItems = 0;
  String get totalItems => _totalItems.toString();
  Future<void> calAllItems() async {
    _totalItems = 0;
    for (int i = 0; i < _allItems.length; i++) {
      print(_allItems[i].quantity.toString());
      _totalItems = _totalItems + int.parse(_allItems[i].quantity.toString());
    }
  }

  //get items
  Future<void> refreshItems() async {
    _allItems = await SqlHelper.getItems();
    notifyListeners();
  }

  // List<ItemModel> _allItems1 = [];
  // List<ItemModel> get allItems1 => _allItems1;
  // //get items Last week
  // Future<void> refreshItems1() async {
  //   _allItems1 = await SqlHelper.getItemsLastWeek();

  //   notifyListeners();
  // }

  String? _selectValue;
  String? get getSelectValue => _selectValue;

  String? _selectValueR;
  String? get getSelectValueR => _selectValueR;

  String? _selectValueRR;
  String? get getSelectValueRR => _selectValueRR;

  //,,,,,,,,,,,,set text controllers when update
  void setTextControllers(ItemModel model) {
    _inameController.text = model.iname;
    _selectValue = model.measurement;
    /////////////////////////////////////////////////////////////////////////////////////////////////////////
    _selectValueR = model.room;
    _selectValueRR = model.rroom;
    _quantityController.text = model.quantity.toString();
    // print(model.iname);
    // print(model.measurement);
    // print(model.id);

    notifyListeners();
  }

  //Update item function
  Future<void> updateItem(BuildContext context, int id, String selectvalue,
      String selectValueR, String selectValueRR) async {
    //update the room
    await SqlHelper.updateItem(
        id, _inameController.text, selectvalue, selectValueR, selectValueRR);

    _inameController.clear();
    //refresh rooms
    await refreshItems();

    notifyListeners();
  }

//Update quantity function
  Future<void> updateProductQty(
      BuildContext context, int id, String quantity) async {
    //update the room
    await SqlHelper.updateProductQty(id, quantity);

    _quantityController.clear();
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
