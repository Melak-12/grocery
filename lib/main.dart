// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:grocery/firebase_options.dart';
import 'package:grocery/pages/introduction.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
}

// final ThemeData customTheme = ThemeData(primaryColor: Colors.amber);
// fdsdf
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 33, 43, 42),
        brightness: Brightness.light,
        splashColor: Colors.green,
      ),
      color: Colors.black,
      home: const Intro(),
    );
  }
}
