import 'package:ex_kit/ex.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/// STRING TO DATE
extension StringToDateExtension on String {
  DateTime toDateEx({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
    String locale = 'in',
  }) {
    initializeDateFormatting(locale);
    return DateFormat(format, locale).parse(this);
  }

  String ago({String format = 'yyyy-MM-ddTHH:mm:ssZ', String locale = 'in'}) {
    initializeDateFormatting(locale);
    return toDateEx(format: format, locale: locale).ago();
  }
}

/// REFORMAT DATE
extension ReformatDateExtension on String {
  String reformatDate({
    String from = 'yyyy-MM-ddTHH:mm:ssZ',
    String to = 'dd MMM yyyy',
    String locale = 'in',
    int addHours = 0,
  }) {
    initializeDateFormatting(locale);
    String output;
    try {
      output = toDateEx(format: from, locale: locale)
          .add(addHours.hours)
          .toStringEx(format: to, locale: locale);
    } catch (e) {
      logE(e.toString());
      output = 'error';
    }
    return output;
  }
}

/// DATE TO STRING
extension DateToStringExtension on DateTime {
  String toStringEx({
    String format = 'yyyy-MM-ddTHH:mm:ssZ',
    String locale = 'in',
  }) {
    initializeDateFormatting(locale);
    final output = DateFormat(format, locale).format(this);
    return output;
  }

  String ago() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = difference.inDays ~/ 365;
      return Intl.plural(
        years,
        zero: 'No years ago',
        one: '1 year ago',
        other: '$years years ago',
      );
    } else if (difference.inDays > 30) {
      final months = difference.inDays ~/ 30;
      return Intl.plural(
        months,
        zero: 'No months ago',
        one: '1 month ago',
        other: '$months months ago',
      );
    } else if (difference.inDays > 0) {
      return Intl.plural(
        difference.inDays,
        zero: 'Today',
        one: 'Yesterday',
        other: '${difference.inDays} days ago',
      );
    } else if (difference.inHours > 0) {
      return Intl.plural(
        difference.inHours,
        zero: 'Just now',
        one: '1 hour ago',
        other: '${difference.inHours} hours ago',
      );
    } else if (difference.inMinutes > 0) {
      return Intl.plural(
        difference.inMinutes,
        zero: 'Just now',
        one: '1 minute ago',
        other: '${difference.inMinutes} minutes ago',
      );
    } else {
      return 'Just now';
    }
  }
}
