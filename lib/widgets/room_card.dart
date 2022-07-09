import 'package:flutter/material.dart';
import 'package:inventry_management_app/utils/app_colors.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key? key,
    required this.rname,
  }) : super(key: key);
  final String rname;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: ListTile(
        title: Text(
          rname,
          style: TextStyle(fontSize: 16, color: kwhite),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
