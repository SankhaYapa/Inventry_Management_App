import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
      body: Container(),
    );
  }
}
