// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/foundation.dart' show debugPrint, kDebugMode;

import '../../ex.dart';

void logD<T>(message) {
  if (kDebugMode) {
    final DateTime now = DateTime.now();
    final String time = " ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
    log('⏱ $time | 🟩 ${message.toString().quote} 🟩');
  }
}

void logE<T>(message) {
  if (kDebugMode) {
    final DateTime now = DateTime.now();
    final String time = " ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
    log('⏱ $time | 🟥 ${message.toString().quote} 🟥');
  }
}

void logI<T>(message) {
  if (kDebugMode) {
    final DateTime now = DateTime.now();
    final String time = " ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}";
    debugPrint('⏱ $time | 🟦 ${message.toString().quote} 🟦');
  }
}

void logW<T>(message) {
  if (kDebugMode) {
    final DateTime now = DateTime.now();
    final String time = " ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}:${now.second.toString().padLeft(2,'0')}";
    debugPrint('⏱ $time | 🟧 ${message.toString().quote} 🟧', wrapWidth: 1440);
  }
}

// —————————————————————————————————————————————————————————————————————————
// EXTENSION FUNCTION  —————————————————————————————————————————————————————
// —————————————————————————————————————————————————————————————————————————
extension LogStringExtension on String {
  void logX() => log(this);

  void logIX() => logI(this);

  void logEX() => logE(this);

  void logWX() => logW(this);
}
