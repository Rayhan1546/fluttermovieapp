import 'dart:async';
import 'dart:ui';

class Debounce {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debounce({required this.milliseconds});

  void run(VoidCallback action) {
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
