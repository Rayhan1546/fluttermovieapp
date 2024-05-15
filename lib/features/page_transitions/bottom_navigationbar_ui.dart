import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/features/page_transitions/bottom_navigationbar_viewModel.dart';

class BottomNavigationBarUi extends StatelessWidget {
  BottomNavigationBarUi({Key? key});

  BottomNavigationBarViewModel viewModel = BottomNavigationBarViewModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewModel.navIndex,
        builder: (context, selectedIndex, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black87,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.home_filled,
                  color: Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.saved_search_outlined,
                  color: Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: '',
              ),
            ],
            iconSize: 25,
            currentIndex: selectedIndex,
            onTap: (index) {
              viewModel.onClickIndexChange(index);
            },
          );
        });
  }
}
