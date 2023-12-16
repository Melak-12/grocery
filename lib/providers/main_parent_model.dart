import 'package:flutter/material.dart';
import 'package:grocery/components/settings.dart';
import 'package:grocery/pages/home_page.dart';
import 'package:grocery/pages/my_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  // final itemId = null;
  void incCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
    // print(currentIndex);
  }

  final List<Widget> _pages = [
    const HomePage(),
    const MyCart(),
    const Settings(),
  ];
  List<Widget> get pages => _pages;

  //! HomePage
  MainModel() {
    sharedPref();
  }
  int _size = 0;
  int get size => _size;
  int _cartItemSize = 0;
  int get cartItemsize => _cartItemSize;
  String _name = "";
  String get name => _name;
  bool _liked = false;
  bool get liked => _liked;

  void toggleLike() {
    _liked = !_liked;
    notifyListeners();
  }

  List<String> items = [];
  List<String> cartItems = [];
  late SharedPreferences prefs;

  void sharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    items = prefs.getStringList("items") ?? [];
    cartItems = prefs.getStringList("cartItems") ?? [];
    _size = items.length;
    _cartItemSize = cartItems.length;
  }

  Future<String> proImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString("profile_path");

    return imagePath ?? "No image !";
  }

  String getGreeting() {
    final now = DateTime.now();
    final currentTime = TimeOfDay.fromDateTime(now);
    final hour = currentTime.hour;

    if (hour < 12) {
      return "Good morning!";
    } else if (hour < 17) {
      return "Good afternoon!";
    } else {
      return "Good evening !";
    }
  }

  String getItemName(int index) {
    sharedPref();
    // if (index >= 0 && index < items.length) {
    final itemId = items[index];
    return prefs.getString("$itemId\$_name") ?? "no name";
    // }
    // return "No name";
  }

  int getItemPrice(int index) {
    if (index >= 0 && index < items.length) {
      final itemId = items[index];
      return prefs.getInt("$itemId\$_price") ?? 0;
    }
    return 0;
  }

  String getItemDisc(int index) {
    if (index >= 0 && index < items.length) {
      final itemId = items[index];
      return prefs.getString("$itemId\$_disc") ?? "no disc";
    }
    return "No disc";
  }

  String getItemImagePath(int index) {
    if (index >= 0 && index < items.length) {
      final itemId = items[index];
      return prefs.getString("$itemId\$_image_path") ?? "no image";
    }
    return "No image";
  }
}
// }
