import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/home_page.dart';
import 'package:grocery/providers/main_parent_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ItemForm extends StatefulWidget {
  final File? selectedImage;
  const ItemForm({super.key, this.selectedImage});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final discController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();

  // File? selectedImg;

  void storeData(id, name, price, disc) async {
    final prefs = await SharedPreferences.getInstance();

    final existingItems = prefs.getStringList('items') ?? [];
    existingItems.add(id);

    prefs.setStringList('items', existingItems);
    prefs.setString("$id\$_name", name.toString());
    prefs.setInt("$id\$_price", int.parse(price.toString()));
    prefs.setString("$id\$_disc", disc.toString());
    // prefs.clear();
    if (images != null) {
      prefs.setString("$id\$_image_path", images!.path);
    }
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

  File? images;
  Future pickImages() async {
    try {
      final image = await ImagePicker.platform.getImageFromSource(
        source: ImageSource.gallery,
      );
      if (image == null) {
        return;
      }

      final tempImage = File(image.path);
      setState(() {
        images = tempImage;
      });
    } on PlatformException catch (e) {
      print("Faild to pick the image");
    }
  }

  final spinkit = const SpinKitRotatingCircle(
    color: Color.fromARGB(255, 25, 172, 60),
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 78, 85),
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text(
          "Add Items",
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(
                "Add Items",
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 122, 139, 155),
                      fontSize: 30,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Form(
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
                      height: 32,
                    ),
                    TextFormField(
                      controller: discController,
                      decoration: const InputDecoration(
                        // hintText: "Description",
                        labelText: "Description",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          // borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    images != null
                        ? Image.file(
                            images!,
                            fit: BoxFit.cover,
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    pickImages();
                                  },
                                  child: const Text(
                                    "Choose The Image",
                                  )),
                              IconButton(
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  pickImages();
                                },
                              ),
                            ],
                          ),
                    const SizedBox(height: 51),
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
                            MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                create: (context) => MainModel(),
                                child: const HomePage(),
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.all(25),
                      ),
                      child: const Text('Add Item'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
