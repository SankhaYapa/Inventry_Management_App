import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/dialogs_items.dart';
import 'package:inventry_management_app/widgets/item_card.dart';
import 'package:provider/provider.dart';

import '../../providers/home/item_provide.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ItemProvider>(context, listen: false).refreshItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
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
                      model: value.allItems[index]),
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => UtilsItems.showForm(context, null),
        icon: Icon(Icons.add),
        label: Text('Add Items'),
      ),
    );
  }
}
