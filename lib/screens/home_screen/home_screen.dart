import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/screens/seperated_screens/final_count_form.dart';
import 'package:inventry_management_app/screens/seperated_screens/inventry_history.dart';
import 'package:inventry_management_app/screens/seperated_screens/items_screen.dart';
import 'package:inventry_management_app/screens/seperated_screens/rooms_screen.dart';
import 'package:inventry_management_app/screens/seperated_screens/weekly_inventry_count.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/util_function.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomContainer(
              size: size,
              text: 'Weekly Inventry Count',
              icon: Icons.inventory,
              onTap: () {
                UtilFunction.navigateTo(context, WeeklyInventryCount());
              }),
          SizedBox(
            height: 10,
          ),
          CustomContainer(
              size: size,
              text: 'Inventry History',
              icon: Icons.history,
              onTap: () {
                UtilFunction.navigateTo(context, InventryHistory());
              }),
          SizedBox(
            height: 10,
          ),
          CustomContainer(
              size: size,
              text: 'Final Count Form',
              icon: Icons.format_align_justify,
              onTap: () {
                UtilFunction.navigateTo(context, FinalCountForm());
              }),
          SizedBox(
            height: 10,
          ),
          CustomContainer(
            size: size,
            text: 'Items',
            icon: Icons.food_bank_sharp,
            onTap: () {
              UtilFunction.navigateTo(context, ItemsScreen());
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomContainer(
              size: size,
              text: 'Rooms',
              icon: Icons.room,
              onTap: () {
                UtilFunction.navigateTo(context, RoomsScreen());
              }),
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.size,
      required this.text,
      required this.icon,
      required this.onTap})
      : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: size.width,
        alignment: Alignment.centerLeft,
        color: kwhite,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Cblue,
            ),
            CustomText(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kblack,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
