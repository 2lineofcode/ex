// ignore_for_file: depend_on_referenced_packages

import 'package:ex/ex.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

///   created               : Aditya Pratama
///   originalFilename      : extension_date
///   date                  : 22 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   scope                : dateTime <-> string
///

/// STRING TO DATE
extension StringToDateExtension on String {
  DateTime toDateEx({String format = 'yyyy-MM-ddTHH:mm:ssZ', String locale = 'in'}) {
    initializeDateFormatting(locale);
    return DateFormat(format, locale).parse(this);
  }
}

/// REFORMAT DATE
extension ReformatDateExtension on String {
  String reformatDate({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
    String to = 'dd MMM yyyy',
    String locale = 'in',
    int addHours = 0,
  }) {
    String output;
    try {
      output = toDateEx(format: format, locale: locale).add(addHours.hours).toStringEx(format: to, locale: locale);
    } catch (e) {
      logE(e.toString());
      output = 'error';
    }
    return output;
  }
}

/// DATE TO STRING
extension DateToStringExtension on DateTime {
  String toStringEx({String format = 'yyyy-MM-ddTHH:mm:ssZ', String locale = 'in'}) {
    initializeDateFormatting(locale);
    final output = DateFormat(format, locale).format(this);
    return output;
  }
}

// INT TO DATE (String)
extension IntToDateExtension on DateTime {
  String intToDate({String locale = 'in'}) {
    initializeDateFormatting(locale);
    final df = DateFormat('dd MMMM yyyy');
    final item = toString().substring(0, 10);
    return df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(item) * 1000));
  }
}

extension StringToDateFormatterExtension on String {
  /// formatPastOrToday
  /// ---
  /// require : String (date)
  /// return : if today -> hh:mm  => 18:20
  /// return : if yesterday -> hh:mm  => Yesterday
  /// return : if past  -> dd MMM => 23 Jan
  String formatPastOrToday({String format = 'yyyy-MM-ddTHH:mm:ssZ', String locale = 'in'}) {
    String output;
    final resDate = reformatDate(format: format, locale: locale, to: 'dd MMM');
    final today = DateTime.now().toStringEx(format: 'dd MMM');
    final yesterday = DateTime.now().subtract(1.days).toStringEx(format: 'dd MMM');

    if (resDate == today) {
      output = toDateEx(format: format, locale: locale).toStringEx(format: 'HH:mm');
    } else if (resDate == yesterday) {
      output = 'Yesterday'.tr;
    } else {
      output = resDate;
    }
    return output;
  }
}
