import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hackerrank/core/utils/app_dimentions.dart';

class TopShape extends CustomClipper<Path> {
  final AnimationController _controller;

  TopShape._(this._controller);

  static Widget draw(Color color, String text, AnimationController controller) {
    return ClipPath(
      clipper: TopShape._(controller),
      child: ColoredBox(
        color: color,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12,
            ),
            child: Text(text,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Path getClip(Size size) {
    final path = Path();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
