import 'package:flutter/material.dart';

var kButtonSolidPrimary = ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size.fromHeight(45)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.black.withOpacity(0.5);
      }
      return Colors.black;
    }),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    elevation: MaterialStateProperty.all(0));

final kButtonSolidPrimaryRound = kButtonSolidPrimary.copyWith(
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
  ),
);
