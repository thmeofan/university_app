import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

typedef RatingChangeCallback = void Function(int rating);

class StarRating extends StatelessWidget {
  final int rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {required this.rating,
      required this.onRatingChanged,
      this.color = Colors.amber});

  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () => onRatingChanged(index + 1),
      child: SvgPicture.asset(
        'assets/icons/star.svg',
        color: index < rating ? color : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) => buildStar(index + 1)),
    );
  }
}
