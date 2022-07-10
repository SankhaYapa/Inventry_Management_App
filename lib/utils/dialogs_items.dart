import 'package:flutter/material.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';
import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../components/custome_textfield.dart';

class UtilsItems {
//show bottom sheet function
  final List<String> items = [
    'Select a Room',
    'Room 1',
    'Room 2',
    'Room 3',
    'Room 4',
  ];
  String value = 'Select a Room';

  @override
  static void showForm(BuildContext context, ItemModel? model) {
    //set the existing rooms name to the text controllers
    if (model != null) {
      Provider.of<ItemProvider>(context, listen: false)
          .setTextControllers(model);
    }

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Container(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<ItemProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: value.inameController,
                            hintText: 'Item Name',
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(20),
                          //   decoration: BoxDecoration(
                          //       color: kwhite,
                          //       borderRadius: BorderRadius.circular(10),
                          //       border: Border.all(color: kblack)),
                          //   width: double.infinity,
                          //   height: 60,

                          //   child: DropdownButton<String>(

                          //     value: value,
                          //     items: items.map(buildMenuItem).toList(),
                          //     onChanged: (String? newValue) {
                          //       setState(() {
                          //         Navigator.of(context).pop();
                          //         _showForm();
                          //         value =
                          //       });
                          //     },
                          //     icon: Icon(
                          //       Icons.arrow_drop_down,
                          //     ),
                          //     iconSize: 42,
                          //     underline: SizedBox(),
                          //     alignment: Alignment.centerRight,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Container(
                          //   padding: EdgeInsets.all(20),
                          //   decoration: BoxDecoration(
                          //       color: kwhite,
                          //       borderRadius: BorderRadius.circular(10),
                          //       border: Border.all(color: kblack)),
                          //   width: double.infinity,
                          //   height: 60,
                          //   child: DropdownButton<String>(
                          //     //disabledHint: Text('Select a Room'),
                          //     value: value,
                          //     items: items.map(buildMenuItem).toList(),
                          //     onChanged: (String? newValue) {
                          //       setState(() {
                          //         Navigator.of(context).pop();
                          //         _showForm();
                          //         value = newValue!;
                          //       });
                          //     },
                          //     icon: Icon(
                          //       Icons.arrow_drop_down,
                          //     ),
                          //     iconSize: 42,
                          //     underline: SizedBox(),
                          //     alignment: Alignment.centerRight,
                          //   ),
                          // ),
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
                                onPressed: () async {
                                  //save new room if model is null
                                  if (model == null) {
                                    await value.addNewItem(context);
                                  } else {
                                    //update the room if model is not null
                                    await value.updateItem(context, model.id!);
                                  }

                                  //when update close the bottom sheet
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  model != null ? 'Update Item' : 'Add Item',
                                  style: TextStyle(fontSize: 16),
                                )),
                          )
                        ],
                      );
                    },
                  )));
        });
  }
}
