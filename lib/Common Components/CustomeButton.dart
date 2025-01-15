import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Button text
  final TextStyle? textStyle; // Customizable text style
  final Color? buttonColor; // Button background color
  final VoidCallback? onPressed; // Button action (optional)

  const CustomButton({
    Key? key,
    required this.text,
    this.textStyle,
    this.buttonColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            buttonColor ?? const Color(0xFF2E5C78), // Default color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24, // Horizontal padding
          vertical: 12, // Vertical padding
        ),
      ),
      onPressed: onPressed ?? () {}, // Default: does nothing if null
      child: Text(
        text,
        style: textStyle ??
            const TextStyle(
              color: Colors.white, // Default text color
              fontSize: 16, // Default font size
              fontWeight: FontWeight.w400, // Default font weight
            ),
      ),
    );
  }
}
