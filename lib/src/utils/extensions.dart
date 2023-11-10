import 'package:country_phone_field/country_phone_field.dart';

extension FindPhone on List<CountryModel> {
  CountryModel? findByCountryCode(int countryCode) => cast<CountryModel?>()
      .firstWhere((e) => e!.countryCode == countryCode, orElse: () => null);

  CountryModel? findByISOCode(String isoCode) => cast<CountryModel?>()
      .firstWhere((e) => e!.isoCode == isoCode, orElse: () => null);
}
