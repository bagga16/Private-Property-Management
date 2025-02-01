import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? backgroundColor;
  final Color? focusBorderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final bool readOnly;
  final double? height;
  final Widget? prefixIcon; // Prefix icon for the text field
  final int? maxLines; // New parameter for max lines

  const CustomTextField({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.controller,
    this.keyboardType,
    this.backgroundColor,
    this.focusBorderColor,
    this.borderRadius = 10.0,
    this.contentPadding,
    this.hintStyle,
    this.readOnly = false,
    this.height,
    this.prefixIcon,
    this.maxLines, // Accept max lines as an optional parameter
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ??
          (maxLines == null ? 70.0 : null), // Handle height dynamically
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color.fromRGBO(245, 244, 248, 1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Focus(
        onFocusChange: (hasFocus) {},
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          readOnly: readOnly,
          maxLines: maxLines ??
              1, // Use the maxLines parameter or default to single-line
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: focusBorderColor ?? const Color.fromRGBO(37, 43, 92, 1),
                width: 2.0,
              ),
            ),
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(37, 43, 92, 1),
                ),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            prefixIcon: prefixIcon,
          ),
        ),
      ),
    );
  }
}
