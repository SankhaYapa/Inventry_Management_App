import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/components/custome_textfield.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final List<String> items = ['item 1', 'item 2', 'item 3', 'item 4'];
  String value = 'item 1';
  //show bottom sheet function
  @override
  void _showForm() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: 'Item Name',
                ),
                DropdownButton<String>(
                    value: value,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue!;
                      });
                    }),
              ],
            ),
          ));
        });
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showForm(),
        icon: Icon(Icons.add),
        label: Text('Add Items'),
      ),
    );
  }
}
