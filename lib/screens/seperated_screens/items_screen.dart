import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/utils/app_colors.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final List<String> items = [
    'Select a Room',
    'Room 1',
    'Room 2',
    'Room 3',
    'Room 4',
  ];
  String value = 'Select a Room';
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
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20),
              //   ),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 5,
              //       blurRadius: 7,
              //       offset: Offset(0, 3), // changes position of shadow
              //     ),
              //   ],
              // ),
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Item Name',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kblack)),
                  width: double.infinity,
                  height: 60,
                  child: DropdownButton<String>(
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        Navigator.of(context).pop();
                        _showForm();
                        value = newValue!;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    iconSize: 42,
                    underline: SizedBox(),
                    alignment: Alignment.centerRight,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kblack)),
                  width: double.infinity,
                  height: 60,
                  child: DropdownButton<String>(
                    //disabledHint: Text('Select a Room'),
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        Navigator.of(context).pop();
                        _showForm();
                        value = newValue!;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    iconSize: 42,
                    underline: SizedBox(),
                    alignment: Alignment.centerRight,
                  ),
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
                              MaterialStateProperty.all<Color>(Colors.white),
                          // backgroundColor:
                          //     MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Cblue)))),
                      onPressed: () {},
                      child: Text(
                        'Add Item',
                        style: TextStyle(fontSize: 16),
                      )),
                )
              ],
            ),
          ));
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
        title: Text("Items"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(),
        icon: Icon(Icons.add),
        label: Text('Add Items'),
      ),
    );
  }
}
