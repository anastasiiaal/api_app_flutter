class Country {
  String flagUrl;
  String countryName;
  int? population;
  String region;
  String subRegion;
  String capital;
  List<String> currencies;
  List<String> languages;

  Country({
    this.flagUrl = "",
    this.countryName = "",
    this.population,
    this.region = "",
    this.subRegion = "",
    this.capital = "",
    this.currencies = const [],
    this.languages = const [],
  });
}