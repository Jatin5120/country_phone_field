import 'dart:convert';

class CountryModel {
  const CountryModel({
    required this.name,
    required this.flag,
    required this.flagSvg,
    required this.countryCode,
    required this.isoCode,
    required this.maxLength,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) => CountryModel(
        name: map['name'] as String,
        flag: map['flag'] as String,
        flagSvg: '',
        countryCode: map['country_code'] as int,
        isoCode: map['iso_code'] as String,
        maxLength: map['max_length'] as int,
      );

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final String flag;
  final String flagSvg;
  final int countryCode;
  final String isoCode;
  final int maxLength;

  CountryModel copyWith({
    String? name,
    String? flag,
    String? flagSvg,
    int? countryCode,
    String? isoCode,
    int? maxLength,
  }) =>
      CountryModel(
        name: name ?? this.name,
        flag: flag ?? this.flag,
        countryCode: countryCode ?? this.countryCode,
        isoCode: isoCode ?? this.isoCode,
        maxLength: maxLength ?? this.maxLength,
        flagSvg: flagSvg ?? this.flagSvg,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'flag': flag,
        'country_code': countryCode,
        'iso_code': isoCode,
        'max_length': maxLength,
        'flagSvg': flagSvg,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CountryModel(name: $name, flag: $flag, flagSvg: $flagSvg, countryCode: $countryCode, isoCode: $isoCode, maxLength: $maxLength)';

  String log() =>
      "CountryModel(name: CountryKeys.$name, flag: '$flag', flagSvg: '$flagSvg', countryCode: $countryCode, isoCode: '$isoCode', maxLength: $maxLength,)";

  @override
  bool operator ==(covariant CountryModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.flag == flag &&
        other.countryCode == countryCode &&
        other.isoCode == isoCode &&
        other.maxLength == maxLength &&
        other.flagSvg == flagSvg;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      flag.hashCode ^
      countryCode.hashCode ^
      isoCode.hashCode ^
      maxLength.hashCode ^
      flagSvg.hashCode;
}
