import 'dart:math';

class Calc {
  int height;
  int weight;
  double _x;
  Calc({this.height, this.weight});

  String bmi() {
    _x = weight / pow(height / 100, 2);
    return _x.toStringAsFixed(1);
  }

  String getc() {
    if (_x < 18)
      return 'UNDERWEIGHT';
    else if (_x > 25)
      return 'OVERWEIGHT';
    else
      return 'NORMAL';
  }

  String getcom() {
    if (_x < 18)
      return 'Personal Advice: Get yourself a balanced diet!';
    else if (_x > 25)
      return 'Personal Advice: Start Exercising daily!';
    else
      return 'Seems like u follow a healthy diet. That\'s nice!';
  }
}
