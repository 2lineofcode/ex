import 'dart:convert';
import 'dart:developer' as developer;

const _appName = 'Ex';

void print(dynamic msg, {String? name}) {
  developer.log('$msg${LogColor.reset}', name: name ?? _appName);
}

void log(dynamic msg, {String? name}) {
  developer.log(
    '${LogColor.white}$msg${LogColor.reset}',
    name: name ?? _appName,
  );
}

void logD(dynamic msg, {String? name}) {
  developer.log(
    '${LogColor.cyan}$msg${LogColor.reset}',
    name: name ?? _appName,
  );
}

void logI(dynamic msg, {String? name}) {
  developer.log(
    '${LogColor.blue}$msg${LogColor.reset}',
    name: name ?? _appName,
  );
}

void logS(dynamic msg, {String? name}) {
  developer.log(
    '${LogColor.green}$msg${LogColor.reset}',
    name: name ?? _appName,
  );
}

void logW(dynamic msg, {String? name}) {
  developer.log(
    '${LogColor.orange}$msg${LogColor.reset}',
    name: name ?? _appName,
  );
}

void logE(dynamic msg, {String? name}) {
  developer.log(
    '${LogColor.red}$msg${LogColor.reset}',
    name: name ?? _appName,
  );
}

void logC(dynamic ansiColor, dynamic msg, {String? name}) {
  developer.log(
    '$ansiColor$msg${LogColor.reset}',
    name: name ?? _appName,
  );
}

/// json
void logJson(Map<String, dynamic> input, {String? name = 'JSON VIEW'}) {
  try {
    final object = JsonDecoder().convert(jsonEncode(input));
    final prettyString = JsonEncoder.withIndent('  ').convert(object);

    logC(
      '${LogColor.backgroundGreen}${LogColor.black}',
      '  $name  ',
      name: 'log',
    );
    log(prettyString, name: 'log');
  } catch (e) {
    logS('$input', name: 'log');
  }
}

mixin LogColor {
  static const reset = '\x1B[0m';
  static const red = '\x1B[31m';
  static const green = '\x1B[32m';
  static const blue = '\x1B[34m';
  static const cyan = '\x1B[36m';
  static const orange = '\x1B[38;5;208m';

  static const backgroundRed = '\x1B[41m';
  static const backgroundGreen = '\x1B[42m';
  static const backgroundYellow = '\x1B[43m';
  static const backgroundBlue = '\x1B[44m';
  static const backgroundOrange = '\x1B[48;5;208m';

  static const white = '\x1B[37m';
  static const black = '\x1B[30m';
}
