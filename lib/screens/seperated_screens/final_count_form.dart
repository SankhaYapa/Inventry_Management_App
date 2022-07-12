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
  void initState() {
    // TODO: implement initState
    Provider.of<RoomProvider>(context, listen: false).calAllrooms();
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Total Quantity',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: Provider.of<RoomProvider>(context, listen: false)
                            .totalRooms,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
