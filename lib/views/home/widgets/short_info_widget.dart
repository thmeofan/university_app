import 'package:flutter/material.dart';

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
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(address),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: index < rating ? Colors.yellow : Colors.grey,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
