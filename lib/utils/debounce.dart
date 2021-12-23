import 'dart:async';

class Debouncer {
  late final Duration delay;
  Timer? _timer;

  Debouncer({this.delay = const Duration(milliseconds: 300)});

  call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }
}