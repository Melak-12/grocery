import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroceryItemTiles extends StatefulWidget {
  final String id;
  const GroceryItemTiles({super.key, required this.id});

  @override
  State<GroceryItemTiles> createState() => _GroceryItemTilesState();
}

class _GroceryItemTilesState extends State<GroceryItemTiles> {
  // String name1 = '';
  String name = '';
  int price = 0;
  String disc = '';

  @override
  void initState() {
    super.initState();
    fetchData("item1");
  }

  fetchData(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final name1 = prefs.getString("$id\$_name");
    final price1 = prefs.getInt("$id\$_price");
    final disc1 = prefs.getString("$id\$_disc");
    setState(() {
      name = name1 ?? "no item";
      price = price1 ?? 0;
      disc = disc1 ?? "no disc";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(
        8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(9), // Adjust the padding as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green[100],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://media-cdn.tripadvisor.com/media/photo-s/06/ca/7d/be/bar-35-food-drinks.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  name,
                  style: GoogleFonts.fahkwang(
                    textStyle:
                        TextStyle(fontSize: 15, color: Colors.green[600]),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                // Text(
                //   disc,
                //   style: GoogleFonts.acme(),
                // ),
                Text(
                  '$price \$',
                  style: GoogleFonts.zillaSlab(
                    textStyle: const TextStyle(
                        color: Color.fromARGB(255, 240, 124, 61)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
