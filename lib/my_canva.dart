import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'draw_core/draw_uitl/draw_util.dart';
import 'package:flutterapp/draw_core/music_font/music_font.dart';

class WQQ extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0
      ..color = Colors.black;

    Path myPath = Path();
    List<String> path =
        DrawUtil.readFromSymbol(fontName: MusicFont.noteHeadSolid);
    DrawUtil.setPath(
      pathFromSymbol: path,
      path: myPath,
      originX: 150,
      originY: 200,
      zoom: 0.1,
    );

//
    canvas.drawPath(myPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
