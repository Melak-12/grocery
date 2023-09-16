import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/components/item_form.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool dark = false;
  void darkMode() {
    dark = !dark;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 38, 48, 48),
      width: 220,
      child: ListView(
        children: [
          DrawerHeader(
            curve: Curves.bounceIn,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 24, 68, 78),
            ),
            child: Center(
                child: Text(
              "Options",
              style: GoogleFonts.fahkwang(
                  textStyle:
                      const TextStyle(color: Colors.white, fontSize: 25)),
            )),
          ),
          ListTile(
            hoverColor: const Color.fromARGB(255, 24, 68, 78),
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.add),
            title: Text(
              "Add Items",
              style: GoogleFonts.fahkwang(),
            ),
            focusColor: const Color.fromARGB(255, 59, 122, 136),
            onTap: () {
              Navigator.pop(context);
              showAddItemBottomSheet(context);
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            hoverColor: const Color.fromARGB(255, 24, 68, 78),
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.pop(context);
            },
            title: Text(
              "favorites",
              style: GoogleFonts.fahkwang(),
            ),
            focusColor: Color.fromARGB(255, 59, 122, 136),
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            hoverColor: const Color.fromARGB(255, 24, 68, 78),
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.rate_review),
            title: Text(
              "Highly rated",
              style: GoogleFonts.fahkwang(),
            ),
            focusColor: const Color.fromARGB(255, 59, 122, 136),
            onTap: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            hoverColor: const Color.fromARGB(255, 24, 68, 78),
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.shop),
            title: Text(
              "My items",
              style: GoogleFonts.fahkwang(),
            ),
            focusColor: const Color.fromARGB(255, 59, 122, 136),
            onTap: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          ListTile(
            hoverColor: const Color.fromARGB(255, 24, 68, 78),
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.dark_mode),
            title: Text(
              "dark mode",
              style: GoogleFonts.fahkwang(),
            ),
            focusColor: const Color.fromARGB(255, 59, 122, 136),
            onTap: () {
              darkMode();
            },
          ),
          const SizedBox(
            height: 95,
          ),
          const Divider(
            thickness: 3,
            color: Color.fromARGB(255, 43, 85, 50),
          ),
          ListTile(
            hoverColor: const Color.fromARGB(255, 24, 68, 78),
            iconColor: Colors.white,
            textColor: Colors.white,
            leading: const Icon(Icons.settings),
            title: Text(
              "Settings",
              style: GoogleFonts.fahkwang(),
            ),
            focusColor: Color.fromARGB(255, 59, 122, 136),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
