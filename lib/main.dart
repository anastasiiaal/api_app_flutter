import 'package:api_app_flutter/ui/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        // textTheme: GoogleFonts.montserratTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        fontFamily: 'Montserrat'
      ),
      home: const HomePage(),
    );
  }
}