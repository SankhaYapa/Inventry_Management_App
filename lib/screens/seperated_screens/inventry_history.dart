import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/widgets/final_count_form_card.dart';
import 'package:inventry_management_app/widgets/inventry_history_card.dart';
import 'package:provider/provider.dart';

class InventryHistory extends StatefulWidget {
  const InventryHistory({Key? key}) : super(key: key);

  @override
  State<InventryHistory> createState() => _InventryHistoryState();
}

class _InventryHistoryState extends State<InventryHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventry History"),
      ),
      body: Consumer<RoomProvider>(
        builder: (context, value, child) {
          return value.allRooms.isEmpty
              ? Center(child: Text('No Items'))
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  itemCount: value.allRooms.length,
                  itemBuilder: (context, index) => InventryHistoryCard(
                    // rname: value.allRooms[index].rname,
                    model: value.allRooms[index],
                  ),
                );
        },
      ),
    );
  }
}
