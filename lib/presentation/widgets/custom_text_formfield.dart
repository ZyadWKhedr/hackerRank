import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final double fontSize;
  final Color textColor;
  final Color borderColor;
  final Color iconColor;
  final double iconSize;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.fontSize = 16.0,
    this.textColor = Colors.black,
    this.borderColor = Colors.grey,
    this.iconColor = Colors.black,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        style: TextStyle(fontSize: widget.fontSize, color: widget.textColor),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(fontSize: widget.fontSize, color: widget.textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: widget.iconColor, size: widget.iconSize)
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: widget.iconColor,
                    size: widget.iconSize,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
