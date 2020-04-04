import 'package:flutter/material.dart';

class AlbumArt extends StatelessWidget {
  AlbumArt();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(
            color: Color.fromARGB(77, 116, 130, 151),
            offset: const Offset(-10.0, -10.0),
            spreadRadius: 0.0,
            blurRadius: 50.0,
          ),
          const BoxShadow(
            color: Color.fromARGB(114, 0, 0, 0),
            offset: const Offset(10.0, 10.0),
            spreadRadius: 0.0,
            blurRadius: 40.0,
          ),
          const BoxShadow(
            color: Color.fromARGB(64, 0, 0, 0),
            offset: const Offset(-3.0, -3.0),
            spreadRadius: 0.0,
            blurRadius: 15.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(1),
      child: CustomPaint(
        painter: AlbumArtPainterBG(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(51, 20, 20, 20),
                offset: const Offset(-5.0, -2.0),
                spreadRadius: -10.0,
                blurRadius: 5.0,
              ),
              const BoxShadow(
                color: Color.fromARGB(64, 104, 104, 104),
                offset: const Offset(5.0, 2.0),
                spreadRadius: -10.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: CustomPaint(
            painter: AlbumArtPainterFG(),
            child: Container(
              height: 330,
              width: 330,
              padding: EdgeInsets.all(11),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(51, 20, 20, 20),
                backgroundImage: NetworkImage('https://n.sinaimg.cn/sinakd10116/260/w530h530/20200306/04ac-iqmtvwv3179270.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AlbumArtPainterBG extends CustomPainter {
  AlbumArtPainterBG();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();

    paint.color = Color.fromARGB(255, 31, 35, 40);
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(AlbumArtPainterBG oldDelegate) {
    return false;
  }
}

class AlbumArtPainterFG extends CustomPainter {
  AlbumArtPainterFG();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    final paint = Paint();

    paint.color = Color.fromARGB(77, 87, 87, 87);
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width * 0.466, paint);
  }

  @override
  bool shouldRepaint(AlbumArtPainterFG oldDelegate) {
    return false;
  }
}
