import 'dart:developer' as developer;

const _logName = 'ExLog';

class ExLog {
  ExLog._();

  static Future<void> init() async {
    log('ExLog is ready...');
  }
}

void log(message) {
  developer.log('👻 | $message', name: _logName);
}

void print(message) {
  log(message);
}

void logD(message) {
  log(message);
}

void logE(message) {
  developer.log('🔴 | $message', name: _logName);
}

void logI(message) {
  developer.log('ℹ️ | $message', name: _logName);
}

void logW(message) {
  developer.log('🟠 | $message', name: _logName);
}
