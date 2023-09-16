import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/main_parent.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 78, 85),
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text(
          "Settings",
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
      body: Container(
        color: Colors.grey.shade200,
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.2),
              child: Center(
                child: Text(
                  "Settings",
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
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      hoverColor: Colors.red,
                      title: Text("Options"),
                      // leading: Icon(Icons.shopping_cart),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text("liked carts"),
                      leading: Icon(Icons.shopping_cart),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text("Email "),
                      leading: Icon(Icons.email),
                      subtitle: Text("Melakabebeee@gmail.com"),
                      trailing: Icon(Icons.edit),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text(
                        "Delete Account ",
                        style: TextStyle(color: Colors.red),
                      ),
                      leading: Icon(Icons.delete),
                      // subtitle: Text("Melakabebeee@gmail.com"),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  const Divider(
                    thickness: 4,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text("Others"),
                      // leading: Icon(Icons.shopping_cart),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text(
                        "info ",
                      ),
                      leading: Icon(Icons.info),
                      // subtitle: Text("Melakabebeee@gmail.com"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text(
                        "Contact us",
                      ),
                      leading: Icon(Icons.call),
                      // subtitle: Text("Melakabebeee@gmail.com"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 11, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const ListTile(
                      title: Text(
                        "version ",
                      ),
                      leading: Icon(Icons.verified),
                      subtitle: Text("1.1"),
                    ),
                  ),
                ],
                // itemCount: 3,
                // itemBuilder: (context, index) {
                //   return Padding(
                //     padding: const EdgeInsets.all(12),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         color: Colors.grey[200],
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //       child: ListTile(
                //         onLongPress: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const MainParent()),
                //           );
                //         },
                //         title: Text("Email"),
                //         leading: Icon(Icons.man),
                //         subtitle: Text(" \$"),
                //         trailing: TextButton(
                //           child: const Icon(
                //             Icons.edit,
                //             color: Color.fromARGB(255, 255, 89, 12),
                //           ),
                //           onPressed: () {
                //             final snackBar = SnackBar(
                //               backgroundColor: Color.fromARGB(255, 11, 56, 64),
                //               content: const Text('Removing!'),
                //               action: SnackBarAction(
                //                 label: 'Undo',
                //                 onPressed: () {
                //                   setState(() {});
                //                 },
                //               ),
                //               elevation: 10,
                //             );
                //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //             // if (!shoudIRemoveItem) {
                //           },
                //         ),
                //       ),
                //     ),
                //   );
                // },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 86, 86),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      size: 18,
                      color: Colors.red.shade100,
                    ),
                    const SizedBox(
                      width: 21,
                    ),
                    Text(
                      "Log out",
                      style: TextStyle(color: Colors.red[100]),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
