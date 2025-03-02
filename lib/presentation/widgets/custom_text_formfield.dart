import 'package:flutter/material.dart';
import 'package:hackerrank/core/utils/app_dimentions.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Color textColor;
  final Color borderColor;
  final Color iconColor;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.textColor = Colors.black,
    this.borderColor = Colors.grey,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final dims = AppDimensions(context); // Create an instance

    return Padding(
      padding: EdgeInsets.symmetric(vertical: dims.height(0.015)), // 1.5% of height
      child: SizedBox(
        width: dims.width(0.9), // 90% of width
        height: dims.height(0.07), // 7% of height
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          style: TextStyle(
            fontSize: dims.fontSize(0.045), // 4.5% of width
            color: widget.textColor,
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              fontSize: dims.fontSize(0.04), // 4% of width
              color: widget.textColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(dims.radius(0.03)), // 3% of width
              borderSide: BorderSide(color: widget.borderColor),
            ),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: widget.iconColor,
                    size: dims.iconSize(0.06), // 6% of width
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: widget.iconColor,
                      size: dims.iconSize(0.06), // 6% of width
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
      ),
    );
  }
}
