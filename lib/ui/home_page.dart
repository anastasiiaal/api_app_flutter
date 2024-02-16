import 'package:api_app_flutter/ui/country_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late TextEditingController searchEditingController;

  @override
  void initState() {
    super.initState();
    searchEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                customTextField(controller: searchEditingController, hint: "Select your coutry", edgeInsets: const EdgeInsets.all(12.0)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => const CountryPage()));
                  },
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

  Widget customTextField({
    required EdgeInsets edgeInsets,
    required TextEditingController controller,
    String? hint
  }) {
    return Padding(
      padding: edgeInsets,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(hintText: hint),
        onSubmitted: null,
      ),
    );
  }
}