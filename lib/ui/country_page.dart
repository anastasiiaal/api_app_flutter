import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  CountryPageState createState() => CountryPageState();
}

class CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text('countryName here', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey[900])),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  height: 200,
                  width: width - 30,
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0,2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'images/fr.png',
                    ),
                  )
                ),
                const SizedBox(height: 50),
              ],
            ),
          )
      ),
    );
  }
}