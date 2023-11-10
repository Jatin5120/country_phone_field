import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.controller,
    required this.label,
    this.hint,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String label;
  final String? hint;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) => TextFormField();
}
