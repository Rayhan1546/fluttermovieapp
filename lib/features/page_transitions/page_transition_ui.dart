import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/features/page_transitions/bottom_navigationbar_ui.dart';
import 'package:mymovieapp/features/page_transitions/page_transition_viewmodel.dart';
import 'package:mymovieapp/features/page_transitions/widgets/transition_pages.dart';

class PageTransitionUi extends StatelessWidget {
  PageTransitionUi({Key? key});

  final BottomNavigationBarViewModel viewModel = BottomNavigationBarViewModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: viewModel.navIndex,
      builder: (context, selectedIndex, _) {
        print(selectedIndex);
        return Scaffold(
          body: viewModel.getPages(),
          bottomNavigationBar: BottomNavigationBarUi(
            selectedIndex: selectedIndex,
            onTap: (int newIndex) {
              viewModel.onClickIndexChange(newIndex);
            },
          ),
        );
      },
    );
  }
}
