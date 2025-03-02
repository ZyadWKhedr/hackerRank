import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData prefixIcon;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      style: TextStyle(color: theme.textTheme.bodyLarge!.color), // Text color
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: theme.textTheme.bodyMedium!.color), // Hint text color
        filled: true,
        fillColor: theme.inputDecorationTheme.fillColor, // Background color
        prefixIcon: Icon(widget.prefixIcon, color: theme.iconTheme.color), // Prefix icon
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: theme.iconTheme.color,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: theme.inputDecorationTheme.border, // Border style
        enabledBorder: theme.inputDecorationTheme.border, // Border when enabled
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.primaryColor, width: 2), // Border color when focused
        ),
      ),
    );
  }
}
