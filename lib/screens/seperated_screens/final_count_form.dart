import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inventry_management_app/components/custom_text.dart';
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
          //UpperSection(),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 30,
          //   ),
          //   child: Container(
          //     width: double.infinity,
          //     height: 111,
          //     decoration: BoxDecoration(
          //         color: korange, borderRadius: BorderRadius.circular(15)),
          //     child: Stack(
          //       children: [
          //         Positioned(
          //             left: 23,
          //             top: 23,
          //             child: Icon(
          //               Icons.location_on_outlined,
          //               color: kwhite,
          //             )),
          //         Positioned(
          //           top: 23,
          //           left: 54,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               // CustomText(
          //               //   text: 'Delivered to:',
          //               //   fontSize: 14,
          //               //   fontWeight: FontWeight.w400,
          //               //   color: kwhite,
          //               // ),
          //               // CustomText(
          //               //   text: '242 5T Marks Eve,\nFinlend',
          //               //   fontSize: 14,
          //               //   fontWeight: FontWeight.w400,
          //               //   color: kwhite,
          //               // )
          //             ],
          //           ),
          //         ),
          //         Positioned(
          //             right: 17,
          //             top: 52,
          //             child: Icon(
          //               Icons.keyboard_arrow_down,
          //               color: kwhite,
          //             )),
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: Consumer<RoomProvider>(
              builder: (context, value, child) {
                return value.allRooms.isEmpty
                    ? Center(child: Text('No Rooms'))
                    : ListView.builder(
                        padding: EdgeInsets.all(10),
                        physics: BouncingScrollPhysics(),
                        itemCount: value.allRooms.length,
                        itemBuilder: (context, index) => FinalCountFormCard(
                          // rname: value.allRooms[index].rname,
                          model: value.allRooms[index],
                        ),
                      );
              },
            ),
          ),
          FooterSection(size: size),
        ],
      )),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Container(
            color: korange,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Total Quantity',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: '14',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Calculate',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
