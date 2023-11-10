#ifndef FLUTTER_PLUGIN_COUNTRY_PHONE_FIELD_PLUGIN_H_
#define FLUTTER_PLUGIN_COUNTRY_PHONE_FIELD_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace country_phone_field {

class CountryPhoneFieldPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  CountryPhoneFieldPlugin();

  virtual ~CountryPhoneFieldPlugin();

  // Disallow copy and assign.
  CountryPhoneFieldPlugin(const CountryPhoneFieldPlugin&) = delete;
  CountryPhoneFieldPlugin& operator=(const CountryPhoneFieldPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace country_phone_field

#endif  // FLUTTER_PLUGIN_COUNTRY_PHONE_FIELD_PLUGIN_H_
