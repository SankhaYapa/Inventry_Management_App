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

class InventryHistoryCard extends StatelessWidget {
  const InventryHistoryCard({
    Key? key,
    //required this.rname,
    required this.model,
  }) : super(key: key);
  //
  final RoomModel model;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      color: Colors.blue,
      child: ListTile(
        title: Text(
          model.rname,
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
          CustomText(
            text: 'ss',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kblack,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
