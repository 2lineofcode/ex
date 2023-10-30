import 'package:ex_kit/ex.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String to Date Extension', () {
    test('Convert String to Date', () {
      const dateStr = '2023-10-22T12:30:00Z';
      final date = dateStr.toDateEx();
      expect(date.year, equals(2023));
      expect(date.month, equals(10));
      expect(date.day, equals(22));
      expect(date.hour, equals(12));
      expect(date.minute, equals(30));
      expect(date.second, equals(0));
    });

    test('Convert String to Date and Get Time Ago', () {
      const dateStr = '2023-10-21T12:30:00Z';
      final timeAgo = dateStr.ago();
      expect(timeAgo, equals('1 day ago'));
    });
  });

  group('Reformat Date Extension', () {
    test('Reformat Date String', () {
      const originalDateStr = '2023-10-22T12:30:00Z';
      final reformattedDateStr = originalDateStr.reformatDate();
      expect(reformattedDateStr, equals('22 Oct 2023'));
    });
  });

  group('Date to String Extension', () {
    test('Convert Date to String', () {
      final date = DateTime(2023, 10, 22, 12, 30);
      final dateStr = date.toStringEx();
      expect(dateStr, equals('2023-10-22T12:30:00'));
    });

    test('Get Time Ago from Date', () {
      final pastDate = DateTime(2023, 10, 20, 10);
      final timeAgo = pastDate.ago();
      expect(timeAgo, equals('2 days ago'));
    });
  });
}
