import 'package:flutter/material.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/dialogs.dart';
import 'package:provider/provider.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key? key,
    //required this.rname,
    required this.model,
  }) : super(key: key);
  //
  final RoomModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: ListTile(
        title: Text(
          model.rname,
          style: TextStyle(fontSize: 16, color: kwhite),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  //onPressed: () => Utils.showForm(context, model),
                  onPressed: () {},
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    Provider.of<RoomProvider>(context, listen: false)
                        .deleteRoom(context, model.id!);
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
