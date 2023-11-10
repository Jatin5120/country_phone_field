import 'dart:convert';

class PhoneNumber {
  const PhoneNumber({
    required this.number,
    required this.countryCode,
    required this.isoCode,
  });

  factory PhoneNumber.fromMap(Map<String, dynamic> map) => PhoneNumber(
        number: map['number'] as String,
        countryCode: map['countryCode'] as int,
        isoCode: map['isoCode'] as String,
      );

  factory PhoneNumber.fromJson(String source) =>
      PhoneNumber.fromMap(json.decode(source) as Map<String, dynamic>);

  final String number;
  final int countryCode;
  final String isoCode;

  PhoneNumber copyWith({
    String? number,
    int? countryCode,
    String? isoCode,
  }) =>
      PhoneNumber(
        number: number ?? this.number,
        countryCode: countryCode ?? this.countryCode,
        isoCode: isoCode ?? this.isoCode,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'number': number,
        'countryCode': countryCode,
        'isoCode': isoCode,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'PhoneNumber(number: $number, countryCode: $countryCode, isoCode: $isoCode)';

  @override
  bool operator ==(covariant PhoneNumber other) {
    if (identical(this, other)) return true;

    return other.number == number &&
        other.countryCode == countryCode &&
        other.isoCode == isoCode;
  }

  @override
  int get hashCode => number.hashCode ^ countryCode.hashCode ^ isoCode.hashCode;
}
