import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class BoxShapeText extends StatelessWidget {
  final String text;

  BoxShapeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.white, // Border color
          width: 1, // Border width
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white, // Color of the text
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
