import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/widgets/room_card.dart';
import 'package:provider/provider.dart';

class RoomSceern extends StatefulWidget {
  const RoomSceern({Key? key}) : super(key: key);

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

  final List<String> items = [
    'Room 1',
    'Room 2',
    'Room 3',
    'Room 4',
  ];
  String value = '';
  //show bottom sheet function
  @override
  void _showForm() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<RoomProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: value.rnameController,
                            hintText: 'Room Name',
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    // backgroundColor:
                                    //     MaterialStateProperty.all<Color>(Colors.red),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(color: Cblue)))),
                                onPressed: () {
                                  value.addNewRoom(context);
                                  //when update close the bottom sheet
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Add Room',
                                  style: TextStyle(fontSize: 16),
                                )),
                          )
                        ],
                      );
                    },
                  )));
        });
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ));
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
              : ListView.separated(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RoomCard(
                      rname: value.allRooms[index].rname,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                  itemCount: value.allRooms.length);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(),
        icon: Icon(Icons.add),
        label: Text('Add Room'),
      ),
    );
  }
}
