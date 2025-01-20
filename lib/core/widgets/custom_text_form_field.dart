import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String? hint;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.hint,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText ? _isObscure : false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      maxLines: 1,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        prefixIcon: widget.icon,
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.purpleColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.purpleColor, width: 2),
        ),
      ),
    );
  }
}
