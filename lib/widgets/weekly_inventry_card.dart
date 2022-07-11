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

import 'package:inventry_management_app/utils/new_show_form.dart';
import 'package:provider/provider.dart';

class WeeklyInventryCard extends StatefulWidget {
  const WeeklyInventryCard({
    Key? key,
    //required this.rname,
    required this.model,
  }) : super(key: key);
  //
  final ItemModel model;

  @override
  State<WeeklyInventryCard> createState() => _WeeklyInventryCardState();
}

class _WeeklyInventryCardState extends State<WeeklyInventryCard> {
  int _itemsCount = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
        color: Colors.blue,
        child: Consumer<CounterProvider>(
          builder: (context, value, child) {
            return ListTile(
              title: Text(
                widget.model.iname,
                style: TextStyle(fontSize: 20, color: kwhite),
              ),
              // subtitle: Text(
              //   model.measurement.toString(),
              // ),
              trailing: _bultdTrailingWidget(context),
            );
          },
        ));
  }

  Widget _bultdTrailingWidget(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  Provider.of<CounterProvider>(context, listen: false)
                      .decreaseCounter();
                });
              },
              icon: Icon(
                Icons.remove,
                color: kwhite,
              )),
          Consumer<CounterProvider>(
            builder: (context, value, child) {
              return CustomText(
                text: value.getCounter.toString(),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kblack,
              );
            },
          ),
          CustomText(
            text: widget.model.measurement.toString(),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kblack,
          ),
          IconButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .increaseCounter();
              },
              icon: Icon(
                Icons.add,
                color: kwhite,
              )),
        ],
      ),
    );
  }
}
