import 'package:flutter/material.dart';

import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) onTapped;
  const BottomNavBar({
    Key? key,
    required this.index,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      selectedItemColor: mBlueBackground,
      unselectedItemColor: mSubtitleColor,
      backgroundColor: Colors.white,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      elevation: 0,
      onTap: onTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset("assets/icons/home.png", height: 20),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/icons/menu.png", height: 20),
          label: "Categories",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/icons/store.png", height: 20),
          label: "Stores",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/icons/user.png", height: 20),
          label: "Profile",
        ),
      ],
    );
  }
}
