import 'package:flutter/material.dart';

// * Main SecButton Stateless Widget
class SecButton extends StatelessWidget {
  SecButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(                          // * Background Shadow top left
            color: Color.fromARGB(71, 111, 124, 142),
            offset: const Offset(-10.0, -10.0),
            spreadRadius: 0.0,
            blurRadius: 30.0,
          ),
          const BoxShadow(                         // * Background Shadow bottom right
            color: Color.fromARGB(114, 0, 0, 0),
            offset: const Offset(10.0, 10.0),
            spreadRadius: 0.0,
            blurRadius: 30.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(1),                          // * Container and BG padding
      child: CustomPaint(
        painter: SecButtonPainterBG(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(                          // * Foreground Shadow top left
                color: Color.fromARGB(255, 35, 35, 35),
                offset: const Offset(-3.0, -3.0),
                spreadRadius: -3.0,
                blurRadius: 2.0,
              ),
              const BoxShadow(                          // * Foreground Shadow bottom right
                color: Color.fromARGB(66, 11, 11, 11),
                offset: const Offset(3.0, 3.0),
                spreadRadius: -3.0,
                blurRadius: 2.0,
              ),
            ],
          ),
          child: CustomPaint(
            painter: SecButtonPainterFG(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: [
                  const BoxShadow(                          // * Inner Drop Shadow
                    color: Color.fromARGB(255, 35, 35, 35),
                    offset: const Offset(7.0, 7.0),
                    spreadRadius: -13.0,
                    blurRadius: 13.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// * SecButton BG Custom Painter
class SecButtonPainterBG extends CustomPainter {
  SecButtonPainterBG();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();

    paint.color = Color.fromARGB(255, 31, 35, 39);
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(SecButtonPainterBG oldDelegate) {
    return false;
  }
}

// * SecButton FG Custom Painter
class SecButtonPainterFG extends CustomPainter {
  SecButtonPainterFG();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();

    paint.color = Color.fromARGB(77, 87, 87, 87);
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width * 0.466, paint);
  }

  @override
  bool shouldRepaint(SecButtonPainterFG oldDelegate) {
    return false;
  }
}