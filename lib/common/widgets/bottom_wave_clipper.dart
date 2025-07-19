import 'package:flutter/cupertino.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height); // start from bottom-left side / offset

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(
      firstCurve.dx,
      firstCurve.dy, // Control point
      lastCurve.dx,
      lastCurve.dy, // End point
    );

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);


    path.quadraticBezierTo(
      secondFirstCurve.dx,
      secondFirstCurve.dy, // Control point
      secondLastCurve.dx,
      secondLastCurve.dy, // End point
    );

    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);


    path.quadraticBezierTo(
      thirdFirstCurve.dx,
      thirdFirstCurve.dy, // Control point
      thirdLastCurve.dx,
      thirdLastCurve.dy, // End point
    );


    path.lineTo(size.width, 0); // Top-right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
