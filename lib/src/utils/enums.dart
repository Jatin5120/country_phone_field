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

  const Continent(this.key);
  final String key;
}
