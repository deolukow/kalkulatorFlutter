import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './tombol.dart';

class CalcAppLight extends StatefulWidget {
  const CalcAppLight({Key key}) : super(key: key);

  @override
  CalcAppLightState createState() => CalcAppLightState();
}

class CalcAppLightState extends State<CalcAppLight> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void kali(String text) {
    setState(() => _expression += "*");
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF5E35B1),
        appBar: AppBar(
          leading: Icon(
            Icons.calculate,
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            "Kalkulator",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.brightness_medium, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/dark');
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF5E35B1), Color(0xFF5E35B1)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight),
              // image: DecorationImage(
              //     image: AssetImage("assets/pattern.png"),
              //     fit: BoxFit.none,
              //     repeat: ImageRepeat.repeat)
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/wal9.jpg"), fit: BoxFit.cover),
          ),
          padding: EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF5E35B1),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 68,
                        color: Color(0xFF1C1279),
                      ),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    // fillColor: 0xFF5E35B1,
                    fillColor: 0x005E35B1,
                    textSize: 45,
                    callback: allClear,
                    textColor: 0xFF1C1279,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: 0x005E35B1,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: 0xFF311B92,
                    textColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: 0xFF311B92,
                    textColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '7',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '8',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '9',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: 'x',
                    fillColor: 0xFF311B92,
                    textColor: 0xFFFFFFFF,
                    textSize: 24,
                    callback: kali,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '4',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '5',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '6',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFF311B92,
                    textColor: 0xFFFFFFFF,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '1',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '3',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: 0xFF311B92,
                    textColor: 0xFFFFFFFF,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '0',
                    callback: numClick,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '00',
                    callback: numClick,
                    textSize: 26,
                    fillColor: 0x005E35B1,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: 0xFF311B92,
                    textColor: 0xFFFFFFFF,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
