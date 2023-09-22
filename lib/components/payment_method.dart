import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 78, 85),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Payment Method",
          style: GoogleFonts.fahkwang(
              textStyle: const TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "select your payment method",
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 122, 139, 155),
                      fontSize: 22,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 22,
                  crossAxisSpacing: 30,
                ),
                padding: const EdgeInsets.all(30),
                children: [
                  Card(
                    color: Colors.grey[100],
                    child: ListTile(
                      title: Image.asset(
                        "lib/images/abay.jpeg",
                      ),
                      subtitle: Text(
                        "Abay bank",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(22),
                    child: Image.asset("lib/images/abyssinia.png"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(22),
                    child: Image.asset("lib/images/telebirr.png"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(22),
                    child: Image.asset("lib/images/amhraBank.png"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 214, 214),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(22),
                    child: Image.asset("lib/images/wegagen.jpeg"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.brown[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(22),
                    child: Image.asset("lib/images/ngd.jpeg"),
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
