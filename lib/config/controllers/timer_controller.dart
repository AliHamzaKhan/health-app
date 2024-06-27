


import 'dart:async';

class TimerController{
  Timer? debounce;
  int timerSeconds = 3;
  bool hasTriggered = false;

  start({onChange, seconds, noTimer = false}){

    if (debounce?.isActive ?? false) {
      debounce?.cancel();
    }
    debounce = Timer(Duration(seconds: noTimer ? 1 : (seconds ?? timerSeconds)), () async {
      if (!hasTriggered) {
        onChange(true);
        hasTriggered = true;
      }
    });
    hasTriggered = false;
  }
}

