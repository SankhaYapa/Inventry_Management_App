import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:inventry_management_app/utils/app_colors.dart';

class NotificationDialog {
  static show(
    BuildContext context,
    String title,
    String des,
  ) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.TOPSLIDE,
      desc: des,
      title: title,
      btnOkOnPress: () {},
      btnOkColor: dashback,
    ).show();
  }
}
