import 'package:flutter/material.dart';

import '../../constant/color.dart';


class CustomSnack {

  static void successSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text('Congratulations! \n $message'),
    ));
    // Get.snackbar('Congratulations!',
    //   message,
    //   colorText: white,
    //   backgroundColor: primaryColor,
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }

  static void warningSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text('Warning! \n $message'),
    ));
    // Get.snackbar('Warning!',
    //   message,
    //   colorText: white,
    //   backgroundColor: primaryColor,
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }
}

