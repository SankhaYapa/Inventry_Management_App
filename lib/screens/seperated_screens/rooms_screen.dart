import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/dialogs.dart';
import 'package:inventry_management_app/widgets/room_card.dart';
import 'package:provider/provider.dart';

class RoomSceern extends StatefulWidget {
  final List<String> items = [
    'Select a Room',
    'Room 1',
    'Room 2',
    'Room 3',
    'Room 4',
  ];
  String value = 'Select a Room';

  RoomSceern({Key? key}) : super(key: key);

  @override
  State<RoomSceern> createState() => _RoomSceernState();
}

class _RoomSceernState extends State<RoomSceern> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<RoomProvider>(context, listen: false).refreshRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rooms"),
      ),
      body: Consumer<RoomProvider>(
        builder: (context, value, child) {
          return value.allRooms.isEmpty
              ? Center(child: Text('No Rooms'))
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  itemCount: value.allRooms.length,
                  itemBuilder: (context, index) => RoomCard(
                    // rname: value.allRooms[index].rname,
                    model: value.allRooms[index],
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Utils.showForm(context, null),
        icon: Icon(Icons.add),
        label: Text('Add Room'),
      ),
    );
  }
}
