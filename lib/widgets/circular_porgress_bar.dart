import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:smart_home/res/color.dart';
import 'package:smart_home/res/style.dart';

// ignore: must_be_immutable
class CircularProgressbarWithAnimation extends StatelessWidget {
  final double from;
  final double to;
  final String temperature;
  final String tempUnit;
  final double strokeWidth;
  final double innerStrokeWidth;
  final Color strokeColor;
  final Color innerStrokeColor;
  final String tempSymbol;
  final String leftTimeUnit;
  final Duration? duration;
  final List<ColorRule>? colorConditions;
  final TextStyle? textStyle;

  CircularProgressbarWithAnimation(
      {super.key,
      this.from = 100,
      this.to = 0,
      this.strokeWidth = 5,
      this.innerStrokeWidth = 10,
      this.strokeColor = const Color.fromARGB(12, 51, 157, 250),
      this.innerStrokeColor = Colors.lightBlue,
      this.tempSymbol = "°C",
      this.duration,
      this.colorConditions,
      this.textStyle,
      this.temperature = '20',
      this.tempUnit = 'Celcius',
      this.leftTimeUnit = 'Minutes Left'});

  double _from = 0;
  double _to = 0;

  @override
  Widget build(BuildContext context) {
    _from = from / 100;
    _to = to / 100;

    return LayoutBuilder(
      builder: (context, conntraint) {
        return SizedBox(
          width: conntraint.maxWidth,
          height: conntraint.maxHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: CirclePainter((conntraint.maxWidth / 2) - 10,
                    strokeWidth + 12, strokeColor),
              ),
              Container(
                width: conntraint.maxWidth / 1.3,
                height: conntraint.maxWidth / 1.3,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: WithColor.shadowCircleColor,
                          spreadRadius: 3,
                          blurRadius: 25,
                          offset: Offset(0, 15))
                    ],
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(conntraint.maxWidth / 2.0)),
              ),
              TweenAnimationBuilder(
                tween: Tween(begin: _from, end: _to),
                duration: duration ?? const Duration(seconds: 1),
                curve: Curves.linear,
                builder: (context, value, child) {
                  Color color = _getConditionalColor(value) ?? innerStrokeColor;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        painter: ArcPainter(
                            color: color,
                            radius: (conntraint.maxWidth) - 20,
                            strokeWidth: innerStrokeWidth,
                            from: _from,
                            to: value),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$temperature $tempSymbol',
                            style: Styles.boldTemp,
                          ),
                          Text(
                            tempUnit,
                            style: Styles.boldTempUnit,
                          ),
                          Text(
                            '${(value * 100).toInt()} $leftTimeUnit',
                            style: Styles.normalLeftTime,
                          )
                        ],
                      )
                    ],
                  );
                },
              )
            ],
          ),
        );
      },
    );
  } // end build

  Color? _getConditionalColor(double index) {
    index = index >= 0.99 ? 100 : index * 100;
    List<ColorRule> colorRule = colorConditions!
        .where((element) =>
            (index >= element.rangeIndex[0] && index <= element.rangeIndex[1]))
        .toList();
    if (colorRule.isNotEmpty) {
      return colorRule.first.color;
    } else {
      return null;
    }
  }
}

class CirclePainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Color color;

  CirclePainter(this.radius, this.strokeWidth, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Paint paintLine = Paint()
      ..color = Colors.lightBlue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(const Offset(0, 0), radius, paint);
    final center = Offset(size.width / 2, size.height / 2);

    double radiusLine = radius + 25.0;
    const divisions = 40;
    const divisionAngle = 2 * math.pi / divisions;

    // رسم خطوط درجه‌بندی
    for (var i = 0; i < divisions; i++) {
      final startX = center.dx + radiusLine * math.cos(i * divisionAngle);
      final startY = center.dy + radiusLine * math.sin(i * divisionAngle);
      final endX = center.dx + (radiusLine - 10) * math.cos(i * divisionAngle);
      final endY = center.dy + (radiusLine - 10) * math.sin(i * divisionAngle);
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paintLine);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ArcPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Color color;
  final double from;
  final double to;

  ArcPainter({
    required this.radius,
    required this.strokeWidth,
    required this.color,
    required this.from,
    required this.to,
  });

  double degToRad(double deg) => deg * (math.pi / 180);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Paint paintPoint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // رسم کمان
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        width: radius,
        height: radius,
      ),
      degToRad(from * 360 - 90),
      degToRad(to * 360),
      false,
      paint,
    );
    // رسم دایره ابتدایی (سیاه)
    const startCircleRadius = 5.0;
    final startAngle = degToRad(from * 360 - 90);
    final startCircleCenter = Offset(
      center.dx + radius * math.cos(startAngle) / 2,
      center.dy + radius * math.sin(startAngle) / 2,
    );
    canvas.drawCircle(startCircleCenter, startCircleRadius, paintPoint);
    // رسم دایره انتهایی (سیاه)
    const endCircleRadius = 5.0;
    final endAngle = degToRad(to * 360 - 90);
    final endCircleCenter = Offset(
      center.dx + radius * math.cos(endAngle) / 2,
      center.dy + radius * math.sin(endAngle) / 2,
    );
    canvas.drawCircle(endCircleCenter, endCircleRadius, paintPoint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ColorRule {
  final Color color;
  final List<double> rangeIndex;
  ColorRule({required this.color, required this.rangeIndex});
}
