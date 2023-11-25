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
    this.continents,
    this.searchText,
    this.countrySearchController,
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
  final List<Continent>? continents;
  final String? searchText;
  final TextEditingController? countrySearchController;

  @override
  State<CountryPhoneField> createState() => _CountryPhoneFieldState();
}

class _CountryPhoneFieldState extends State<CountryPhoneField> {
  late CountryModel selectedCountry;
  late TextEditingController _countrySearchController;
  late TextEditingController _phoneController;

  void _getCountry() async {
    _countrySearchController =
        widget.countrySearchController ?? TextEditingController();
    _phoneController = widget.controller ?? TextEditingController();
    if (widget.initialCountryCode != null) {
      selectedCountry = kAllCountries
              .allowedCountries(widget.continents)
              .findByCountryCode(widget.initialCountryCode!) ??
          await Utility.getInitialCountry(widget.continents);
    } else if (widget.initialISOCode != null) {
      selectedCountry = kAllCountries
              .allowedCountries(widget.continents)
              .findByISOCode(widget.initialISOCode!) ??
          await Utility.getInitialCountry(widget.continents);
    } else {
      selectedCountry = await Utility.getInitialCountry(widget.continents);
    }
    AppLog(selectedCountry);
  }

  @override
  void initState() {
    super.initState();
    _getCountry();
  }

  List<CountryModel> get filteredCountries {
    final countryData = kAllCountries.allowedCountries(widget.continents);
    final query = _countrySearchController.text.trim().replaceAll('+', '');
    if (query.isEmpty) return countryData;

    /// TODO: Need to do Translations for Key
    return countryData
        .where((e) =>
            [e.name, e.countryCode.toString(), e.isoCode].contains(query))
        .toList();
  }

  Future<void> _changeCountry() async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  labelText: widget.searchText ?? 'Search',
                ),
                controller: _countrySearchController,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredCountries.length,
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          filteredCountries[index].name,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        trailing: Text(
                          '+${filteredCountries[index].countryCode}',
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          selectedCountry = filteredCountries[index];

                          if (widget.onCountryChanged != null) {
                            widget.onCountryChanged!(
                              '',
                              PhoneNumber(
                                countryCode: selectedCountry.countryCode,
                                isoCode: selectedCountry.isoCode,
                                number: _phoneController.text,
                              ),
                            );
                          }

                          Navigator.of(context).pop();
                        },
                      ),
                      const Divider(thickness: 1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    setState(() {});
  }

  InputBorder _getBorder(Color color, double width) => OutlineInputBorder(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: width),
      );

  Widget _buildFlagsButton() => InkWell(
    // borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius?,
    onTap: _changeCountry,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image.asset(
          //   'assets/flags/${selectedCountry['code']!.toLowerCase()}.png',
          //   package: 'intl_phone_field',
          //   width: 32,
          // ),
          const SizedBox(width: 8),
          FittedBox(
            child: Text(
              '+${selectedCountry.countryCode}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                // color: widget.countryCodeTextColor,
              ),
            ),
          ),
          // if (widget.showDropdownIcon) ...[
          const Icon(Icons.arrow_drop_down, color: Colors.black),
          const SizedBox(width: 8),
          // ],
          // SizedBox(width: 8),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => TextFormField(
        key: widget.key,
        controller: _phoneController,
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
          prefixIcon: _buildFlagsButton(),
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
