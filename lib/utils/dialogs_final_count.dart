import 'package:flutter/material.dart';
import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/notification_dialog.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../components/custome_textfield.dart';

class UtilsFinalCount {
//show bottom sheet function
  @override
  static void showForm(BuildContext context, RoomModel? model) {
    //set the existing rooms name to the text controllers
    if (model != null) {
      Provider.of<RoomProvider>(context, listen: false)
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
                  child: Consumer<RoomProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            controller: value.rquantityController,
                            hintText: 'Quantity',
                            inputType: TextInputType.number,
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
                                  if (value.rquantityController.text.isEmpty) {
                                    NotificationDialog.show(
                                      context,
                                      "Error",
                                      "Please fill the Quantity",
                                    );
                                  } else if ((double.tryParse(
                                          value.rquantityController.text) ==
                                      null)) {
                                    NotificationDialog.show(
                                      context,
                                      "Error",
                                      "Please fill the Quantity as number",
                                    );
                                  } else {
                                    //save quantity if model is not null
                                    if (model != null) {
                                      await value.updateRoomQuantity(
                                          context,
                                          model.id!,
                                          value.rquantityController.text
                                              .toString());
                                    }
                                    //when update close the bottom sheet
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text(
                                  'Update Quantity',
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
