import 'package:flutter/material.dart';

class BoxShapeText extends StatelessWidget {
  final String text;
  final Color color;

  const BoxShapeText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: color, // Border color
          width: 1.2, // Border width
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
