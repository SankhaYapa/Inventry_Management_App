import 'package:flutter/material.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:inventry_management_app/providers/home/counter_provider.dart';
import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/dialogs.dart';
import 'package:inventry_management_app/utils/dialogs_quantity.dart';

import 'package:inventry_management_app/utils/new_show_form.dart';
import 'package:provider/provider.dart';

class WeeklyInventryCard extends StatelessWidget {
  const WeeklyInventryCard({
    Key? key,
    //required this.rname,
    required this.model,
  }) : super(key: key);
  //
  final ItemModel model;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      color: Colors.blue,
      child: ListTile(
        title: Text(
          model.iname,
          style: TextStyle(fontSize: 20, color: kwhite),
        ),
        // subtitle: Text(
        //   model.measurement.toString(),
        // ),
        trailing: _bultdTrailingWidget(context),
      ),
    );
  }

  Widget _bultdTrailingWidget(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          (model.room.toString() != "empty")
              ? GestureDetector(
                  onTap: () {
                    UtilsQuantity.showForm(context, model, 0);
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            width: 50,
                            child: CustomText(
                              text: model.quantity.toString(),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kblack,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          SizedBox(
                            width: 60,
                            child: CustomText(
                              text: model.measurement.toString(),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kblack,
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        text: model.room.toString(),
                      ),
                    ],
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  width: 150,
                  child: CustomText(text: "Empty"),
                ),
          (model.rroom.toString() != "empty")
              ? GestureDetector(
                  onTap: () {
                    UtilsQuantity.showForm(context, model, 1);
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: 50,
                            child: CustomText(
                              text: model.qquantity.toString(),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kblack,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          SizedBox(
                            width: 65,
                            child: CustomText(
                              text: model.measurement.toString(),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kblack,
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        text: model.rroom.toString(),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: 150,
                  alignment: Alignment.center,
                  child: CustomText(text: "Empty"),
                ),
        ],
      ),
    );
  }
}
