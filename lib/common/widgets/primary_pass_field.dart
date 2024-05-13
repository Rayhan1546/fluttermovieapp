import 'package:flutter/material.dart';

class PrimaryPassField extends StatelessWidget {
  final TextEditingController controller;
  final bool obsecurebool;
  final VoidCallback onpressed;
  final String? errortext;
  final String label;

  PrimaryPassField({super.key, required this.controller, required this.obsecurebool,required this.onpressed,
  required this.errortext, required this.label});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecurebool,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorText: errortext,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        suffixIcon: IconButton(
          icon: obsecurebool ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          onPressed: onpressed,
        ),
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
