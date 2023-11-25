import 'package:country_phone_field/country_phone_field.dart';
import 'package:flutter/foundation.dart';

extension FindPhone on List<CountryModel> {
  CountryModel? findByCountryCode(int countryCode) => cast<CountryModel?>()
      .firstWhere((e) => e!.countryCode == countryCode, orElse: () => null);

  CountryModel? findByISOCode(String isoCode) => cast<CountryModel?>()
      .firstWhere((e) => e!.isoCode == isoCode, orElse: () => null);

  List<CountryModel> allowedCountries(List<Continent>? continents) {
    if (continents == null || continents.isEmpty) {
      return this;
    }
    if (listEquals(continents, Continent.values)) {
      return this;
    }
    return where((e) => continents.contains(e.continent)).toList();
  }
}
