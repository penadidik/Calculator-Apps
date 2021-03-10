
import 'package:calculator_apps/util/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CalculatorModel.dart';

class Display extends StatelessWidget {
  Display({Key key, this.value, this.height}): super(key: key);

  final String value;
  final double height;

  String get _output => value.toString();
  double get _margin => (height / 10);

  final LinearGradient _gradient = const LinearGradient(colors: [ Color(0xff88CDD7), Color(0xff88CDD7)]);

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.headline3
        .copyWith(color: ColorsState.labelColor, fontWeight: FontWeight.bold);
    return Container(
        padding: EdgeInsets.only(top: 0, bottom: _margin),
        constraints: BoxConstraints.expand(height: height),
        child: Container(
            padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
            constraints: BoxConstraints.expand(height: height - (_margin)),
            decoration: BoxDecoration(gradient: _gradient),
            child: Text(_output, style: style, textAlign: TextAlign.right, )
        )
    );
  }
}

class CalculatorKey extends StatelessWidget {

  CalculatorKey({ this.symbol });

  final KeySymbol symbol;

  Color get color {

    switch (symbol.type) {

      case KeyType.FUNCTION:
        return Color.fromARGB(255, 96, 96, 96);

      case KeyType.OPERATOR:
        return Color(0xff4E4F73);

      case KeyType.INTEGER:
      default:
        return Color.fromARGB(255, 128, 128, 128);
    }
  }

  static dynamic _fire(CalculatorKey key) => KeyController.fire(KeyEvent(key));

  @override
  Widget build(BuildContext context) {

    double size = MediaQuery.of(context).size.width / 4;
    TextStyle style = Theme.of(context).textTheme.headline4.copyWith(color: Color(0xffF1BC19));

    return Container(

        width: (symbol == Keys.zero) ? (size * 2) : size,
        padding: EdgeInsets.all(2),
        height: size,
        child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          color: color,
          elevation: 4,
          child: Text(symbol.value, style: style),
          onPressed: () => _fire(this),
        )
    );
  }
}

class KeyPad extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(

        children: [
          Row(
              children: <Widget>[
                CalculatorKey(symbol: Keys.clear),
                CalculatorKey(symbol: Keys.sign),
                CalculatorKey(symbol: Keys.percent),
                CalculatorKey(symbol: Keys.divide),
              ]
          ),
          Row(
              children: <Widget>[
                CalculatorKey(symbol: Keys.seven),
                CalculatorKey(symbol: Keys.eight),
                CalculatorKey(symbol: Keys.nine),
                CalculatorKey(symbol: Keys.multiply),
              ]
          ),
          Row(
              children: <Widget>[
                CalculatorKey(symbol: Keys.four),
                CalculatorKey(symbol: Keys.five),
                CalculatorKey(symbol: Keys.six),
                CalculatorKey(symbol: Keys.subtract),
              ]
          ),
          Row(
              children: <Widget>[
                CalculatorKey(symbol: Keys.one),
                CalculatorKey(symbol: Keys.two),
                CalculatorKey(symbol: Keys.three),
                CalculatorKey(symbol: Keys.add),
              ]
          ),
          Row(
              children: <Widget>[
                CalculatorKey(symbol: Keys.zero),
                CalculatorKey(symbol: Keys.decimal),
                CalculatorKey(symbol: Keys.equals),
              ]
          )
        ]
    );
  }
}