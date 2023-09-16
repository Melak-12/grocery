import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

final nameController = TextEditingController();
final discController = TextEditingController();
final priceController = TextEditingController();
final imageController = TextEditingController();

File? selectedImg;

void storeData(id, name, price, disc) async {
  final prefs = await SharedPreferences.getInstance();

  final existingItems = prefs.getStringList('items') ?? [];
  existingItems.add(id);

  prefs.setStringList('items', existingItems);
  prefs.setString("$id\$_name", name.toString());
  prefs.setInt("$id\$_price", int.parse(price.toString()));
  prefs.setString("$id\$_disc", disc.toString());
}

void fetchData() async {
  final prefs = await SharedPreferences.getInstance();
  final itemList = prefs.getStringList('items') ?? [];

  for (final itemId in itemList) {
    final itemName = prefs.getString("$itemId\$_name") ?? '';
    final itemPrice = prefs.getInt("$itemId\$_price") ?? 0;
    final itemDisc = prefs.getString("$itemId\$_disc") ?? '';

    print('Item ID: $itemId');
    print('Item Name: $itemName');
    print('Item Price: $itemPrice');
    print('Item Description: $itemDisc');
    print('------------------------');
  }
}

const spinkit = SpinKitRotatingCircle(
  color: Color.fromARGB(255, 25, 172, 60),
  size: 50.0,
);
void showAddItemBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  // hintText: "Item's name",
                  labelText: "Name",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please add the name of the item";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  // hintText: "Item's price",
                  labelText: "Price",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please insert the price of the item";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: discController,
                decoration: const InputDecoration(
                  // hintText: "Description",
                  labelText: "Description",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    String itemName = nameController.text;
                    String itemPrice = priceController.text;
                    String itemDisc = discController.text;

                    String timeStamp =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    String itemId = "item_$timeStamp";

                    storeData(itemId, itemName, itemPrice, itemDisc);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Item Name: $itemName")),
                    );
                    spinkit;
                    fetchData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(22),
                ),
                child: const Text('Add Item'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
