import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCallTimer {
  static const _lastCheckedKey = 'last_checked';
  late DateTime? _lastCheckedTime;

  ApiCallTimer() {
    _lastCheckedTime = DateTime.now();
    _loadLastApiCall();
  }

  Future<void> _loadLastApiCall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final storedTime = pref.getString(_lastCheckedKey);
    _lastCheckedTime =
        storedTime != null ? DateTime.parse(storedTime) : DateTime.now();
  }

  Future<void> _savedLastApiCall() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(_lastCheckedKey, _lastCheckedTime!.toIso8601String());
  }

  bool shouldRunNow() {
    DateTime now = DateTime.now();
    if (_lastCheckedTime == null ||
        now.difference(_lastCheckedTime!).inSeconds >= 5) {
      _lastCheckedTime = now;
      _savedLastApiCall();
      return true;
    }
    return false;
  }
}
