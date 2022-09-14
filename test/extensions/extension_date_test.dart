// ignore_for_file: missing_whitespace_between_adjacent_strings, noop_primitive_operations

import 'package:ex/ex.dart';
import 'package:ex/src/extensions/extension_date.dart';
import 'package:flutter_test/flutter_test.dart';

///   created               : Aditya Pratama
///   originalFilename      : extension_date
///   date                  : 22 Jun 2021
///   —————————————————————————————————————————————————————————————————————————————
///   scope                : dateTime <-> string
///

void main() {
  group('Adit Extension Date Additional Test', () {
    // test untuk konsistensi nilai. pastikan dimulai dari 1 = januari
    test('parsing date from server (string) -> (date) and matching month', () {
      const mockData = '2022-01-10T05:20:34Z'; // yyyy-MM-ddTHH:mm:ssZ
      final convert = mockData.toDateEx().month;
      expect(DateTime.january, convert); // 1
    });

    test('parsing date from server (date) -> (string) and reformat', () {
      const mockData = '2022-03-10T05:20:34Z'; // yyyy-MM-ddTHH:mm:ssZ
      final convert = mockData.toDateEx().toStringEx(format: 'dd MMM yyyy');
      expect('10 Mar 2022', convert); // 10 Mar 2022
    });

    test(
        ''
        'parsing date from server and check isToday, yesterday, or when?'
        'if today -> HH:mm'
        'if yesterday -> Kemarin'
        'else -> print dd MMM'
        '', () {
      const mockData = '2022-02-04T12:20:34Z'; // yyyy-MM-ddTHH:mm:ssZ
      final convert = mockData.formatPastOrToday();

      if (convert.length == 5) {
        expect('12:20', convert); // 12:20 (GMT+7)
      } else if (convert == 'Kemarin') {
        expect('Kemarin', convert);
      } else {
        expect('04 Feb', convert);
      }
    });
  });
}
