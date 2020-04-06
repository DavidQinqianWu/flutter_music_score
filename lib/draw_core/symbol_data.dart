class SymbolData {
  var _xMax;
  var _xMin;
  var _convertPoint;
  List<String> _path;
  SymbolData.fromSymbol(Map fontName) {
    // 绘画数据的最大 x
    _xMax = fontName['x_max'];
    // 绘画数据的最小 x
    _xMin = fontName['x_min'];
    // 绘画数据的翻转值
    _convertPoint = fontName['ha'];
    // 绘画数据的 path
    _path = (fontName['o'] as String)?.split(' ');
  }
  get path {
    return _path;
  }

  get xMin {
    return _xMin;
  }

  get xMax {
    return _xMax;
  }

  get convertPoint {
    return _convertPoint;
  }
}
