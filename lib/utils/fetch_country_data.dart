import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/country.dart';

Future<Country> fetchCountryData(String countryName) async {
  final response = await http.get(Uri.parse('https://restcountries.com/v3.1/name/$countryName'));

  if (response.statusCode == 200) {
    final List<dynamic> countryJson = json.decode(response.body);
    if (countryJson.isNotEmpty) {
      return Country(
        flagUrl: countryJson[0]['flags']['png'] ?? "—",
        countryName: countryJson[0]['name']['common'] ?? "—",
        officialName: countryJson[0]['name']['official'] ?? "—",
        population: countryJson[0]['population'] ?? "—",
        region: countryJson[0]['region'] ?? "—",
        subRegion: countryJson[0]['subregion'] ?? "—",
        capital: countryJson[0]['capital'] != null ? countryJson[0]['capital'][0] : "—",
        currencies: (countryJson[0]['currencies'] != null) ?
          countryJson[0]['currencies'].values.map((currency) => currency['name']).toList().cast<String>() :
          ["—"],
        languages: (countryJson[0]['languages'] != null) ? countryJson[0]['languages'].values.toList().cast<String>() : ["—"],
        domains: (countryJson[0]['tld'] != null) ? List<String>.from(countryJson[0]['tld']) : ["—"],
        borderCountries: (countryJson[0]['borders'] != null) ? List<String>.from(countryJson[0]['borders']) : [],
      );
    } else {
      throw Exception('No country found');
    }
  } else {
    throw Exception('No country found');
  }
}