// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart' show debugPrint, kDebugMode;
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../ex.dart';

class ExLog extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final AnsiColor? color = PrettyPrinter.levelColors[event.level];
    // final String? emoji = PrettyPrinter.levelEmojis[event.level];
    final time = DateFormat.Hms().format(DateTime.now());
    // const tag = ''; //'🚦 ↓';

    return [
      // color!('—————————————————————————————————————————————————————————————————————————————'),
      color!('⏱ $time | ${event.message.toString().quote}'),
      // color('—————————————————————————————————————————————————————————————————————————————'),
    ];
  }
}

final _log = Logger(
  filter: ProductionFilter(),
  printer: ExLog(),
);

void log<T>(message) {
  if (kDebugMode) {
    _log.d('$message');
  }
}

void print<T>(message) {
  // if (kDebugMode) _log.d("$message");
  debugPrint(message, wrapWidth: 5000);
}

void logD<T>(message) {
  if (kDebugMode) {
    _log.d('$message');
  }
}

void logE<T>(message) {
  if (kDebugMode) {
    _log.e('$message');
  }
}

void logI<T>(message) {
  if (kDebugMode) {
    _log.i(message);
  }
}

void logW<T>(message) {
  if (kDebugMode) {
    _log.w('$message');
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
