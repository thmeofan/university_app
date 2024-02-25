import 'package:flutter/material.dart';

import '../app_colors.dart';

class ConstructorTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle hintText = TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.greyColor);

  static TextStyle rating = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.5),
  );
  static const TextStyle inputText = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle appBar = TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.bluishGreenColor);

  static const TextStyle add = TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.orangeColor);

  static TextStyle lable = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(0.5),
  );
  static TextStyle priority = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.5),
  );
}
