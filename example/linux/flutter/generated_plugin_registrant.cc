//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <country_phone_field/country_phone_field_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) country_phone_field_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "CountryPhoneFieldPlugin");
  country_phone_field_plugin_register_with_registrar(country_phone_field_registrar);
}
