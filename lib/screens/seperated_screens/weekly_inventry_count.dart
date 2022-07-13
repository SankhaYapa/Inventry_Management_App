import 'package:flutter/material.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/widgets/weekly_inventry_card.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(text: "Item"),
                SizedBox(
                  width: 90,
                ),
                CustomText(text: "Room"),
                SizedBox(
                  width: 10,
                ),
                CustomText(text: "Room"),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Expanded(
              child: Consumer<ItemProvider>(
                builder: (context, value, child) {
                  return value.allItems.isEmpty
                      ? Center(child: Text('No Items'))
                      : ListView.builder(
                          padding: EdgeInsets.all(10),
                          physics: BouncingScrollPhysics(),
                          itemCount: value.allItems.length,
                          itemBuilder: (context, index) => WeeklyInventryCard(
                            // rname: value.allRooms[index].rname,
                            model: value.allItems[index],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
