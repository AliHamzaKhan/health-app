import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/services/auth_service.dart';
import '../config/theme/app_colors.dart';

// class MeterWidget extends StatelessWidget {
//   final double value;
//   final double? width;
//   final double? height;
//
//   MeterWidget({required this.value, this.width, this.height});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: AppColors.primary, borderRadius: BorderRadius.circular(120)),
//       child: Container(
//         width: width ?? setHeightValue(120),
//         height: width ?? setHeightValue(120),
//         child: CustomPaint(
//           painter: WholeCircleMeterPainter(value: value),
//           child: const Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class WholeCircleMeterPainter extends CustomPainter {
  final double value;

  WholeCircleMeterPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint outerCirclePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    final Paint innerCirclePaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    final Paint indicatorPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final Paint tickPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Paint smallTickPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final double radius = size.width / 2;

    // Draw outer circle
    // canvas.drawCircle(Offset(radius, radius), radius, outerCirclePaint);

    // Calculate angle based on the value
    final double angle = 2 * pi * (value / 240);

    // Draw the filled portion of the whole circle meter
    // canvas.drawArc(
    //   Rect.fromCircle(center: Offset(radius, radius), radius: radius),
    //   -pi / 2,
    //   2 * pi,
    //   true,
    //   innerCirclePaint,
    // );

    // canvas.drawArc(
    //   Rect.fromCircle(center: Offset(radius, radius), radius: radius),
    //   -pi / 2,
    //   2 * pi,
    //   true,
    //   smallTickPaint,
    // );

    // Draw indicator line from center to value (skip if value is 0)
    if (value != 0) {
      final double indicatorStartX = radius;
      final double indicatorStartY = radius;
      final double indicatorEndX = radius + radius * cos(-pi / 2 + angle);
      final double indicatorEndY = radius + radius * sin(-pi / 2 + angle);
      canvas.drawLine(Offset(indicatorStartX, indicatorStartY),
          Offset(indicatorEndX, indicatorEndY), indicatorPaint);
    }

    // Draw tick marks along the circumference and labels inside the circle
    const double tickLength = 10.0;
    const double labelOffset = 20.0;
    const double smallTickLength = 5.0;
    for (int i = 0; i < 240; i += 20) {
      final double tickAngle = 1.5 * pi * (i / 200);
      final double startX = radius + (radius - tickLength) * cos(tickAngle);
      final double startY = radius + (radius - tickLength) * sin(tickAngle);
      final double endX = radius + (radius + tickLength) * cos(tickAngle);
      final double endY = radius + (radius + tickLength) * sin(tickAngle);
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);

      // Add small separation lines between tick marks
      // if (i != 0 && i != 240) {
      //   // Add 4 small ticks between each major tick mark
      //   for (int j = 1; j <= 4; j++) {
      //     final double smallTickStartX = radius +
      //         (radius - tickLength + (j * (tickLength / 4))) * cos(tickAngle);
      //     final double smallTickStartY = radius +
      //         (radius - tickLength + (j * (tickLength / 4))) * sin(tickAngle);
      //     final double smallTickEndX = radius +
      //         (radius - tickLength + (j * (tickLength / 4)) + smallTickLength) *
      //             cos(tickAngle);
      //     final double smallTickEndY = radius +
      //         (radius - tickLength + (j * (tickLength / 4)) + smallTickLength) *
      //             sin(tickAngle);
      //     canvas.drawLine(Offset(smallTickStartX, smallTickStartY),
      //         Offset(smallTickEndX, smallTickEndY), smallTickPaint);
      //   }
      // }

      // Adjust the label position to avoid overlapping at the last label
      final double labelX = i == 240
          ? radius + 20
          : radius + (radius - labelOffset) * cos(tickAngle);
      final double labelY = i == 240
          ? radius + 10
          : radius + (radius - labelOffset) * sin(tickAngle);

      TextPainter labelPainter = TextPainter(
        text: TextSpan(
          text: i.toString(),
          style: TextStyle(fontSize: 8, color: AppColors.text),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      var a = 2.3;
      labelPainter.paint(
          canvas,
          Offset(labelX - labelPainter.width / a,
              labelY - labelPainter.height / a));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ValueMeter extends StatelessWidget {
  ValueMeter({super.key, required this.child, this.size, this.color, this.borderColor});

  Widget child;
  double? size;
  Color? color;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? ((Get.width / 2) - 50),
      width: size ?? ((Get.width / 2) - 50),
      // padding: EdgeInsets.all(setHeightValue(5)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? ((Get.find<AuthService>().saveData.isDarkTheme() ?? false) ? AppDarkColors.borderColor : AppColors.borderColor),
        border: Border.all(color: borderColor ?? AppColors.text, width: 5),
      ),
      child: Container(
        // width: setHeightValue(120),
        // height: setHeightValue(120),
        // padding: EdgeInsets.all(setHeightValue(3)),
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            // border: Border.all(color: borderColor ?? Colors.red, width: 1)
        ),
        child: Container(
          // width: setHeightValue(120),
          // height: setHeightValue(120),
          // padding: EdgeInsets.all(setHeightValue(3)),
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              // border: Border.all(color: borderColor ?? AppColors.text, width: 3)
          ),
          child: child,
        ),
      ),
    );
  }
}

class HalfCircleBorderPainter extends CustomPainter {
  HalfCircleBorderPainter({this.color = Colors.black87});

  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0; // Set the border width as desired

    final Rect rect = Rect.fromPoints(
      Offset(0, 0),
      Offset(size.width, size.height),
    );

    canvas.drawArc(
      rect,
      pi,
      pi, // pi represents 180 degrees
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
