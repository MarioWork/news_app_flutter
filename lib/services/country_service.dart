import 'package:news_app/models/country_model.dart';

class CountryService {
  List<CountryModel> countries = [

    CountryModel(0, 'Portugal', 'pt'),
    CountryModel(1, 'Brasil', 'br'),
    CountryModel(2, 'Estados Unidos', 'us'),
    CountryModel(3, 'França', 'fr'),

  ];

  CountryModel getFirstCountry() {
    return countries.first;
  }

  List<CountryModel> getAllCountries() {
    return countries;
  }
}
