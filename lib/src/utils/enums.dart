import 'package:country_phone_field/src/utils/utils.dart';

enum FlagType {
  svg,
  icon,
}

enum Continent {
  africa(ContinentKeys.africa),
  antarctica(ContinentKeys.antarctica),
  asia(ContinentKeys.asia),
  europe(ContinentKeys.europe),
  northAmerica(ContinentKeys.northAmerica),
  oceania(ContinentKeys.oceania),
  southAmerica(ContinentKeys.southAmerica);

  factory Continent.fromString(String data) => <String, Continent>{
        Continent.africa.key: Continent.africa,
        Continent.antarctica.key: Continent.antarctica,
        Continent.asia.key: Continent.asia,
        Continent.europe.key: Continent.europe,
        Continent.northAmerica.key: Continent.northAmerica,
        Continent.oceania.key: Continent.oceania,
        Continent.southAmerica.key: Continent.southAmerica,
      }[data]!;

  const Continent(this.key);
  final String key;
}
