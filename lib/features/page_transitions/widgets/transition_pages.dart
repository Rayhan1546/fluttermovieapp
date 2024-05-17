import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/features/cart_box/cart_box_ui.dart';
import 'package:mymovieapp/features/home_page/homepage_ui.dart';

class TransitionPages {
  static Widget? getPages(int index) {
    switch (index) {
      case 0:
        return HomePageUi();
      case 1:
        return Scaffold();
      case 2:
        return CartBoxUi();
      case 3:
        return Scaffold();
      default:
        return null;
    }
  }
}
