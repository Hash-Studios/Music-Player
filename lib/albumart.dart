import 'package:flutter/material.dart';

// * Main AlbumArt Stateless Widget
class AlbumArt extends StatelessWidget {
  AlbumArt();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(                          // * Background Shadow top left light
            color: Color.fromARGB(77, 116, 130, 151),
            offset: const Offset(-10.0, -10.0),
            spreadRadius: 0.0,
            blurRadius: 50.0,
          ),
          const BoxShadow(                          // * Background Shadow bottom right
            color: Color.fromARGB(114, 0, 0, 0),
            offset: const Offset(10.0, 10.0),
            spreadRadius: 0.0,
            blurRadius: 40.0,
          ),
          const BoxShadow(                          // * Background Shadow top left dark
            color: Color.fromARGB(64, 0, 0, 0),
            offset: const Offset(-3.0, -3.0),
            spreadRadius: 0.0,
            blurRadius: 15.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(0),                          // * Container and BG padding
      child: CustomPaint(
        painter: AlbumArtPainterBG(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(                          // * Foreground Shadow top left
                color: Color.fromARGB(51, 20, 20, 20),
                offset: const Offset(-5.0, -2.0),
                spreadRadius: -10.0,
                blurRadius: 5.0,
              ),
              const BoxShadow(                          // * Foreground Shadow bottom right
                color: Color.fromARGB(64, 104, 104, 104),
                offset: const Offset(5.0, 2.0),
                spreadRadius: -10.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: CustomPaint(
            painter: AlbumArtPainterFG(),
            child: Container(         // TODO fix height and width of the image to scale
              height: 330,
              width: 330,
              padding: EdgeInsets.all(11), // TODO fix this padding to work with diff screen sizes
              child: CircleAvatar(                          // * Album Art Image
                backgroundColor: Color.fromARGB(51, 20, 20, 20),
                backgroundImage: AssetImage('assets/album_art.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// * AlbumArt BG Custom Painter
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

// * AlbumArt FG Custom Painter
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
