import 'dart:math';

import 'package:flutter/material.dart';

class RetroSliderTrackShape extends SliderTrackShape {
  var trackR;
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
    trackR = trackRect;
    final Rect trackRect2 = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Paint fillPaint = Paint()
      ..color = sliderTheme.activeTrackColor
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
    final Gradient gradient = new LinearGradient(
      colors: [
        sliderTheme.activeTrackColor,
        sliderTheme.inactiveTrackColor,
      ],
    );

    final progressPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(trackRect2);

    context.canvas.drawPath(pathSegment, progressPaint);
    context.canvas.drawPath(pathSegment, borderPaint);
    context.canvas.drawShadow(pathSegment, Colors.black, 4, false);
  }

  Rect get getTrackRect {
    return trackR;
  }
}
