import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  SettingsTile({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.065,
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/arrow.svg',
              width: 14.0,
              height: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
