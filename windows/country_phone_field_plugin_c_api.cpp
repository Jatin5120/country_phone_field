#include "include/country_phone_field/country_phone_field_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "country_phone_field_plugin.h"

void CountryPhoneFieldPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  country_phone_field::CountryPhoneFieldPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
