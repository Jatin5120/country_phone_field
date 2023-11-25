import 'dart:convert';

import 'package:country_phone_field/src/utils/utils.dart';

class CountryModel {
  const CountryModel({
    required this.name,
    required this.flag,
    required this.flagSvg,
    required this.countryCode,
    required this.isoCode,
    required this.maxLength,
    required this.continent,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) => CountryModel(
        name: map['name'] as String,
        flag: map['flag'] as String,
        flagSvg: '',
        countryCode: map['country_code'] as int,
        isoCode: map['iso_code'] as String,
        maxLength: map['max_length'] as int,
        continent: Continent.fromString(map['continent'] as String),
      );

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final String flag;
  final String flagSvg;
  final int countryCode;
  final String isoCode;
  final int maxLength;
  final Continent continent;

  CountryModel copyWith({
    String? name,
    String? flag,
    String? flagSvg,
    int? countryCode,
    String? isoCode,
    int? maxLength,
    Continent? continent,
  }) =>
      CountryModel(
        name: name ?? this.name,
        flag: flag ?? this.flag,
        countryCode: countryCode ?? this.countryCode,
        isoCode: isoCode ?? this.isoCode,
        maxLength: maxLength ?? this.maxLength,
        flagSvg: flagSvg ?? this.flagSvg,
        continent: continent ?? this.continent,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'flag': flag,
        'country_code': countryCode,
        'iso_code': isoCode,
        'max_length': maxLength,
        'flagSvg': flagSvg,
        'continent': continent.key,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CountryModel(name: $name, flag: $flag, flagSvg: $flagSvg, countryCode: $countryCode, isoCode: $isoCode, maxLength: $maxLength, continent: $continent)';

  String log() =>
      "static const CountryModel $name = CountryModel(name: CountryKeys.$name, flag: '$flag', flagSvg: '$flagSvg', countryCode: $countryCode, isoCode: '$isoCode', maxLength: $maxLength, continent: $continent,);";

  @override
  bool operator ==(covariant CountryModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.flag == flag &&
        other.countryCode == countryCode &&
        other.isoCode == isoCode &&
        other.maxLength == maxLength &&
        other.flagSvg == flagSvg &&
        other.continent == continent;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      flag.hashCode ^
      countryCode.hashCode ^
      isoCode.hashCode ^
      maxLength.hashCode ^
      flagSvg.hashCode ^
      continent.hashCode;
}
