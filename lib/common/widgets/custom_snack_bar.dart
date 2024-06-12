import 'package:flutter/material.dart';

class CustomSnackbar{
  static void show(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? ''),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
