import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/components/settings.dart';
import 'package:grocery/pages/home_page.dart';
import 'package:grocery/pages/my_cart.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MainParent extends StatefulWidget {
  const MainParent({super.key});

  @override
  State<MainParent> createState() => _MainParentState();
}

class _MainParentState extends State<MainParent> {
  int currentIndex = 0;
  PageController pageController = PageController();
  final List<Widget> pages = [
    const HomePage(),
    const MyCart(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          children: pages,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: currentIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            currentIndex = index;
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: GoogleFonts.fahkwang(
                    textStyle: TextStyle(fontSize: 11, letterSpacing: 1)),
              ),
              activeColor: Colors.green,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.favorite),
                title: Text(
                  'Favorites',
                  style: GoogleFonts.fahkwang(
                      textStyle: TextStyle(fontSize: 11, letterSpacing: 1)),
                ),
                activeColor: Colors.purpleAccent),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: GoogleFonts.fahkwang(
                      textStyle: TextStyle(fontSize: 11, letterSpacing: 1)),
                ),
                activeColor: const Color.fromARGB(255, 131, 145, 156)),
          ],
        ));
  }
}
