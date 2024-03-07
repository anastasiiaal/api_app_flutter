import 'package:api_app_flutter/ui/country_page.dart';
import 'package:flutter/material.dart';
import '../model/country.dart';
import '../utils/fetch_country_data.dart';

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
        backgroundColor: Colors.cyan[800],
        title: const Text('Country API', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  width: width - 60,
                  child: Image.asset(
                    'images/globe.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                customTextField(controller: searchEditingController, hint: "Select your country", edgeInsets: const EdgeInsets.all(12.0)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      Country country = await fetchCountryData(searchEditingController.text);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) => CountryPage(country: country)),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString(), textAlign: TextAlign.center,)),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.cyan[800]),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Find country', style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    )),
                  ),
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
        style: const TextStyle(fontSize: 20),
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(hintText: hint),
        onSubmitted: null,
      ),
    );
  }
}