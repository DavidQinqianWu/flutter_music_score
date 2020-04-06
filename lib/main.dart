import 'package:flutter/material.dart';

import 'package:flutterapp/my_canva.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  var myRichRunesMessage = new Runes('2018 \u00a9 Author\'s Name \u{1f60e}');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
//          child: Text('\u{1D11E};'),
          child: LayoutBuilder(
            builder: (_,constraints) => Container(
              width: constraints.widthConstraints().maxWidth,
              height: constraints.widthConstraints().maxHeight,
              color: Colors.yellow,
              child: CustomPaint(painter: WQQ()),
            ),
          ),
        ),
      ),
    );
  }
}





