import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

alertDialogWarning({
  required BuildContext context,
  required String title,
  required String desc,
}) {
  return AwesomeDialog(
    dialogBackgroundColor: backGroundColor,
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: title,
    desc: desc,
    btnOkOnPress: () {},
    btnOkColor: Colors.amber[600],
    btnOkText: 'برگشت',
    // buttonsTextStyle: getBodyBoldWhiteStyle(context),
  ).show();
}

alertDialogError({
  required BuildContext context,
  required String title,
  required String desc,
})  {
  return AwesomeDialog(
    dialogBackgroundColor: backGroundColor,
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: title,
    desc: desc,
    btnOkOnPress: () {},
    btnOkColor: primaryColor,
    btnOkText: 'برگشت',
    // buttonsTextStyle: getBodyBoldWhiteStyle(context),
  ).show();
}
