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
    final double trackWidth = sliderPos * 320;
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
      ..color = Colors.blueGrey
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final pathSegment = Path()
      ..moveTo(trackRect.left, trackRect.top)
      ..lineTo(trackRect.right, trackRect.top)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect.right + 7, trackRect.top),
            Offset(trackRect.right - 7, trackRect.bottom),
          ),
          -pi / 2,
          pi,
          false)
      ..lineTo(trackRect.left, trackRect.bottom)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect.left + 7, trackRect.top),
            Offset(trackRect.left - 7, trackRect.bottom),
          ),
          -pi * 3 / 2,
          pi,
          false);

    final pathSegment2 = Path()
      ..moveTo(trackRect2.left, trackRect2.top)
      ..lineTo(trackRect2.right, trackRect2.top)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect2.right + 7, trackRect2.top),
            Offset(trackRect2.right - 7, trackRect2.bottom),
          ),
          -pi / 2,
          pi,
          false)
      ..lineTo(trackRect2.left, trackRect2.bottom)
      ..arcTo(
          Rect.fromPoints(
            Offset(trackRect2.left + 7, trackRect2.top),
            Offset(trackRect2.left - 7, trackRect2.bottom),
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


    context.canvas.drawPath(pathSegment, fillPaint);
    context.canvas.drawPath(pathSegment2, progressPaint);
    context.canvas.drawPath(pathSegment, borderPaint);
    context.canvas.drawShadow(pathSegment, Colors.black, 4, false);
  }

  @override
  bool shouldRepaint(RetroSliderTrackShape oldDelegate) {
    // * shouldRepaint function
    return true;
  }
}
