import 'package:calculator/dark.dart';
import 'package:calculator/light.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './tombol.dart';
import './dark.dart';
import './light.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  runApp(MaterialApp(
    home: CalcApp(),
    routes: <String, WidgetBuilder>{
      '/dark': (BuildContext context) => new CalcApp(),
      '/light': (BuildContext context) => new CalcAppLight(),
    },
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CalcApp(),
//     );
//   }
// }
