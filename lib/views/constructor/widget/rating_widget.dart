import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarRatingWidget extends StatefulWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;

  StarRatingWidget({required this.rating, required this.onRatingChanged});

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  int currentRating = 0;

  @override
  void initState() {
    super.initState();
    currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          icon: SvgPicture.asset(
            'assets/icons/star.svg',
            color: index < currentRating ? Colors.yellow : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              currentRating = index + 1;
            });
            widget.onRatingChanged(currentRating);
          },
        );
      }),
    );
  }
}
