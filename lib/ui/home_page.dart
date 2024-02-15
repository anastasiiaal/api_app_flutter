import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double containerWidth = width - 30;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text('Country API 🌍', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey[900])),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  width: width - 30,
                  height: 200,
                  child: Image.asset(
                    'images/world_map.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: null,
                  //     () {
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CountryPage()));
                  // },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blueGrey[400]),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                  child: const Text('Find country', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  )),
                ),
              ],
            ),
          )
      ),
    );
  }
}