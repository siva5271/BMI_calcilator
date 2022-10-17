import 'dart:math';

import 'constants.dart';

class BMICalculator {
  double _bmi = 0;
  String GetBMI() {
    _bmi = kWeight / pow(kHeight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String GetResult() {
    _bmi = kWeight / pow(kHeight / 100, 2);
    if (_bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  String GetDescription() {
    _bmi = kWeight / pow(kHeight / 100, 2);
    if (_bmi < 18.5) {
      return 'You need to put on some weight!';
    } else if (_bmi > 25) {
      return 'You are doing well!';
    } else {
      return 'You need to hit the gym!';
    }
  }
}
