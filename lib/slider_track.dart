import 'dart:math';

import 'package:flutter/material.dart';

class RetroSliderTrackShape extends SliderTrackShape {
  var sliderPos;
  RetroSliderTrackShape({this.sliderPos});
  @override
  Rect getPreferredRect({
    RenderBox parentBox,
    Offset offset = Offset.zero,
    SliderThemeData sliderTheme,
    bool isEnabled,
    bool isDiscrete,
  }) {
    final double thumbWidth =
        sliderTheme.thumbShape.getPreferredSize(true, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight;
    assert(thumbWidth >= 0);
    assert(trackHeight >= 0);
    assert(parentBox.size.width >= thumbWidth);
    assert(parentBox.size.height >= trackHeight);

    final double trackLeft = offset.dx + thumbWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - thumbWidth;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  Rect getPreferredRect2({
    RenderBox parentBox,
    Offset offset = Offset.zero,
    SliderThemeData sliderTheme,
    bool isEnabled,
    bool isDiscrete,
    double sliderPos,
  }) {
    final double thumbWidth =
        sliderTheme.thumbShape.getPreferredSize(true, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight;
    assert(thumbWidth >= 0);
    assert(trackHeight >= 0);
    assert(parentBox.size.width >= thumbWidth);
    assert(parentBox.size.height >= trackHeight);

    final double trackLeft = offset.dx + thumbWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = sliderPos * 315;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    Animation<double> enableAnimation,
    TextDirection textDirection,
    Offset thumbCenter,
    bool isDiscrete,
    bool isEnabled,
  }) {
    if (sliderTheme.trackHeight == 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final Rect trackRect2 = getPreferredRect2(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
      sliderPos: sliderPos,
    );

    final Paint fillPaint = Paint()
      ..color = Color.fromARGB(255, 32,36,40)
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Color.fromARGB(255,39,43,48)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final pathSegment = Path()
      ..moveTo(trackRect.left, trackRect.top)
      ..lineTo(trackRect.right, trackRect.top)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect.right + 5, trackRect.top),
            Offset(trackRect.right - 5, trackRect.bottom),
          ),
          -pi / 2,
          pi,
          false)
      ..lineTo(trackRect.left, trackRect.bottom)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect.left + 5, trackRect.top),
            Offset(trackRect.left - 5, trackRect.bottom),
          ),
          -pi * 3 / 2,
          pi,
          false);
    final pathSegment3 = Path()
      ..moveTo(trackRect.left, trackRect.top-8)
      ..lineTo(trackRect.right, trackRect.top-8)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect.right + 5, trackRect.top-8),
            Offset(trackRect.right - 5, trackRect.bottom-8),
          ),
          -pi / 2,
          pi,
          false)
      ..lineTo(trackRect.left, trackRect.bottom-8)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect.left + 5, trackRect.top-8),
            Offset(trackRect.left - 5, trackRect.bottom-8),
          ),
          -pi * 3 / 2,
          pi,
          false);

    final pathSegment2 = Path()
      ..moveTo(trackRect2.left, trackRect2.top)
      ..lineTo(trackRect2.right, trackRect2.top)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect2.right + 5, trackRect2.top),
            Offset(trackRect2.right - 5, trackRect2.bottom),
          ),
          -pi / 2,
          pi,
          false)
      ..lineTo(trackRect2.left, trackRect2.bottom)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect2.left + 5, trackRect2.top),
            Offset(trackRect2.left - 5, trackRect2.bottom),
          ),
          -pi * 3 / 2,
          pi,
          false);

    final Gradient gradient = new LinearGradient(
      colors: [
        sliderTheme.activeTrackColor,
        sliderTheme.inactiveTrackColor,
      ],
    );

    final progressPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(trackRect);


    context.canvas.drawShadow(pathSegment, Color.fromARGB(255,111,114,117), 4, false);
    context.canvas.drawPath(pathSegment, fillPaint);
    context.canvas.drawPath(pathSegment2, progressPaint);
    context.canvas.drawShadow(pathSegment3, Color.fromARGB(255,22,25,29), 5, false);
    // context.canvas.drawPath(pathSegment, borderPaint);
    
  }

  @override
  bool shouldRepaint(RetroSliderTrackShape oldDelegate) {
    // * shouldRepaint function
    return true;
  }
}
