import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/main_parent.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    var yo = "";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(
                  left: 80.0, right: 80, bottom: 80, top: 20),
              child: Image.asset('lib/images/burger1.png'),
            ),
            //we deliver grocery and foods
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "We deliver foods at your doorstep !",
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 122, 139, 155),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            //fresh items everyday

            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainParent()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 13, 114, 114),
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "get Started",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
