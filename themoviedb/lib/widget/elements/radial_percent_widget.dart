import 'dart:math';

import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: RadialPrecentWidget(
        percent: 0.72,
        fillColor: Colors.blue,
        lineColor: Colors.red,
        freeColor: Colors.yellow,
        lineWidth: 5,
        child: Text(
          "72%",
          style: TextStyle(color: Colors.white),
        ),
      ),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
      ),
    ));
  }
}

class RadialPrecentWidget extends StatelessWidget {
  final Widget child;

  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPrecentWidget({
    super.key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
            painter: MyPainter(
                percent: percent,
                fillColor: fillColor,
                lineColor: lineColor,
                freeColor: freeColor,
                lineWidth: lineWidth)),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(child: child),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Rect arcRect = calculateArcsRect(size);

    drawBackground(canvas, size);

    drawfreePaint(canvas, arcRect);

    drawfeelPaint(canvas, arcRect);
  }

  void drawfeelPaint(Canvas canvas, Rect arcRect) {
    final feelPaint = Paint();
    feelPaint.color = lineColor;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeCap = StrokeCap.round;
    feelPaint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      feelPaint,
    );
  }

  void drawfreePaint(Canvas canvas, Rect arcRect) {
    final freePaint = Paint();
    freePaint.color = freeColor;
    freePaint.style = PaintingStyle.stroke;
    freePaint.strokeWidth = lineWidth;
    canvas.drawArc(
      arcRect,
      pi * 2 * percent - (pi / 2),
      pi * 2 * (1.0 - percent),
      false,
      freePaint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final backgroundpainter = Paint();
    backgroundpainter.color = fillColor;
    backgroundpainter.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundpainter);
  }

  Rect calculateArcsRect(Size size) {
    final lineMargin = 3;
    final offset = lineWidth / 2 + lineMargin;
    final arcRect = Offset(offset, offset) &
        Size(
          size.width - offset * 2,
          size.height - offset * 2,
        );
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
