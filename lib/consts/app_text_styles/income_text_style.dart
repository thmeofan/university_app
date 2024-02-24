import 'package:flutter/material.dart';

import '../app_colors.dart';

class IncomeTextStyle {
  static TextStyle titleIncome = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    height: 22 / 18,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(0.5),
  );
  static const TextStyle titleHistory = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    height: 22 / 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle amount = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle amountZero = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48.0,
    fontWeight: FontWeight.w700,
    color: Colors.black.withOpacity(0.5),
  );
  static TextStyle transactions = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.5),
  );
  static TextStyle tileSum = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    height: 20 / 18,
    fontWeight: FontWeight.w800,
    color: Colors.black.withOpacity(0.5),
  );
  static const TextStyle tileSubtitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle addIncome = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
  );
}
