import 'dart:ffi';
import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';
import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';

import 'package:inventry_management_app/utils/new_show_form.dart';
import 'package:inventry_management_app/widgets/item_card.dart';
import 'package:provider/provider.dart';

import '../../providers/home/item_provide.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  SqlHelper sqlHelper = SqlHelper();

  _ItemsScreenState() {
    //selectvalue = items[0];
  }
  final items = [
    'lbs',
    'gal',
    'pouch',
  ];
  //String? selectvalue = "";

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ItemProvider>(context, listen: false).refreshItems();
    Provider.of<RoomProvider>(context, listen: false).refreshRooms();
    List<RoomModel> allRooms =
        Provider.of<RoomProvider>(context, listen: false).allRooms;
    Provider.of<RoomProvider>(context, listen: false).clearRoomList();
    for (int i = 0; i < allRooms.length; i++) {
      //print(allRooms[i].rname);
      Provider.of<RoomProvider>(context, listen: false)
          .setRoomList(allRooms[i].rname);
    }

    super.initState();
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, value, child) {
          return value.allItems.isEmpty
              ? Center(child: Text('No Items'))
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  itemCount: value.allItems.length,
                  itemBuilder: (context, index) => ItemCard(
                    // rname: value.allRooms[index].rname,
                    model: value.allItems[index],
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        //onPressed: () => showForm(context, null,),
        onPressed: () {
          ShowForms.showForm(context, null);
        },
        icon: Icon(Icons.add),
        label: Text('Add Items'),
      ),
    );
  }
}
