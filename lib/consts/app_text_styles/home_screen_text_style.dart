import 'package:flutter/material.dart';

import '../app_colors.dart';

class HomeScreenTextStyle {
  static TextStyle name = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle address = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.35),
  );
  static const TextStyle appbar = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0,
    height: 22 / 20,
    fontWeight: FontWeight.w700,
    // color: AppColors.whiteColor,
  );
  static const TextStyle banner = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 48.0,
    fontWeight: FontWeight.w700,
  );
}
