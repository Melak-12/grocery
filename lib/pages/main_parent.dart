import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:grocery/providers/main_parent_model.dart';
import 'package:provider/provider.dart';

class MainParent extends StatefulWidget {
  const MainParent({super.key});

  @override
  State<MainParent> createState() => _MainParentState();
}

class _MainParentState extends State<MainParent> {
  PageController pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final mainModel = Provider.of<MainModel>(context, listen: false);
    return Scaffold(
      body: PageView(
        controller: pageController,
        //TODO pages applied here
        children: mainModel.pages,
        onPageChanged: (int index) {
          // context.read<MainModel>().incCurrentIndex(index);
          setState(() {
            currentPage = index;
          });
          mainModel.incCurrentIndex(index);
          // print(index);
          // print(currentPage);
        },
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: true,
        onItemSelected: (value) {
          // print(mainModel.currentIndex);
          mainModel.incCurrentIndex(value);
          pageController.animateToPage(value,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        selectedIndex: currentPage,
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home),
            title: Text(
              'Home',
              style: GoogleFonts.fahkwang(
                  textStyle: const TextStyle(fontSize: 11, letterSpacing: 1)),
            ),
            activeColor: Colors.green,
          ),
          BottomNavyBarItem(
              icon: const Icon(Icons.favorite),
              title: Text(
                'My Items',
                style: GoogleFonts.fahkwang(
                  textStyle: const TextStyle(fontSize: 11, letterSpacing: 1),
                ),
              ),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: Text(
                'Settings',
                style: GoogleFonts.fahkwang(
                  textStyle: const TextStyle(fontSize: 11, letterSpacing: 1),
                ),
              ),
              activeColor: const Color.fromARGB(255, 131, 145, 156)),
        ],
      ),
    );
  }
}
