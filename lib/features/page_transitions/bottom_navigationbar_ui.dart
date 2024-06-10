import 'package:flutter/material.dart';

class BottomNavigationBarUi extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const BottomNavigationBarUi(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          activeIcon: Icon(
            Icons.home_filled,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          activeIcon: Icon(
            Icons.saved_search_outlined,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outlined,
          ),
          activeIcon: Icon(
            Icons.person,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_outlined,
          ),
          activeIcon: Icon(
            Icons.settings,
          ),
          label: '',
        ),
      ],
      iconSize: 25,
      currentIndex: selectedIndex,
      onTap: (index) {
        onTap(index);
      },
    );
  }
}
