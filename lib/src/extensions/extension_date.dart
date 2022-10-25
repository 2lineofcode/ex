import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../ex.dart';

///   created               : Aditya Pratama
///   originalFilename      : extension_date
///   date                  : 22 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   scope                : dateTime <-> string
///

extension StringToDateExtension on String {
  /// Convert String to Date
  /// ---
  /// @param : format (optional)
  DateTime toDateEx({String format = 'yyyy-MM-ddTHH:mm:ssZ'}) {
    initializeDateFormatting('in');
    const locale = 'in';
    return DateFormat(format, locale).parse(this);
  }
}

extension DateToStringExtension on DateTime {
  /// Date to String
  /// ---
  /// @param : format (optional)
  String toStringEx({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
  }) {
    initializeDateFormatting('in');
    const locale = 'in';
    final output = DateFormat(format, locale).format(this);
    return output;
  }
}

extension StringToDateFormatterExtension on String {
  /// formatPastOrToday
  /// ---
  /// require : String (date)
  /// return : if past  -> dd MMM => 23 Jan
  /// return : if today -> hh:mm  => 18:20
  /// return : if yesterday -> hh:mm  => Kemarin
  String formatPastOrToday({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
  }) {
    String output;
    final resDate = toDateEx(format: format).toStringEx(format: 'dd MMM');
    final today = DateTime.now().toStringEx(format: 'dd MMM');
    final yesterday = (DateTime.now().subtract(1.days)).toStringEx(format: 'dd MMM');

    if (resDate == today) {
      output = (toDateEx(format: format).add(7.hours)).toStringEx(format: 'HH:mm');
    } else if (resDate == yesterday) {
      output = 'Kemarin';
    } else {
      output = resDate;
    }
    return output;
  }

  String formatRemainingTime({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
  }) {
    String output;
    final resDateTime = toDateEx(format: format).add(7.hours);
    final resDate = resDateTime.toStringEx(format: 'dd MMM');
    final resMinute = resDateTime.toStringEx(format: 'mm');
    final resHours = resDateTime.toStringEx(format: 'HH');
    final today = DateTime.now().toStringEx(format: 'dd MMM');
    final yesterday = (DateTime.now().subtract(1.days)).toStringEx(format: 'dd MMM');

    if (resDate == today) {
      if (resDateTime.hour < DateTime.now().hour) {
        output = '${resMinute}m';
      } else {
        output = '${resHours}j';
      }
    } else if (resDate == yesterday) {
      output = 'Kemarin';
    } else if (resDateTime.day < (DateTime.now().add(6.days)).day) {
      output = resDateTime.toStringEx(format: 'E');
    } else {
      output = resDateTime.toStringEx(format: 'dd/MM/yy');
    }

    return output;
  }

  String formatDate({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
    String to = 'dd MMM yyyy',
    int addHours = 0,
  }) {
    String output;
    try {
      output = (toDateEx(format: format).add(addHours.hours)).toStringEx(format: to);
    } catch (e) {
      debugPrint(e.toString());
      output = 'error';
    }
    return output;
  }

  String fromIntToDate() {
    initializeDateFormatting('in');
    const locale = 'in';
    final df = DateFormat('dd MMMM yyyy', locale);
    final item = toString().substring(0, 10);
    return df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(item) * 1000));
  }
}

extension TimeOfDayExtension on TimeOfDay {
  bool compareTo(TimeOfDay end, TimeOfDay start2, TimeOfDay end2) {
    // if((this.hour <= end2.hour && this.minute <= end2.minute ) && (start2.hour <= end.hour  && start2.minute <= end.minute)) {
    if (hour <= end2.hour && start2.hour < hour) {
      return true;
    }
    return false;
  }
}
