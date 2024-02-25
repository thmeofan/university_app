import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_app/consts/app_colors.dart';
import 'package:university_app/consts/app_text_styles/home_screen_text_style.dart';

class ShortUniInfoWidget extends StatelessWidget {
  final String name;
  final String address;
  final int rating;
  final VoidCallback onTap;

  ShortUniInfoWidget({
    required this.name,
    required this.address,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(
            size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/hat.svg'),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(name, style: HomeScreenTextStyle.name),
              SizedBox(
                height: size.height * 0.005,
              ),
              Text(
                address,
                style: HomeScreenTextStyle.address,
              ),
              Row(
                children: [
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: index < rating ? Colors.yellow : Colors.grey,
                      );
                    }),
                  ),
                  Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: AppColors.bluishGreenColor,
                    ),
                    height: size.height * 0.05,
                    width: size.height * 0.06,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
