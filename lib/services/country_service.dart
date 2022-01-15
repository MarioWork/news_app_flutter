import 'package:news_app/models/country_model.dart';

class CountryService {
  List<CountryModel> countries = [CountryModel(0, 'Portugal', 'pt'), CountryModel(1, 'Brasil', 'br')];

  CountryModel getFirstCountry() {
    return countries.first;
}

  List<CountryModel> getAllCountries() {
    return countries;
  }
}
