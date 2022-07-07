import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(color: kgreen, height: 400),
          Container(
            color: korange,
            height: 400,
            child: Column(
              children: [
                Container(
                  child: CustomText(text: 'Weekly Inventry Count'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomText(text: 'Inventry History'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomText(text: 'Final Count Form'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomText(text: 'Items'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CustomText(text: 'Rooms'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
