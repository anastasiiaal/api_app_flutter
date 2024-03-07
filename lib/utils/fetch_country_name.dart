import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchCountryName(String countryCode) async {
  final response = await http.get(Uri.parse('https://restcountries.com/v3.1/alpha/$countryCode'));

  if (response.statusCode == 200) {
    final countryJson = json.decode(response.body);
    return countryJson[0]['name']['common'];
  } else {
    throw Exception('Failed to load country name');
  }
}
