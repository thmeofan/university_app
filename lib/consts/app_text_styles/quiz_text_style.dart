import 'package:flutter/material.dart';

import '../app_colors.dart';

class QuizTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32.0,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle theme = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle date = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(0.5),
  );
  static const TextStyle dialogueTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle message = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );
  static TextStyle dates = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(0.5),
  );
}
