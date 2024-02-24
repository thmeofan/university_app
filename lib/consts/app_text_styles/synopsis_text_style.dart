import 'package:flutter/material.dart';

import '../app_colors.dart';

class SynopsisTextStyle {
  static TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    height: 20 / 18,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(0.5),
  );

  static const TextStyle read = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0,
    height: 18 / 12,
    fontWeight: FontWeight.w400,
    color: AppColors.bluishGreenColor,
  );
  static const TextStyle appbar = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
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
