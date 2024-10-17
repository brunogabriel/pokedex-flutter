import 'dart:async';

class Debounce {
  Debounce(
    this.delay,
  );
  Duration delay;
  Timer? _timer;

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}
