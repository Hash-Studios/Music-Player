import 'package:flutter/material.dart';

class PlayPause extends StatelessWidget {
  PlayPause();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(71, 111, 124, 142),
            offset: const Offset(-10.0, -10.0),
            spreadRadius: 0.0,
            blurRadius: 30.0,
          ),
          const BoxShadow(
            color: Color.fromARGB(114, 0, 0, 0),
            offset: const Offset(10.0, 10.0),
            spreadRadius: 0.0,
            blurRadius: 30.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(1),
      child: CustomPaint(
        painter: PlayPausePainterBG(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(255, 229, 95, 33),
                offset: const Offset(-3.0, -3.0),
                spreadRadius: -3.0,
                blurRadius: 2.0,
              ),
              const BoxShadow(
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
                  const BoxShadow(
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

class PlayPausePainterBG extends CustomPainter {
  PlayPausePainterBG();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();

    paint.color = _ColorCatalog.instance.color_3;
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(PlayPausePainterBG oldDelegate) {
    return false;
  }
}

class PlayPausePainterFG extends CustomPainter {
  PlayPausePainterFG();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();

    paint.color = Color.fromARGB(255, 215, 70, 21);
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width * 0.468, paint);
  }

  @override
  bool shouldRepaint(PlayPausePainterFG oldDelegate) {
    return false;
  }
}

class PlayPausePainterSL extends CustomPainter {
  PlayPausePainterSL();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();
    paint.color = _ColorCatalog.instance.color_2;
    var center = Offset(size.width * 0.4375, size.height * 0.4375);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(PlayPausePainterSL oldDelegate) {
    return false;
  }
}

class PlayPausePainterSD extends CustomPainter {
  PlayPausePainterSD();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();
    paint.color = _ColorCatalog.instance.color_1;
    var center = Offset(size.width * 0.5625, size.height * 0.5625);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(PlayPausePainterSD oldDelegate) {
    return false;
  }
}

class _ColorCatalog {
  _ColorCatalog() {
    this.color_0 = Color.fromARGB(0, 0, 0, 0);
    this.color_1 = Color.fromARGB(114, 0, 0, 0);
    this.color_2 = Color.fromARGB(51, 111, 124, 142);
    this.color_3 = Color.fromARGB(255, 221, 70, 10);
    this.color_4 = Color.fromARGB(255, 229, 95, 33);
    this.color_5 = Color.fromARGB(234, 183, 47, 5);
    this.color_6 = Color.fromARGB(255, 255, 89, 24);
  }

  Color color_0;
  Color color_1;
  Color color_2;
  Color color_3;
  Color color_4;
  Color color_5;
  Color color_6;

  static final _ColorCatalog instance = _ColorCatalog();
}
