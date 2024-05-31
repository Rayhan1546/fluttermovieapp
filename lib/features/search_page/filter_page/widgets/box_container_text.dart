import 'package:flutter/material.dart';

class BoxContainerText extends StatelessWidget {
  final String text;
  final bool? isSelected;
  final VoidCallback? onClicked;

  const BoxContainerText({
    Key? key, // Add key parameter
    required this.text,
    this.isSelected = false,
    this.onClicked,
  }) : super(key: key); // Set the key parameter in super constructor

  @override
  Widget build(BuildContext context) {
    return Material( // Wrap with Material widget
      color: Colors.transparent,
      child: InkWell(
        hoverColor: Colors.grey,
        onTap: onClicked,
        child: Container(
          decoration: BoxDecoration(
            color: (isSelected == true)? Colors.black : Colors.transparent,
            border: Border.all(
              color: Colors.white, // Border color
              width: 1.2, // Border width
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
