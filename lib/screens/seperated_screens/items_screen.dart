import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';
import 'package:inventry_management_app/model/item_mode.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/dialogs_items.dart';
import 'package:inventry_management_app/utils/new_show_form.dart';
import 'package:inventry_management_app/widgets/item_card.dart';
import 'package:provider/provider.dart';

import '../../providers/home/item_provide.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  SqlHelper sqlHelper = SqlHelper();

  _ItemsScreenState() {
    selectvalue = items[0];
  }
  final items = [
    'lbs',
    'gal',
    'pouch',
  ];
  String? selectvalue = "";

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ItemProvider>(context, listen: false).refreshItems();
    super.initState();
  }

  //show bottom sheet function
  // void _showForm(BuildContext context, ItemModel? model) {
  //   //set the existing rooms name to the text controllers
  //   if (model != null) {
  //     Provider.of<ItemProvider>(context, listen: false)
  //         .setTextControllers(model);
  //
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20), topRight: Radius.circular(20))),
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //             child: Padding(
  //                 padding: const EdgeInsets.symmetric(horizontal: 20),
  //                 child: Consumer<ItemProvider>(
  //                   builder: (context, value, child) {
  //                     return Column(
  //                       children: [
  //                         SizedBox(
  //                           height: 20,
  //                         ),
  //                         CustomTextField(
  //                           controller: value.inameController,
  //                           hintText: 'Item Name',
  //                         ),
  //                         SizedBox(
  //                           height: 20,
  //                         ),
  //                         DropdownButtonFormField(
  //                             value: selectvalue,
  //                             items: items
  //                                 .map((e) => DropdownMenuItem(
  //                                       child: Text(e),
  //                                       value: e,
  //                                     ))
  //                                 .toList(),
  //                             onChanged: (val) {
  //                               selectvalue = val as String;
  //                               ;
  //                             },
  //                             icon: Icon(Icons.arrow_drop_down_circle,
  //                                 color: Cblue),
  //                             decoration: InputDecoration(
  //                               labelText: "Select Masure",
  //                               border: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(10),
  //                                   borderSide: BorderSide(
  //                                       color:
  //                                           Color.fromARGB(255, 40, 40, 40))),
  //                             )),
  //                         SizedBox(
  //                           height: 70,
  //                         ),
  //                         SizedBox(
  //                           width: double.infinity,
  //                           height: 60,
  //                           child: ElevatedButton(
  //                               style: ButtonStyle(
  //                                   foregroundColor:
  //                                       MaterialStateProperty.all<Color>(
  //                                           Colors.white),
  //                                   // backgroundColor:
  //                                   //     MaterialStateProperty.all<Color>(Colors.red),
  //                                   shape: MaterialStateProperty.all<
  //                                           RoundedRectangleBorder>(
  //                                       RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(10),
  //                                           side: BorderSide(color: Cblue)))),
  //                               onPressed: () async {
  //                                 //save new room if model is null
  //                                 if (model == null) {
  //                                   await value.addNewItem(
  //                                       context, selectvalue.toString());
  //                                 } else {
  //                                   //update the room if model is not null
  //                                   await value.updateItem(context, model.id!);
  //                                 }

  //                                 //when update close the bottom sheet
  //                                 Navigator.of(context).pop();
  //                               },
  //                               child: Text(
  //                                 model != null ? 'Update Item' : 'Add Item',
  //                                 style: TextStyle(fontSize: 16),
  //                               )),
  //                         )
  //                       ],
  //                     );
  //                   },
  //                 )));
  //       });
  // }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

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
                    model: value.allItems[index],
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        //onPressed: () => showForm(context, null,),
        onPressed: () =>
            ShowForms.showForm(context, null, selectvalue.toString()),
        icon: Icon(Icons.add),
        label: Text('Add Items'),
      ),
    );
  }
}
