import 'package:flutter/material.dart';

class Result extends ChangeNotifier {
  String res = "0"; // curr display
  String _currentInput = ""; // stores the curr inpt for num
  String _operator = ""; // stores the curr opperations
  double? _firstOperand; // first operand for operations
  bool pointActive = false; // Tracks if decimal point is used
  List _data = []; // history result
  bool _isHistoryPageOpen = false;

  List? getData() => _data;
  void clearData() {
    _data = [];
    notifyListeners();
  }

  void openHistoryPage() {
    _isHistoryPageOpen = true;
    notifyListeners();
  }

  void closeHistoryPage() {
    _isHistoryPageOpen = false;
    notifyListeners();
  }

  bool getIsHistoryPageOpen() {
    return _isHistoryPageOpen;
  }

  void calculate(String buttonText) {
    if (buttonText == "AC") {
      // Reset all
      res = "0";
      _currentInput = "";
      _operator = "";
      _firstOperand = null;
      pointActive = false;
    } else if (RegExp(r'^[0-9]$').hasMatch(buttonText)) {
      // Number button
      if (res == "0") res = ""; // Remove the initial "0"
      _currentInput += buttonText;
      res = _currentInput;
    } else if (["+", "-", "x", "÷"].contains(buttonText)) {
      // Operator button
      if (_currentInput.isNotEmpty) {
        _firstOperand = double.tryParse(_currentInput);
        _currentInput = "";
      }
      _operator = buttonText;
      res = _operator;
      pointActive = false;
    } else if (buttonText == "=") {
      bool tempOp;
      // Calculate result
      double? secondOperand = double.tryParse(_currentInput);
      if (_firstOperand != null && secondOperand != null) {
        switch (_operator) {
          case "+":
            double temp = _firstOperand! + secondOperand;
            res = (temp % 1 != 0) ? temp.toString() : temp.toInt().toString();
            break;
          case "-":
            double temp = _firstOperand! - secondOperand;
            res = (temp % 1 != 0) ? temp.toString() : temp.toInt().toString();
            break;
          case "x":
            double temp = _firstOperand! * secondOperand;
            res = (temp % 1 != 0) ? temp.toString() : temp.toInt().toString();
            break;
          case "÷":
            if (secondOperand != 0) {
              double temp = _firstOperand! / secondOperand;
              res = (temp % 1 != 0) ? temp.toString() : temp.toInt().toString();
            } else {
              res = "Error";
            }
            break;
        }
        _data.add(_firstOperand.toString() +
            " " +
            _operator +
            " " +
            secondOperand.toString() +
            " = " +
            res);
        _firstOperand = null;
        _operator = "";
        _currentInput = res;

        pointActive = false;
      }
    } else if (buttonText == "+/-") {
      // Toggle sign
      if (_currentInput.isNotEmpty && _currentInput != "0") {
        if (_currentInput.startsWith("-")) {
          _currentInput = _currentInput.substring(1);
        } else {
          _currentInput = "-" + _currentInput;
        }
        res = _currentInput;
      }
    } else if (buttonText == ".") {
      // Decimal point
      if (!pointActive) {
        _currentInput += ".";
        res = _currentInput;
        pointActive = true;
      }
    } else if (buttonText == "%") {
      if (_operator.isEmpty && _currentInput.isNotEmpty) {
        //interpret the current input as a percentage of 1
        double value = double.parse(_currentInput) / 100;
        _data.add(_currentInput + " % = " + value.toString());
        _currentInput = value.toString();
        res = _currentInput;
      } else if (_operator.isNotEmpty && _currentInput.isNotEmpty) {
        //calculate the percentage of the first operand
        double secondOperand = double.parse(_currentInput);
        if (_firstOperand != null) {
          double percentageValue;
          if (_operator == "+" || _operator == "-") {
            percentageValue = _firstOperand! * (secondOperand / 100);
            _data.add(
                '${_firstOperand} x (${secondOperand}) ${percentageValue}');
          } else if (_operator == "x" || _operator == "÷") {
            percentageValue = secondOperand / 100;
            _data.add('${secondOperand} / 100 = ${percentageValue}');
          } else {
            percentageValue = secondOperand;
          }
          _currentInput = percentageValue.toString();
          res = _currentInput;
        }
      }
    }
    notifyListeners();
  }
}
