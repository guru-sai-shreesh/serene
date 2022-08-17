import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const RadialProgress(
      {key, required this.height, required this.width, required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: _RadialPainter(
          progress: progress,
        ),
        child: Container(
          height: 20,
          width: 170,
          child:
              Container(margin: EdgeInsets.only(right: 70), child: Text(" ")),
        ));
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(20 / 2, 20 / 2);
    double relativeProgress = 360 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 150 / 2),
      math.radians(-90),
      math.radians(-relativeProgress),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
