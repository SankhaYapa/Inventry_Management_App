import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get getCounter => _counter;
  void increaseCounter() {
    _counter++;
    Logger().i(_counter);
    notifyListeners();
  }

  void decreaseCounter() {
    _counter--;
    Logger().i(_counter);
    notifyListeners();
  }
}
