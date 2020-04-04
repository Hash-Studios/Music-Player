import 'package:flutter/material.dart';

class PlayPause extends StatelessWidget {
  PlayPause();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: PlayPausePainter());
  }
}

class PlayPausePainter extends CustomPainter {
  PlayPausePainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();
    paint.color = _ColorCatalog.instance.color_2;
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width/2, paint);
  }

  @override
  bool shouldRepaint(PlayPausePainter oldDelegate) {
    return false;
  }
}

class _ColorCatalog {
  _ColorCatalog() {
    this.color_0 = Color.fromARGB(0, 0, 0, 0);
    this.color_1 = Color.fromARGB(114, 0, 0, 0);
    this.color_2 = Color.fromARGB(51, 110, 123, 142);
    this.color_3 = Color.fromARGB(255, 221, 69, 10);
    this.color_4 = Color.fromARGB(255, 229, 95, 33);
    this.color_5 = Color.fromARGB(255, 212, 50, 0);
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
