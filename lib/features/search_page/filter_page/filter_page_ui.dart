import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterPageUi {
  static void showFilterModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.grey[800],
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sort and Filter', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),)
            ],
          ),
        );
      },
    );
  }
}
