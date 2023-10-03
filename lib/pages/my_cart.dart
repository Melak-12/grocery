import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/components/payment_method.dart';
// import 'package:grocery/pages/home_page.dart';
import 'package:grocery/pages/main_parent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int size = 0;
  List<String> items = [];
  String name = "";
  int price = 0;
  String disc = "";
  int totalPrice = 0;
  late SharedPreferences prefs;
  bool shoudIRemoveItem = false;
  @override
  void initState() {
    super.initState();
    getCartItems();
    calcTotalPrice();
  }

  getCartItems() async {
    prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList("cartItems") ?? [];
    setState(() {
      size = items.length;
    });
    calcTotalPrice();
  }

  void calcTotalPrice() {
    totalPrice = 0;
    for (final i in items) {
      final itemId = i;

      final itemPrice = prefs.getInt("$itemId\$_price") ?? 0;
      setState(() {
        totalPrice = totalPrice + itemPrice;
      });
    }
  }

  void removeItem(String id) async {
    items.remove(id);
    await prefs.setStringList("cartItems", items);
    setState(() {
      size--;
    });
    calcTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 78, 85),
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text(
          "My cart",
          textAlign: TextAlign.center,
          style: GoogleFonts.fahkwang(
            textStyle: const TextStyle(fontSize: 12),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.2),
              child: Center(
                child: Text(
                  "My Cart",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ibmPlexSans(
                    textStyle: const TextStyle(
                        color: Color.fromARGB(255, 122, 139, 155),
                        fontSize: 30,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            size > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final itemId = items[index];
                        final itemName =
                            prefs.getString("$itemId\$_name") ?? "no name";
                        final itemPrice = prefs.getInt("$itemId\$_price") ?? 0;
                        final imagePath =
                            prefs.getString("$itemId\$_image_path");

                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              onLongPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainParent()),
                                );
                              },
                              title: Text(itemName),
                              leading: imagePath != null
                                  ? Image.file(
                                      File(imagePath),
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      'https://media-cdn.tripadvisor.com/media/photo-s/06/ca/7d/be/bar-35-food-drinks.jpg',
                                      fit: BoxFit.cover,
                                    ),
                              subtitle: Text(itemPrice.toString() + " \$"),
                              trailing: TextButton(
                                child: const Icon(
                                  Icons.cancel,
                                  color: Color.fromARGB(255, 255, 89, 12),
                                ),
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    backgroundColor:
                                        Color.fromARGB(255, 11, 56, 64),
                                    content: const Text('Removing!'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        setState(() {
                                          shoudIRemoveItem = true;
                                        });
                                      },
                                    ),
                                    elevation: 10,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  // if (!shoudIRemoveItem) {
                                  removeItem(itemId);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    heightFactor: 14,
                    child: Text(
                      "There is no item in your cart!",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total price",
                          style: TextStyle(color: Colors.green[100]),
                        ),
                        Text(
                          "$totalPrice \$",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Payment();
                          },
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.green.shade100,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              "Pay now ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
