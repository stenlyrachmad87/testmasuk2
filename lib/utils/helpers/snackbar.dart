import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmasuk2/utils/helpers/error_res.dart';

showSnackBar(
  message, {
  String? textButton,
  Function()? onClick,
  Color textButtonColor = Colors.black,
}) {
  String errorMessage = '';
  int errorCode = 0;

  if (message is ErrorRes) {
    errorMessage = message.message;
    errorCode = message.code;
  } else {
    errorMessage = message;
  }

  Get.snackbar(
    '',
    '',
    titleText: const SizedBox(),
    padding: EdgeInsets.zero,
    messageText: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        if (errorCode != 401 &&
            textButton != null &&
            textButton.isNotEmpty) ...[
          TextButton(
            onPressed: onClick,
            child: Text(
              textButton,
              style: TextStyle(color: textButtonColor),
            ),
          ),
          const SizedBox(width: 20),
        ]
      ],
    ),
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.GROUNDED,
    margin: EdgeInsets.zero,
    backgroundColor: Colors.black,
    colorText: Colors.white,
    /*duration: Duration(seconds: 10)*/
  );
}
