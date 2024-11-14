import 'package:flutter/material.dart';

class SelectionLinePainter extends CustomPainter {
  final Offset? startPoint;
  final Offset? endPoint;
  final double cellSize;
  final Color color;
  final bool showLine;
  final List<Offset> permanentLinesStartEnd;

  SelectionLinePainter(
    this.startPoint,
    this.endPoint,
    this.cellSize,
    this.color,
    this.showLine,
    this.permanentLinesStartEnd,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    if (showLine && startPoint != null && endPoint != null) {
      canvas.drawLine(
          Offset(startPoint!.dx * cellSize + cellSize / 2,
              startPoint!.dy * cellSize + cellSize / 2),
          Offset(endPoint!.dx * cellSize + cellSize / 2,
              endPoint!.dy * cellSize + cellSize / 2),
          paint);
    }

    for (int i = 0; i < permanentLinesStartEnd.length; i += 2) {
      final start = permanentLinesStartEnd[i];
      final end = permanentLinesStartEnd[i + 1];
      canvas.drawLine(
        Offset(start.dx * cellSize + cellSize / 2,
            start.dy * cellSize + cellSize / 2),
        Offset(
            end.dx * cellSize + cellSize / 2, end.dy * cellSize + cellSize / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
