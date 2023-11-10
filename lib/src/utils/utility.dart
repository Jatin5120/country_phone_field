import 'package:country_phone_field/country_phone_field.dart';
import 'package:country_phone_field/src/repository.dart';
import 'package:country_phone_field/src/utils/extensions.dart';
import 'package:flutter/widgets.dart';

class Utility {
  const Utility._();

  static void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static String? ipAddress;

  static Future<CountryModel> get getInitialCountry async {
    ipAddress ??= await PhoneRepository.getIP();
    if (ipAddress == null) {
      return kDefaultCountry;
    }
    var data = await PhoneRepository.getCountryFromIP(ipAddress!);
    if (data == null) {
      return kDefaultCountry;
    }
    var isoCode = data['country_code2'] as String?;

    if (isoCode == null) {
      return kDefaultCountry;
    }

    return kAllCountries.findByISOCode(isoCode) ?? kDefaultCountry;
  }
}
