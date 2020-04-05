import 'package:flutter/material.dart';
// import './slider_track.dart';

class RetroSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const RetroSliderThumbShape({
    this.thumbRadius = 6.0,
  });
  // Rect getPreferredRect({
  //   RenderBox parentBox,
  //   Offset offset = Offset.zero,
  //   SliderThemeData sliderTheme,
  //   bool isEnabled,
  //   bool isDiscrete,
  // }) {
  //   final double thumbWidth =
  //       sliderTheme.thumbShape.getPreferredSize(true, isDiscrete).width;
  //   final double trackHeight = sliderTheme.trackHeight;
  //   assert(thumbWidth >= 0);
  //   assert(trackHeight >= 0);
  //   assert(parentBox.size.width >= thumbWidth);
  //   assert(parentBox.size.height >= trackHeight);

  //   final double trackLeft = offset.dx + thumbWidth / 2;
  //   final double trackTop =
  //       offset.dy + (parentBox.size.height - trackHeight) / 2;
  //   final double trackWidth = parentBox.size.width - thumbWidth;
  //   return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  // }

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    // bool isEnabled,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;
    // RetroSliderTrackShape sometrack = RetroSliderTrackShape();
    // final rect2 = sometrack.getTrackRect;
    // final Rect trackRect = getPreferredRect(
    //   parentBox: parentBox,
    //   offset: center,
    //   sliderTheme: sliderTheme,
    //   isEnabled: isEnabled,
    //   isDiscrete: isDiscrete,
    // );

    final rect = Rect.fromCircle(center: center, radius: thumbRadius);

    final rect2 = Rect.fromLTRB(50, 200, 300, 400);
    final Gradient gradient = new LinearGradient(
      colors: [
        sliderTheme.activeTrackColor,
        sliderTheme.inactiveTrackColor,
      ],
    );
    final fillPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final shadowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 12
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 12);

    final shadowPaint3 = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 1
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 12);
    
    final shadowPaint2 = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5)
      ..shader = gradient.createShader(rect2);


    canvas.drawCircle(Offset(rect.right + 1, rect.bottom), thumbRadius + 1, shadowPaint);//white shadow
    canvas.drawCircle(Offset(rect.left - 1, rect.top), thumbRadius + 1, shadowPaint3);//black shadow
    canvas.drawCircle(center, thumbRadius + 7.8, fillPaint);//original black fill
    canvas.drawCircle(Offset(rect.right-6, rect.bottom-5), thumbRadius-2 , shadowPaint2);//Orange shadow
    canvas.drawCircle(center, thumbRadius + 3, borderPaint);//final black stroke

    // canvas.drawShadow(path, color, elevation, transparentOccluder)

    // canvas.drawRRect(rrect, fillPaint);
    // canvas.drawRRect(rrect, borderPaint);
  }
}
