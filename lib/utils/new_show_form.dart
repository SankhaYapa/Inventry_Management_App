import 'package:flutter/material.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class ShowForms {
  static final items = [
    'lbs',
    'gal',
    'pouch',
  ];
  static void showForm(
      BuildContext context, ItemModel? model, String? selectvalue) {
    selectvalue =
        Provider.of<ItemProvider>(context, listen: false).getSelectValue;
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
                              value: Provider.of<ItemProvider>(context,
                                      listen: false)
                                  .getSelectValue,
                              items: items
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                selectvalue = val as String;
                              },
                              icon: Icon(Icons.arrow_drop_down_circle,
                                  color: Cblue),
                              decoration: InputDecoration(
                                labelText: "Select Masure",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 40, 40, 40))),
                              )),
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
                                    await value.addNewItem(
                                        context, selectvalue.toString());
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
