import 'package:flutter/material.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/dialogs.dart';

import 'package:inventry_management_app/utils/new_show_form.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
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
        subtitle: Row(
          children: [
            Text(
              model.measurement.toString(),
              style: TextStyle(fontSize: 16, color: kwhite),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              model.room.toString(),
              style: TextStyle(fontSize: 16, color: kwhite),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              model.rroom.toString(),
              style: TextStyle(fontSize: 16, color: kwhite),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  //onPressed: () => UtilsItems.showForm(context, model),
                  onPressed: () {
                    ShowForms.showForm(
                      context,
                      model,
                    );
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    Provider.of<ItemProvider>(context, listen: false)
                        .deleteItem(context, model.id!);
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
