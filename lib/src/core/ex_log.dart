import 'dart:developer' as developer;

import 'package:get/get.dart';

var _logName = 'ExLog'.obs;

class ExLog {
  ExLog._();

  static Future<void> init({String? appName}) async {
    log('ExLog is ready...');
    _logName.value = appName ?? 'ExLog';
  }
}

void print(dynamic message) => log(message);
void logD(dynamic message) => log(message);

void log(dynamic message) {
  developer.log('🐛 | $message', name: _logName.value);
}

void logE(dynamic message) {
  developer.log('🔴 | $message', name: _logName.value);
}

void logI(dynamic message) {
  developer.log('ℹ️ | $message', name: _logName.value);
}

void logW(dynamic message) {
  developer.log('🟠 | $message', name: _logName.value);
}
