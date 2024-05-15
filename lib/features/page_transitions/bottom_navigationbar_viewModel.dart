import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/features/home_page/homepage_ui.dart';

class BottomNavigationBarViewModel {
  ValueNotifier<int> navIndex = ValueNotifier(0);
  ValueNotifier<String> screen = ValueNotifier('HomePageUi');

  void onClickIndexChange(int newIndex) {
    navIndex.value = newIndex;
  }

  Widget? getPage(int indexVal) {
    print(indexVal);
    if (indexVal == 0) return HomePageUi();
    if (indexVal == 1) return Scaffold();
    if (indexVal == 2) return Scaffold();
    if (indexVal == 3) return Scaffold();
    return null;
  }
}
