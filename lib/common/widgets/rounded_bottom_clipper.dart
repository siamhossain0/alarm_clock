import 'package:flutter/material.dart';

class RoundedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final cornerRadius = 50.0;

    // Start from top-left
    path.moveTo(0, 0);

    // Line to bottom-left with corner radius
    path.lineTo(0, size.height - cornerRadius);

    // Bottom-left corner
    path.quadraticBezierTo(0, size.height, cornerRadius, size.height);

    // Bottom edge
    path.lineTo(size.width - cornerRadius, size.height);

    // Bottom-right corner
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - cornerRadius);

    // Line to top-right
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}