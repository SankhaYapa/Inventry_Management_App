import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/widgets/item_card.dart';
import 'package:provider/provider.dart';

import '../../providers/home/item_provide.dart';

class WeeklyInventryCount extends StatefulWidget {
  const WeeklyInventryCount({Key? key}) : super(key: key);

  @override
  State<WeeklyInventryCount> createState() => _WeeklyInventryCountState();
}

class _WeeklyInventryCountState extends State<WeeklyInventryCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Inventry Count"),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, value, child) {
          return value.allItems.isEmpty
              ? Center(child: Text('No Items'))
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  itemCount: value.allItems.length,
                  itemBuilder: (context, index) => ItemCard(
                    // rname: value.allRooms[index].rname,
                    model: value.allItems[index],
                  ),
                );
        },
      ),
    );
  }
}
