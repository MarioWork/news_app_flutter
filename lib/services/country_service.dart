import 'package:news_app/models/country_model.dart';

class CountryService {
  List<CountryModel> countries = [
    CountryModel('Portugal', 'pt'),
    CountryModel('Brasil', 'br'),
    CountryModel('Estados Unidos', 'us'),
    CountryModel('França', 'fr'),
  ];

  CountryModel getFirstCountry() {
    return countries.first;
  }

  List<CountryModel> getAllCountries() {
    return countries;
  }
}
