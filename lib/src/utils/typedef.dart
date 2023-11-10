import 'package:country_phone_field/src/models/models.dart';
import 'package:flutter/material.dart';

typedef TranslationMap = Map<Locale, CountryTranslation>;

typedef PhoneValidator = FormFieldValidator<String>?;

typedef OnChanged = void Function(String, PhoneNumber);

typedef OnSubmitted = void Function(String?);
