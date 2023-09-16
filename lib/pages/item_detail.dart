import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/home_page.dart';
import 'package:grocery/pages/introduction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemDetail extends StatefulWidget {
  final String itemName;
  final String itemId;
  final int itemPrice;
  final String itemDisc;

  const ItemDetail({
    super.key,
    required this.itemName,
    required this.itemId,
    required this.itemPrice,
    required this.itemDisc,
  });

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

void addToCart(id, name, price) async {
  final prefs = await SharedPreferences.getInstance();
  final cartItems = prefs.getStringList("cartItems") ?? [];
  cartItems.add(id);

  prefs.setStringList('cartItems', cartItems);
  prefs.setString("$id\$_name", name.toString());
  prefs.setInt("$id\$_price", int.parse(price.toString()));
}

void removeItem(String id) async {
  final pref = await SharedPreferences.getInstance();
  List<String>? items = pref.getStringList("items");
  items?.remove(id);
  pref.setStringList("items", items!);
}

class _ItemDetailState extends State<ItemDetail> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 78, 85),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 78, 85),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Item Details",
          style: GoogleFonts.fahkwang(
              textStyle: const TextStyle(color: Colors.white, fontSize: 15)),
        ),
        actions: [
          // Icon(
          //   Icons.more_vert,
          //   // textDirection: TextDirection.rtl,
          // ),
          const Icon(Icons.share),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            color: const Color.fromARGB(255, 5, 24, 51),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                // value: 3,
                child: Row(
                  children: [
                    const Icon(
                      Icons.share,
                      color: Color.fromARGB(255, 120, 153, 153),
                      size: 18,
                    ),
                    Text(
                      " Share",
                      style: GoogleFonts.kaiseiDecol(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 120, 153, 153),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    fav = !fav; // Toggle the favorite state
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: fav
                          ? Colors.red
                          : const Color.fromARGB(255, 120, 153, 153),
                      size: 18,
                    ),
                    Text(
                      " like",
                      style: GoogleFonts.kaiseiDecol(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 120, 153, 153),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                // value: 3,
                child: Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 249, 37, 83),
                      size: 18,
                    ),
                    Text(
                      " delete",
                      style: GoogleFonts.kaiseiDecol(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 120, 153, 153),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.grey.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://media-cdn.tripadvisor.com/media/photo-s/06/ca/7d/be/bar-35-food-drinks.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  widget.itemName,
                  style: GoogleFonts.fahkwang(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 29, 79, 80),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  '${widget.itemPrice}\$',
                  style: GoogleFonts.zillaSlab(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 240, 124, 61),
                    ),
                  ),
                ),
                const SizedBox(width: 21),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Any cut bun with a hot filling, such as a chicken burger Angel burger, pulled pork burger, veggie burger, etc.",
              style: GoogleFonts.radley(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 122, 139, 155),
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 21),
            const SizedBox(height: 21),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      addToCart(
                          widget.itemId, widget.itemName, widget.itemPrice);

                      final snackBar = SnackBar(
                        backgroundColor: const Color.fromARGB(255, 11, 56, 64),
                        content: const Text('Added!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                        elevation: 10,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.add),
                    label: Text(
                      "Add to cart", //!call the function here
                      style: GoogleFonts.fahkwang(
                        textStyle: TextStyle(fontSize: 10),
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 38, 124, 109),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(14)),
                  ),
                  const SizedBox(width: 10),
                  TextButton.icon(
                    onPressed: () {
                      removeItem(widget.itemId);
                      final snackBar = SnackBar(
                        backgroundColor: const Color.fromARGB(255, 11, 56, 64),
                        content: const Text('Deleted!'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                        elevation: 10,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    label: Text(
                      "Remove item",
                      style: GoogleFonts.fahkwang(
                          textStyle: const TextStyle(fontSize: 10)),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 240, 46, 56),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(14)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 50, 134, 128),
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
