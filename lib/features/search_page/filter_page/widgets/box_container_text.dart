import 'package:flutter/material.dart';

class BoxContainerText extends StatelessWidget {
  final String text;
  final bool? isSelected;
  final VoidCallback? onClicked;

  const BoxContainerText({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onClicked
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isSelected == true)? Colors.black : Colors.transparent,
        border: Border.all(
          color: Colors.white, // Border color
          width: 1.2, // Border width
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        hoverColor: Colors.grey,
        onTap: onClicked,
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 3, 12, 3),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
