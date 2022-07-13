import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:inventry_management_app/components/custom_text.dart';
import 'package:inventry_management_app/controllers/sql_helper.dart';
import 'package:inventry_management_app/model/room_model.dart';
import 'package:inventry_management_app/providers/home/item_provide.dart';
import 'package:inventry_management_app/providers/home/room_provider.dart';
import 'package:inventry_management_app/screens/seperated_screens/final_count_form.dart';
import 'package:inventry_management_app/screens/seperated_screens/inventry_history.dart';
import 'package:inventry_management_app/screens/seperated_screens/items_screen.dart';
import 'package:inventry_management_app/screens/seperated_screens/rooms_screen.dart';
import 'package:inventry_management_app/screens/seperated_screens/weekly_inventry_count.dart';
import 'package:inventry_management_app/utils/app_colors.dart';
import 'package:inventry_management_app/utils/constant.dart';
import 'package:inventry_management_app/utils/util_function.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ItemProvider>(context, listen: false).refreshItems();
    Provider.of<RoomProvider>(context, listen: false).refreshRooms();
    Provider.of<RoomProvider>(context, listen: false).clearRoomList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperSection(size: size),
            SizedBox(
              height: 10,
            ),
            CustomContainer(
                size: size,
                text: 'Weekly Inventry Count',
                icon: Icons.inventory_sharp,
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
                  UtilFunction.navigateTo(context, RoomSceern());
                }),
          ],
        ),
      ),
    ));
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height / 5,
          decoration: BoxDecoration(
            color: Upurpule,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        Positioned(
          top: 70,
          left: 30,
          child: Container(
            height: 100,
            width: size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    Constants.imageAssets(
                      'logo.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(children: [
                  CustomText(
                    text: "Welcome!",
                    color: kwhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                  CustomText(
                    text: "FMS Inventory Aid",
                    color: kwhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    style: TextStyle(
                        color: kwhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 1),
                    textAlign: TextAlign.start,
                  )
                ])
              ],
            ),
          ),
        ),
      ],
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
        height: 90,
        width: size.width,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                icon,
                color: kwhite,
              ),
              decoration: BoxDecoration(
                  color: Cblue,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            SizedBox(
              width: 10,
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
