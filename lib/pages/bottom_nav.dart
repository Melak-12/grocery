import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  int currentIndex = 0;
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int idex) {
        setState(() {
          currentIndex = idex;
          print("index $currentIndex tapped!");
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "settings",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: Colors.red),
          label: "fav",
        )
      ],
    );
  }
}
