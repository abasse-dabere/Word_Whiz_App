import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.arimo(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: GetStartedPage(),
      home: GetStartedPage(),
    );
  }
}
