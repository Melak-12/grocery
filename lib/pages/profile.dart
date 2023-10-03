import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? profileImage;
  void chooseProfile() async {
    try {
      final image = await ImagePicker.platform.getImageFromSource(
        source: ImageSource.gallery,
      );
      if (image == null) {
        return;
      }

      final tempImage = File(image.path);
      setState(() {
        profileImage = tempImage;
      });
      final prefs = await SharedPreferences.getInstance();
      if (profileImage != null) {
        prefs.setString("profile_path", profileImage!.path);
      }
    } on PlatformException catch (e) {
      print("couldnt load image");
    }
  }

  Future<String> proImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString("profile_path");

    return imagePath ?? "No image !";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 78, 85),
        foregroundColor: Colors.green[200],
        title: Text(
          'Profile  ',
          style: GoogleFonts.fahkwang(
            textStyle: TextStyle(
              fontSize: 15,
              color: Colors.green[100],
              letterSpacing: 3,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 99, 192, 183),
                          Color.fromARGB(255, 26, 48, 75),
                          Color.fromARGB(255, 67, 76, 87),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: FutureBuilder<String>(
                                future: proImage(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    final imagePath = snapshot.data!;
                                    return Image.file(
                                      File(imagePath),
                                      fit: BoxFit.cover,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () => chooseProfile(),
                              child: const Icon(Icons.add_a_photo),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      "Melak",
                      style: GoogleFonts.fahkwang(color: Colors.green[800]),
                    ),
                    const Icon(
                      Icons.edit,
                      // size: 16,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.extended(
                          onPressed: () {},
                          elevation: 4,
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text("My items"),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {},
                          label: const Text('favorites'),
                          icon: const Icon(Icons.favorite),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text(
                        "Email",
                      ),
                      leading: Icon(Icons.email),
                      subtitle: Text("Melakabebeee@gmail.com"),
                      trailing: Icon(
                        Icons.arrow_right_outlined,
                        size: 44,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text("privacy"),
                      leading: Icon(Icons.privacy_tip),
                      // trailing: Icon(Icons.arrow_forward_ios),
                      trailing: Icon(
                        Icons.arrow_right_outlined,
                        size: 44,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text("help and support "),
                      leading: Icon(Icons.help),
                      trailing: Icon(
                        Icons.arrow_right_outlined,
                        size: 44,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text(
                        "Settings",
                      ),
                      leading: Icon(Icons.settings),
                      trailing: Icon(
                        Icons.arrow_right_outlined,
                        size: 44,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
