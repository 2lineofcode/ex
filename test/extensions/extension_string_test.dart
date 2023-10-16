import 'package:ex/src/extensions/extension_string.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Extensions', () {
    test('Test firstWord', () {
      expect('aditya pratama'.firstWord, 'aditya');
      expect(''.firstWord, '');
      expect('  '.firstWord, '');
      expect(null.firstWord, null);
    });

    test('Test lastWord', () {
      expect('aditya pratama'.lastWord, 'pratama');
      expect(''.lastWord, '');
      expect('  '.lastWord, '');
      expect(null.lastWord, null);
    });

    test('Test initialName', () {
      expect('aditya pratama ketiga'.initialName, 'AP');
      expect('aditya pratama'.initialName, 'AP');
      expect('aditya'.initialName, 'A');
      expect(null.initialName, '');
    });

    test('Test readTime', () {
      expect('Hello dear friend how you doing ?'.readTime(), 3);
      expect(''.readTime(), 0);
      expect('  '.readTime(), 0);
      expect(null.readTime(), null);
    });

    test('Test capitalize', () {
      expect('hackErrR'.capitalize, 'Hackerrr');
      expect(''.capitalize, '');
      expect('  '.capitalize, '  ');
      expect(null.capitalize, null);
    });

    test('Test countWords', () {
      expect('Hello dear friend how you doing '.countWords, 6);
      expect(''.countWords, 0);
      expect('  '.countWords, 0);
      expect(null.countWords, null);
    });

    test('Test onlyAlfabet', () {
      expect('4*%^55/es4e5523nt1is'.onlyAlfabet, 'esentis');
      expect(''.onlyAlfabet, '');
      expect('  '.onlyAlfabet, '  ');
      expect(null.onlyAlfabet, null);
    });

    test('Test isIpv4', () {
      expect('192.168.1.14'.isIpv4, true);
      expect('192.168.1.14.150.1225'.isIpv4, false);
      expect(''.isIpv4, false);
      expect('  '.isIpv4, false);
      expect(null.isIpv4, null);
    });

    test('Test isIpv6', () {
      expect('2001:0db8:85a3:0000:0000:8a2e:0370:7334'.isIpv6, true);
      expect('192.168.1.14.150.1225'.isIpv6, false);
      expect(''.isIpv6, false);
      expect('  '.isIpv6, false);
      expect(null.isIpv6, null);
    });

    test('Test isUrl', () {
      expect('foo.1com'.isUrl, false);
      expect('google.com'.isUrl, true);
      expect(''.isUrl, false);
      expect('  '.isUrl, false);
      expect(null.isUrl, null);
    });

    test('Test isDate', () {
      expect('20/10/2023'.isDate, true);
      expect('2023-10-20'.isDate, true);
      expect('12/20/23'.isDate, false);
      expect(''.isDate, false);
      expect('  '.isDate, false);
      expect(null.isDate, null);
    });

    test('Test isMail', () {
      expect('esentis@esentis.com'.isMail, true);
      expect('esentis.com'.isMail, false);
      expect(''.isMail, false);
      expect('  '.isMail, false);
      expect(null.isMail, null);
    });

    test('Test isNumber', () {
      expect('45'.isNumber, true);
      expect('45s'.isNumber, false);
      expect(''.isNumber, false);
      expect('  '.isNumber, false);
      expect(null.isNumber, null);
    });

    test('Test isStrongPassword', () {
      expect('qwerty'.isStrongPassword, false);
      expect('gJHGgyk^78151##l0@@'.isStrongPassword, true);
      expect(''.isStrongPassword, false);
      expect('  '.isStrongPassword, false);
      expect(null.isStrongPassword, null);
    });

    test('Test onlyNumbers', () {
      expect('4*%^55/es4e5523nt1is'.onlyNumbers, '455455231');
      expect(''.onlyNumbers, '');
      expect('  '.onlyNumbers, '');
      expect(null.onlyNumbers, null);
    });
  });

  test('Test reverse', () {
    expect('hello'.reverse, 'olleh');
    expect(''.reverse, '');
    expect('  '.reverse, '  ');
    expect(null.reverse, null);
  });

  test('Test toTitleCase', () {
    expect('this is a title'.toTitleCase, 'This Is A Title');
  });
}
