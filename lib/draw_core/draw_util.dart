import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// [DrawUtil]  Draw util, the mainly is for flutter to draw easily
class DrawUtil {
  ///[yymRotate] clockwise to rotate, which will automatically change the angle, and rotate center point don't need to
  ///consider, base on this function
  ///[size] from the Size that on your [CustomPainter]
  ///[canvas] from the Canvas that on your [CustomPainter]
  ///[angle] that you want rotate
  static void yymRotate(Size size, Canvas canvas, double angle) {
    // 计算画布中心轨迹圆半径 {calculate the canvas center distance to the up left conner}
    double r = sqrt(pow(size.width, 2) + pow(size.height, 2));
    // 计算画布中心点初始弧度 {calculate the  degree from the horizontal line (top) to the canvas center }
    double startAngle = atan(size.height / size.width);
    // 计算画布初始中心点坐标 {calculate the  axis of the canvas center}
    Point p0 = Point(r * cos(startAngle), r * sin(startAngle));
    // 需要旋转的弧度 calculate the arc that need to rotate
    double xAngle = 2 * pi / (360 / angle);
    // 计算旋转后的画布中心点坐标 get the new canvas center point after rotate
    Point px =
        Point(r * cos(xAngle + startAngle), r * sin(xAngle + startAngle));
    // 先平移画布  x shift the canvas, make the image can be saw
    canvas.translate((p0.x - px.x) / 2, (p0.y - px.y) / 2);
    // 后旋转 start
    canvas.rotate(xAngle);
  }

  static double zoom(double number, double zoom) {
    return number * zoom;
  }

  static double setXPath(
      {String numberStrX, double zoom, double origin, double zoomX = 1}) {
    return DrawUtil.zoom(double.parse(numberStrX), zoom) * zoomX + origin;
  }

  static double setYPath(
      {String numberStrY, double zoom, double origin, double zoomY = 1}) {
    return DrawUtil.zoom(double.parse(numberStrY) * -1, zoom) * zoomY + origin;
  }

  /// 根据 symbol 的数据和里面的数值去画出相对应的符号
  static void setPath(
      {List<String> pathFromSymbol,
      Path path,
      var flipConvertPoint,
      double zoom = 1,
      double originX = 0,
      double originY = 0,
      double zoomX = 1,
      double zoomY = 1}) {
    for (int i = 0; i < pathFromSymbol.length; i++) {
      switch (pathFromSymbol[i]) {
        // m 在数据中是 moveTO
        case 'm':
          path.moveTo(
              DrawUtil.setXPath(
                  numberStrX: pathFromSymbol[i + 1],
                  zoom: zoom,
                  origin: originX,
                  zoomX: zoomX),
              DrawUtil.setYPath(
                  numberStrY: pathFromSymbol[i + 2],
                  zoom: zoom,
                  origin: originY,
                  zoomY: zoomY));
          break;
        case 'l':
          // l 是 lineTO
          path.lineTo(
              DrawUtil.setXPath(
                  numberStrX: pathFromSymbol[i + 1],
                  zoom: zoom,
                  origin: originX,
                  zoomX: zoomX),
              DrawUtil.setYPath(
                  numberStrY: pathFromSymbol[i + 2],
                  zoom: zoom,
                  origin: originY,
                  zoomY: zoomY));
          break;
        case 'b':
          path.cubicTo(
              DrawUtil.setXPath(
                  numberStrX: pathFromSymbol[i + 3],
                  zoom: zoom,
                  origin: originX,
                  zoomX: zoomX),
              DrawUtil.setYPath(
                  numberStrY: pathFromSymbol[i + 4],
                  zoom: zoom,
                  origin: originY,
                  zoomY: zoomY),
              DrawUtil.setXPath(
                  numberStrX: pathFromSymbol[i + 5],
                  zoom: zoom,
                  origin: originX,
                  zoomX: zoomX),
              DrawUtil.setYPath(
                  numberStrY: pathFromSymbol[i + 6],
                  zoom: zoom,
                  origin: originY,
                  zoomY: zoomY),
              DrawUtil.setXPath(
                  numberStrX: pathFromSymbol[i + 1],
                  zoom: zoom,
                  origin: originX,
                  zoomX: zoomX),
              DrawUtil.setYPath(
                  numberStrY: pathFromSymbol[i + 2],
                  zoom: zoom,
                  origin: originY,
                  zoomY: zoomY));
          break;
        case 'q':
          path.quadraticBezierTo(
              DrawUtil.setXPath(
                  numberStrX: pathFromSymbol[i + 3],
                  zoom: zoom,
                  origin: originX,
                  zoomX: zoomX),
              DrawUtil.setYPath(
                  numberStrY: pathFromSymbol[i + 4],
                  zoom: zoom,
                  origin: originY,
              zoomY: zoomY),
              DrawUtil.setXPath(
                  numberStrX: pathFromSymbol[i + 1],
                  zoom: zoom,
                  origin: originX,
                  zoomX: zoomX),
              DrawUtil.setYPath(
                  numberStrY: pathFromSymbol[i + 2],
                  zoom: zoom,
                  origin: originY,
                  zoomY: zoomY));
          break;
        default:
          break;
      }
    }
  }
}
