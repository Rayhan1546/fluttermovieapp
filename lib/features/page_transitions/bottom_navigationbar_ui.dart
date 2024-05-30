import 'package:flutter/material.dart';

class BottomNavigationBarUi extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const BottomNavigationBarUi({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
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
        onTap(index);
      },
    );
  }
}
