import 'package:flutter/foundation.dart';
import 'dart:async';

class Debounce {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;
  Debounce({this.milliseconds});
  run(VoidCallback action) {
    cancelTimer();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
