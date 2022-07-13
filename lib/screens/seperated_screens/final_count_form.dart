import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';

import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/constant.dart';
import 'package:inventry_management_app/widgets/final_count_form_card.dart';
import 'package:inventry_management_app/widgets/room_card.dart';
import 'package:provider/provider.dart';

class FinalCountForm extends StatefulWidget {
  const FinalCountForm({Key? key}) : super(key: key);

  @override
  State<FinalCountForm> createState() => _FinalCountFormState();
}

class _FinalCountFormState extends State<FinalCountForm> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ItemProvider>(context, listen: false).calAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Final Count Form"),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(text: 'Product '),
                  SizedBox(
                    width: 90,
                  ),
                  CustomText(text: 'Measurment'),
                  SizedBox(
                    width: 30,
                  ),
                  CustomText(text: 'Size'),
                  SizedBox(
                    width: 30,
                  ),
                  CustomText(text: 'Total'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer<ItemProvider>(
              builder: (context, value, child) {
                return value.allItems.isEmpty
                    ? Center(child: Text('No Rooms'))
                    : ListView.builder(
                        padding: EdgeInsets.all(10),
                        physics: BouncingScrollPhysics(),
                        itemCount: value.allItems.length,
                        itemBuilder: (context, index) => FinalCountFormCard(
                          // rname: value.allRooms[index].rname,
                          model: value.allItems[index],
                        ),
                      );
              },
            ),
          ),
        ],
      )),
    );
  }
}
