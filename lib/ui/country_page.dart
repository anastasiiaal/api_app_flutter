import 'package:api_app_flutter/widgets/simple_text_widget.dart';
import 'package:api_app_flutter/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import '../model/country.dart';
import 'package:intl/intl.dart';
import '../utils/fetch_country_name.dart';

class CountryPage extends StatefulWidget {
  final Country country;
  const CountryPage({super.key, required this.country});

  @override
  CountryPageState createState() => CountryPageState();
}

class CountryPageState extends State<CountryPage> {
  List<String> borderCountryNames = [];

  @override
  void initState() {
    super.initState();
    fetchBorderCountryNames();
  }

  void fetchBorderCountryNames() async {
    if (widget.country.borderCountries.isNotEmpty) {
      final requests = widget.country.borderCountries.map((code) => fetchCountryName(code));
      final names = await Future.wait(requests);
      setState(() {
        borderCountryNames = names;
      });
    } else {
      borderCountryNames = ["—"];
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double containerWidth = width - 30;
    double columnWidth = containerWidth / 2 - 5;
    String formattedPopulation = NumberFormat('#,##0', 'en_US').format(widget.country.population);

    return Scaffold(
      backgroundColor: Colors.blueGrey[30],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text(widget.country.countryName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey[900])),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  height: 200,
                  width: containerWidth,
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
                    child: Image(
                      image: NetworkImage(widget.country.flagUrl),
                    ),
                  )
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SmallTitle(width: columnWidth, text: "Full name"),
                        SimpleText(width: columnWidth, text: widget.country.officialName),
                        const SizedBox(height: 20),
                        SmallTitle(width: columnWidth, text: "Capital"),
                        SimpleText(width: columnWidth, text: widget.country.capital),
                        const SizedBox(height: 20),
                        SmallTitle(width: columnWidth, text: "Languages"),
                        SimpleText(width: columnWidth, text: widget.country.languages.join(", ")),
                        const SizedBox(height: 20),
                        SmallTitle(width: columnWidth, text: "Currencies"),
                        SimpleText(width: columnWidth, text: widget.country.currencies.join(", ")),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Column(
                      children: [
                        SmallTitle(width: columnWidth, text: "Population"),
                        SimpleText(width: columnWidth, text: formattedPopulation),
                        const SizedBox(height: 20),
                        SmallTitle(width: columnWidth, text: "Region"),
                        SimpleText(width: columnWidth, text: widget.country.region),
                        const SizedBox(height: 20),
                        SmallTitle(width: columnWidth, text: "Sub Region"),
                        SimpleText(width: columnWidth, text: widget.country.subRegion),
                        const SizedBox(height: 20),
                        SmallTitle(width: columnWidth, text: "Domain"),
                        SimpleText(width: columnWidth, text: widget.country.domains.join(", ")),
                        const SizedBox(height: 20),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        SmallTitle(width: containerWidth, text: "Border countries"),
                        SimpleText(width: containerWidth, text: borderCountryNames.join(", ")),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          )
      ),
    );
  }
}