import 'dart:convert';

import 'package:country_phone_field/country_phone_field.dart';
import 'package:http/http.dart' as http;

class PhoneRepository {
  const PhoneRepository._();

  static Future<String?> getIP() async {
    try {
      var res = await http.get(Uri.parse('https://api64.ipify.org'));
      AppLog(res.body);
      if (res.statusCode == 200) {
        return res.body;
      }
      return null;
    } catch (e, st) {
      AppLog.error(e, st);
      return null;
    }
  }

  static Future<Map<String, dynamic>?> getCountryFromIP(String ip) async {
    try {
      var res = await http.get(Uri.parse('https://api.iplocation.net/?ip=$ip'));
      AppLog(res.body);
      return jsonDecode(res.body);
    } catch (e, st) {
      AppLog.error(e, st);
      return null;
    }
  }
}
