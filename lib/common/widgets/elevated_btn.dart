import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElevatedBtn extends StatelessWidget {

  final String buttonText;
  final Color backgroundColor;
  final Color textcolor;
  final VoidCallback onPressed;
  final double? fontsize;

  ElevatedBtn({
    required this.buttonText,
    required this.backgroundColor,
    required this.onPressed,
    required this.textcolor, this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color
        foregroundColor: textcolor, // Text color
        textStyle: TextStyle(
          fontSize: fontsize == null ? 20 : fontsize,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Box shape
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
