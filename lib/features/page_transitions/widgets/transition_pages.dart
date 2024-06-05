import 'package:flutter/material.dart';
import 'package:mymovieapp/features/home_page/homepage_ui.dart';
import 'package:mymovieapp/features/search_page/search_page_ui.dart';
import 'package:mymovieapp/features/settings_page/settings_page_ui.dart';
import 'package:mymovieapp/features/watch_list/watch_list_ui.dart';

class TransitionPages {
  static Widget? getPages(int index) {
    switch (index) {
      case 0:
        return HomePageUi();
      case 1:
        return SearchPageUi();
      case 2:
        return WatchListUi();
      case 3:
        return SettingsPageUi();
      default:
        return null;
    }
  }
}
