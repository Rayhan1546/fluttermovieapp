import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/features/page_transitions/bottom_navigationbar_ui.dart';
import 'package:mymovieapp/features/page_transitions/bottom_navigationbar_viewModel.dart';
import 'package:mymovieapp/features/home_page/homepage_ui.dart';

class PageTransitionUi extends StatelessWidget {
  PageTransitionUi({Key? key});

  final BottomNavigationBarViewModel viewModel = BottomNavigationBarViewModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: viewModel.navIndex,
      builder: (context, selectedIndex, _) {
        return Scaffold(
          body: viewModel.getPage(selectedIndex),
          bottomNavigationBar: BottomNavigationBarUi(),
        );
      },
    );
  }
}
