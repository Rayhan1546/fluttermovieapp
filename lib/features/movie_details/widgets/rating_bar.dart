import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;

  RatingBar({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: Colors.amber,
        );
      }),
    );
  }
}
