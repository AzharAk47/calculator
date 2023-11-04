import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());


class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';
  String _displayText = '';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operator = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayText = '';
        _output = '';
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _displayText = '';
        _output = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operator == '+') {
          _output = (_num1 + _num2).toString();
        } else if (_operator == '-') {
          _output = (_num1 - _num2).toString();
        } else if (_operator == '*') {
          _output = (_num1 * _num2).toString();
        } else if (_operator == '/') {
          _output = (_num1 / _num2).toString();
        }
        _operator = '';
        _num1 = 0.0;
        _num2 = 0.0;
      } else {
        _output += buttonText;
      }
    });
  }

  Widget _buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0),
        ),
        style: ElevatedButton.styleFrom(primary: buttonColor, onPrimary: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              _displayText,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            children: <Widget>[
              Expanded(child: _buildButton('7', 1, Colors.grey)),
              Expanded(child: _buildButton('8', 1, Colors.grey)),
              Expanded(child: _buildButton('9', 1, Colors.grey)),
              Expanded(child: _buildButton('/', 1, Colors.orange)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _buildButton('4', 1, Colors.grey)),
              Expanded(child: _buildButton('5', 1, Colors.grey)),
              Expanded(child: _buildButton('6', 1, Colors.grey)),
              Expanded(child: _buildButton('*', 1, Colors.orange)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _buildButton('1', 1, Colors.grey)),
              Expanded(child: _buildButton('2', 1, Colors.grey)),
              Expanded(child: _buildButton('3', 1, Colors.grey)),
              Expanded(child: _buildButton('-', 1, Colors.orange)),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: _buildButton('0', 1, Colors.grey)),
              Expanded(child: _buildButton('C', 1, Colors.red)),
              Expanded(child: _buildButton('=', 1, Colors.orange)),
              Expanded(child: _buildButton('+', 1, Colors.orange)),
            ],
          ),
        ],
      ),
    );
  }
}
