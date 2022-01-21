import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(),
          buildCircle(size),
          buildBottomShape(size),
          buildLightBlueShape(),
        ],
      ),
    );
  }

  Widget buildCircle(Size screenSize) {
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Stack(
      children: [
        Positioned(
          left: screenWidth / 2,
          top: screenHeight / 10,
          child: Container(
            height: screenWidth * 0.75,
            width: screenWidth * 0.75,
            decoration: BoxDecoration(
              gradient: const RadialGradient(colors: [
                Color.fromRGBO(88, 189, 243, 0.5),
                Color.fromRGBO(88, 189, 200, 0.2),
              ], center: Alignment(-0.5, -0.8)),
              borderRadius: BorderRadius.circular(screenWidth * 0.75 / 2),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: screenHeight / 3.3,
          child: Container(
            height: screenWidth / 5,
            width: screenWidth / 5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(88, 189, 243, 0.7),
                  Color.fromRGBO(88, 189, 243, 0.2),
                ],
                center: Alignment(0.5, 0.3),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Color.fromRGBO(88, 189, 243, 0.7),
                    spreadRadius: 20),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: screenHeight / 2.4,
          child: Container(
            height: screenWidth * 0.7,
            width: screenWidth * 0.7,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Color.fromRGBO(88, 210, 243, 0.7),
                  Color.fromRGBO(88, 189, 243, 0.2),
                ],
                center: Alignment(0.5, 0.3),
              ),
            ),
          ),
        ),
        Positioned(
          left: screenWidth / 16,
          top: screenHeight / 6,
          child: Container(
            height: screenWidth / 2.5,
            width: screenWidth / 2.5,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(90, 57, 219, 0.7),
                  Color.fromRGBO(185, 88, 145, 0.8),
                ],
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(screenWidth / 2.5 * 2),
            ),
          ),
        ),
        Positioned(
          left: screenWidth / 5,
          top: screenHeight / 4,
          child: Container(
            height: screenHeight / 5,
            width: screenHeight / 5,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(72, 155, 218, 0.5),
                  Color.fromRGBO(72, 120, 218, 1.0),
                ],
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(screenHeight / 5 * 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBackground() {
    return Container(
      color: const Color.fromRGBO(113, 109, 229, 1.0),
    );
  }

  Widget buildBottomShape(Size screenSize) {
    return Container(
      alignment: Alignment.center,
      child: ClipPath(
        clipper: BottomShapeClipPathClass(),
        child: SizedBox(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 0.2],
                colors: [
                  Color.fromRGBO(105, 150, 222, 1.0),
                  Color.fromRGBO(90, 57, 219, 1.0)
                ],
              ),
            ),
            // color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget buildLightBlueShape() {
    return ClipPath(
      clipper: LightBlueCircleClipPathClass(),
      child: SizedBox(
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 0.3,
              center: Alignment.centerRight,
              colors: [
                Color.fromRGBO(82, 189, 244, 1.0),
                Color.fromRGBO(132, 88, 194, 1.0),
              ],
            ),
          ),
          // color: Colors.green,
        ),
      ),
    );
  }
}

class LightBlueCircleClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final radius = size.width * 0.2;
    final dx = size.width - radius + radius * 0.2;
    final dy = size.height * 0.5;
    final centerPoint = Offset(dx, dy);

    var path = Path();
    path.addOval(Rect.fromCircle(center: centerPoint, radius: radius));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomShapeClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width * 0.5, size.height - 90);
    var endPoint = Offset(0.0, size.height * 0.7);

    var path = Path();
    path.moveTo(0.0, size.height * 0.7);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.8);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
