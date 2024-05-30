import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/features/page_transitions/widgets/transition_pages.dart';

class BottomNavigationBarViewModel {
  ValueNotifier<int> navIndex = ValueNotifier(0);

  void onClickIndexChange(int newIndex) {
    navIndex.value = newIndex;
  }

  Widget? getPages(){
    return TransitionPages.getPages(navIndex.value);
  }
}
