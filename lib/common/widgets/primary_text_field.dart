import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {

  final String? errortext;
  TextEditingController controller;
  final String label;

  PrimaryTextField({
    super.key, required this.errortext, required this.controller, required this.label
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorText: errortext,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70, width: 3.0),
        ),
      ),
    );
  }
}
