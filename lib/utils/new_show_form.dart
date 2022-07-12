import 'package:flutter/material.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';
import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class ShowForms {
  static final items = [
    'lbs',
    'gal',
    'pouch',
  ];
  static void showForm(
    BuildContext context,
    ItemModel? model,
  ) {
    String? selectvalue =
        Provider.of<ItemProvider>(context, listen: false).getSelectValue;
    String? selectvalueR =
        Provider.of<ItemProvider>(context, listen: false).getSelectValueR;
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
                          SizedBox(
                            height: 20,
                          ),
                          DropdownButtonFormField(
                            value: value.getSelectValue,
                            items: items
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              selectvalue = val.toString();
                            },
                            icon: Icon(Icons.arrow_drop_down_circle,
                                color: Cblue),
                            decoration: InputDecoration(
                              labelText: "Select Measurement",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 40, 40, 40))),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Consumer<RoomProvider>(
                            builder: (context, value3, child) {
                              return DropdownButtonFormField(
                                  value: Provider.of<ItemProvider>(context,
                                          listen: false)
                                      .getSelectValueR,
                                  items: value3.romms
                                      .map((e) => DropdownMenuItem(
                                            child: Text(e),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    selectvalueR = val.toString();

                                    //print(SqlHelper.getRooms());
                                    // value3.refreshRooms();
                                    // print(value3.allRooms);

                                    //print(value3.allRooms[1].rname);

                                    // for (int i = 0;
                                    //     i < value3.allRooms.length;
                                    //     i++) {
                                    //   print(value3.allRooms[i].rname);
                                    //   value3.setRoomList(
                                    //       value3.allRooms[i].rname);
                                    // }
                                  },
                                  icon: Icon(Icons.arrow_drop_down_circle,
                                      color: Cblue),
                                  decoration: InputDecoration(
                                    labelText: "Select Room",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 40, 40, 40))),
                                  ));
                            },
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
                                onPressed: () async {
                                  //save new item if model is null
                                  if (model == null) {
                                    await value.addNewItem(
                                        context,
                                        selectvalue.toString(),
                                        selectvalueR.toString());
                                  } else {
                                    //update the room if model is not null
                                    await value.updateItem(
                                        context,
                                        model.id!,
                                        selectvalue.toString(),
                                        selectvalueR.toString());
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
