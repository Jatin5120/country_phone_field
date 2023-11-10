library country_phone_field;

import 'package:country_phone_field/country_phone_field.dart';
import 'package:country_phone_field/src/utils/extensions.dart';
import 'package:flutter/material.dart';

export 'src/data/countries.dart';
export 'src/models/models.dart';
export 'src/utils/utils.dart';
export 'src/widgets/widgets.dart';

class CountryPhoneField extends StatefulWidget {
  const CountryPhoneField({
    super.key,
    this.focusNode,
    this.translations,
    this.controller,
    this.label,
    this.hintText,
    this.hint,
    this.validator,
    this.autoFocus = false,
    this.enabled = true,
    this.textInputAction,
    this.onChanged,
    this.onCountryChanged,
    this.onSubmitted,
    this.onSaved,
    this.initialISOCode,
    this.initialCountryCode,
    this.onTap,
    this.flagType = FlagType.icon,
    this.autoDetect = true,
    this.countries,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType = TextInputType.number,
    this.onTapOutside,
    this.clipBehavior = Clip.hardEdge,
    this.borderRadius,
    this.enabledColor,
    this.disabledColor,
    this.focusedColor,
    this.errorColor,
    this.borderWidth,
    this.focusedBorderWidth,
  });

  final FocusNode? focusNode;
  final String? initialISOCode;
  final int? initialCountryCode;
  final TranslationMap? translations;
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final Widget? hint;
  final PhoneValidator? validator;
  final bool autoFocus;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final OnChanged? onChanged;
  final OnChanged? onCountryChanged;
  final VoidCallback? onTap;
  final OnSubmitted? onSubmitted;
  final OnSubmitted? onSaved;
  final bool enabled;
  final FlagType flagType;
  final bool autoDetect;
  final List<String>? countries;
  final AutovalidateMode autovalidateMode;
  final void Function(PointerDownEvent)? onTapOutside;
  final Clip clipBehavior;
  final BorderRadius? borderRadius;
  final Color? enabledColor;
  final Color? disabledColor;
  final Color? focusedColor;
  final Color? errorColor;
  final double? borderWidth;
  final double? focusedBorderWidth;

  @override
  State<CountryPhoneField> createState() => _CountryPhoneFieldState();
}

class _CountryPhoneFieldState extends State<CountryPhoneField> {
  late CountryModel selectedCountry;

  void _getCountry() async {
    if (widget.initialCountryCode != null) {
      selectedCountry =
          kAllCountries.findByCountryCode(widget.initialCountryCode!) ??
              await Utility.getInitialCountry;
    } else if (widget.initialISOCode != null) {
      selectedCountry = kAllCountries.findByISOCode(widget.initialISOCode!) ??
          await Utility.getInitialCountry;
    } else {
      selectedCountry = await Utility.getInitialCountry;
    }
    AppLog(selectedCountry);
  }

  @override
  void initState() {
    super.initState();
    _getCountry();
  }

  InputBorder _getBorder(
    Color color,
    double width,
  ) =>
      OutlineInputBorder(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
        borderSide: BorderSide(
          color: color,
          width: width,
        ),
      );

  @override
  Widget build(BuildContext context) => TextFormField(
        key: widget.key,
        controller: widget.controller,
        focusNode: widget.focusNode,
        autofocus: widget.autoFocus,
        enabled: widget.enabled,
        onChanged: (number) {
          if (widget.onChanged == null) {
            return;
          }

          widget.onChanged!(
            number,
            PhoneNumber(
              number: number,
              countryCode: selectedCountry.countryCode,
              isoCode: selectedCountry.isoCode,
            ),
          );
        },
        onTap: widget.onTap,
        decoration: InputDecoration(
          enabled: widget.enabled,
          border: _getBorder(Colors.grey, 1),
          enabledBorder: _getBorder(
              widget.enabledColor ?? Colors.grey, widget.borderWidth ?? 1),
          focusedBorder: _getBorder(widget.focusedColor ?? Colors.grey,
              widget.focusedBorderWidth ?? 1),
          errorBorder: _getBorder(
              widget.errorColor ?? Colors.red, widget.borderWidth ?? 1),
          focusedErrorBorder: _getBorder(
              widget.errorColor ?? Colors.red, widget.focusedBorderWidth ?? 1),
          disabledBorder: _getBorder(
              widget.disabledColor ?? Colors.grey, widget.borderWidth ?? 1),
        ),
        maxLines: 1,
        minLines: 1,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onSubmitted,
        onTapOutside: widget.onTapOutside ?? (_) => Utility.hideKeyboard(),
        autovalidateMode: widget.autovalidateMode,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        clipBehavior: widget.clipBehavior,
      );
}
