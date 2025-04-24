import 'dart:async';
import 'package:get/get.dart';

class FocusTimerController extends GetxController {
  final duration = 25 * 60; // 25 minutes in seconds
  var timeLeft = (25 * 60).obs;
  var isRunning = false.obs;
  Timer? _timer;

  void toggleTimer() {
    if (isRunning.value) {
      _timer?.cancel();
      isRunning.value = false;
    } else {
      _startTimer();
      isRunning.value = true;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
        isRunning.value = false;
      }
    });
  }

  void reset() {
    _timer?.cancel();
    timeLeft.value = duration;
    isRunning.value = false;
  }

  String get timeFormatted {
    int minutes = timeLeft.value ~/ 60;
    int seconds = timeLeft.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get percent => 1 - (timeLeft.value / duration);
}
