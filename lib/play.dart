import 'package:flutter/material.dart';

// * Main PlayPause Stateless Widget
class PlayPause extends StatelessWidget {
  PlayPause();

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
          const BoxShadow(                          // * Background Shadow bottom right
            color: Color.fromARGB(114, 0, 0, 0),
            offset: const Offset(10.0, 10.0),
            spreadRadius: 0.0,
            blurRadius: 30.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(1),                          // * Container and BG padding
      child: CustomPaint(
        painter: PlayPausePainterBG(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(                          // * Foreground Shadow top left
                color: Color.fromARGB(255, 229, 95, 33),
                offset: const Offset(-3.0, -3.0),
                spreadRadius: -3.0,
                blurRadius: 2.0,
              ),
              const BoxShadow(                          // * Foreground Shadow bottom right
                color: Color.fromARGB(250, 212, 51, 0),
                offset: const Offset(3.0, 3.0),
                spreadRadius: -3.0,
                blurRadius: 2.0,
              ),
            ],
          ),
          child: CustomPaint(
            painter: PlayPausePainterFG(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: [
                  const BoxShadow(                          // * Inner Drop Shadow
                    color: Color.fromARGB(255, 255, 89, 24),
                    offset: const Offset(5.0, 5.0),
                    spreadRadius: -20.0,
                    blurRadius: 20.0,
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

// * PlayPause BG Custom Painter
class PlayPausePainterBG extends CustomPainter {
  PlayPausePainterBG();

  @override
  void paint(Canvas canvas, Size size) {                        // * paint function
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();

    paint.color = Color.fromARGB(255, 221, 70, 10);
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(PlayPausePainterBG oldDelegate) {                        // * shouldRepaint function
    return false;
  }
}

// * PlayPause FG Custom Painter
class PlayPausePainterFG extends CustomPainter {
  PlayPausePainterFG();

  @override
  void paint(Canvas canvas, Size size) {                        // * paint function
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();

    paint.color = Color.fromARGB(255, 215, 70, 21);
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width * 0.468, paint);
  }

  @override
  bool shouldRepaint(PlayPausePainterFG oldDelegate) {                        // * shouldRepaint function
    return false;
  }
}