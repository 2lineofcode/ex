import 'dart:developer' as developer;

const _logName = 'ExLog';

class ExLog {
  ExLog._();

  static Future<void> init() async {
    log('ExLog is ready...');
  }
}

void log(dynamic message) {
  developer.log('👻 | $message', name: _logName);
}

void print(dynamic message) {
  log(message);
}

void logD(dynamic message) {
  log(message);
}

void logE(dynamic message) {
  developer.log('🔴 | $message', name: _logName);
}

void logI(dynamic message) {
  developer.log('ℹ️ | $message', name: _logName);
}

void logW(dynamic message) {
  developer.log('🟠 | $message', name: _logName);
}
