// ignore_for_file: noop_primitive_operations, use_raw_strings

extension MiscExtensions on String? {
  /// input = aditya pratama | output = aditya
  String? get firstWord {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    return this?.split(' ')[0];
  }

  /// input = aditya pratama | output = pratama
  String? get lastWord {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    return this?.split(' ').last;
  }

  /// input = aditya pratama | output = AP
  String get initialName {
    final splitW = this!.split(' ');
    var output = '';

    try {
      if (splitW.length > 1) {
        final fWord = splitW[0].substring(0, 1).toUpperCase();
        final sWord = splitW[1].substring(0, 1).toUpperCase();
        output = fWord + sWord;
      } else {
        final fWord = splitW[0].substring(0, 1).toUpperCase();
        output = fWord;
      }
    } catch (_) {
      output = '-';
    }
    return output;
  }

  /// Returns the average read time duration of the given String in seconds.
  ///
  /// The default calculation is based on 200 words per minute.
  ///
  /// You can pass the [wordsPerMinute] parameter for different read speeds.
  /// ### Example
  /// ```dart
  /// String foo =  'Hello dear friend how you doing ?';
  /// int readTime = foo.readTime(); // returns 3 seconds.
  /// ```
  int? readTime({int wordsPerMinute = 200}) {
    if (this == null) return null;
    if (this!.isEmpty) return 0;
    final words = this!.trim().split(RegExp(r'(\s+)'));
    final magicalNumber = words.length / wordsPerMinute;
    return (magicalNumber * 100).toInt();
  }

  /// Capitalizes the string in normal form.
  /// ### Example
  /// ```dart
  /// String foo = 'hAckErrR';
  /// String cFoo = foo.capitalize; // returns 'Hackerrr'.
  /// ```
  String? get capitalize {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }

  /// Returns the word count in the given string.
  ///
  /// The pattern is based on spaces.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// int count = foo.countWords; // returns 6 words.
  /// ```
  int? get countWords {
    if (this == null) return null;
    if (this!.isEmpty) return 0;
    final words = this!.trim().split(RegExp(r'(\s+)'));
    final filteredWords = words.where((e) => e.isNotEmpty);
    return filteredWords.length;
  }

  /// Returns only the Latin characters from the String.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String onlyLatin = foo.onlyLatin; // returns 'esentis'
  /// ```
  String? get onlyAlfabet {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    final regex = RegExp(r'([^a-zA-Z\s]+)');
    return this!.replaceAll(regex, '');
  }

  /// Checks whether the String is valid IPv4.
  /// ### Example 1
  /// ```dart
  /// String foo = '192.168.1.14';
  /// bool isIpv4 = foo.isIpv4; // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '192.168.1.14.150.1225';
  /// bool isIpv4 = foo.isIpv4; // returns false
  /// ```
  bool? get isIpv4 {
    if (this == null) return null;
    if (this!.isEmpty) return false;
    final regex = RegExp(
      r'((?:^|\s)([a-z]{3,6}(?=://))?(://)?((?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.(?:25[0-5]|2[0-4]\d|[01]?\d\d?))(?::(\d{2,5}))?(?:\s|$))',
    );
    return regex.hasMatch(this!);
  }

  /// Checks whether the String is valid IPv6.
  /// ### Example 1
  /// ```dart
  /// String foo = '2001:0db8:85a3:0000:0000:8a2e:0370:7334';
  /// bool isIpv6 = foo.isIpv6; // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '192.168.1.14.150.1225';
  /// bool isIpv6 = foo.isIpv6; // returns false
  /// ```
  bool? get isIpv6 {
    if (this == null) return null;
    if (this!.isEmpty) return false;
    this!.substring(0, 1);
    final regex = RegExp(
      r'(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))',
    );
    return regex.hasMatch(this!);
  }

  /// Checks whether the String is valid URL.
  /// ### Example 1
  /// ```dart
  /// String foo = 'foo.1com';
  /// bool isUrl = foo.isUrl; // returns false
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'google.com';
  /// bool isUrl = foo.isUrl; // returns true
  /// ```
  bool? get isUrl {
    if (this == null) return null;
    if (this!.isEmpty) return false;
    final regex = RegExp(
      r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)',
    );
    return regex.hasMatch(this!);
  }

  /// Checks whether the String is valid Date:
  ///
  /// ### Valid formats
  ///
  /// * dd/mm/yyyy
  /// * dd-mm-yyyyy
  /// * dd.mm.yyyy
  /// * yyyy-mm-dd
  /// * yyyy-mm-dd hrs
  /// * 20120227 13:27:00
  /// * 20120227T132700
  /// * 20120227
  /// * +20120227
  /// * 2012-02-27T14Z
  /// * 2012-02-27T14+00:00
  /// * -123450101 00:00:00 Z": in the year -12345
  /// * 2002-02-27T14:00:00-0500": Same as "2002-02-27T19:00:00Z
  bool? get isDate {
    if (this == null) return null;
    if (this!.isEmpty) return false;
    final regex = RegExp(
      r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$',
    );
    if (regex.hasMatch(this!)) return true;
    try {
      DateTime.parse(this!);
      return true;
    } on FormatException {
      return false;
    }
  }

  /// Checks whether the String is a valid mail.
  /// ### Example
  /// ```dart
  /// String foo = 'esentis@esentis.com';
  /// bool isMail = foo.isMail; // returns true
  /// ```
  bool? get isMail {
    if (this == null) return null;
    if (this!.isEmpty) return false;
    final regex = RegExp(r"(^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$)");
    return regex.hasMatch(this!);
  }

  /// Checks whether the String is a number.
  /// ### Example
  /// ```dart
  /// String foo = '45';
  /// bool isNumber = foo.isNumber; // returns true
  /// ```
  /// ```dart
  /// String foo = '45s';
  /// String isNumber = foo.isNumber; // returns false
  bool? get isNumber {
    if (this == null) return null;
    if (this!.isEmpty) return false;
    return num.tryParse(this!) != null;
  }

  /// Checks whether the String is a "strong" password which complies to below rules :
  ///  * At least 1 uppercase
  ///  * At least 1 special character
  ///  * At least 1 number
  ///  * At least 8 characters in length
  /// ### Example
  /// ```dart
  /// String foo = 'qwerty';
  /// bool isStrong = foo.isStrongPassword; // returns false
  /// ```
  /// ```dart
  /// String foo = 'IsTh!$Strong';
  /// bool isStrong = foo.isStrongPassword; // returns true
  /// ```
  bool? get isStrongPassword {
    if (this == null) return null;
    if (this!.isEmpty) return false;
    final regex = RegExp(r'^(?=.*([A-Z]){1,})(?=.*[!@#$&*]{1,})(?=.*[0-9]{1,})(?=.*[a-z]{1,}).{8,100}$');
    return regex.hasMatch(this!);
  }

  /// Returns only the numbers from the String.
  /// ### Example
  /// ```dart
  /// String foo = '4*%^55/es4e5523nt1is';
  /// String onyNumbers = foo.onlyNumbers; // returns '455455231'
  /// ```
  String? get onlyNumbers {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    // ignore: unnecessary_raw_strings
    final regex = RegExp(r'([^0-9]+)');
    return this!.replaceAll(regex, '');
  }

  /// Removes only the letters from the String.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noLetters = foo.removeLetters; // returns '455231'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s';
  /// String noLetters = foo.removeLetters; // returns '1244**4*5523**1*'
  /// ```
  String? get removeLetters {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    // ignore: unnecessary_raw_strings
    final regex = RegExp(r'([a-zA-Z]+)');
    return this!.replaceAll(regex, '');
  }

  /// Finds a specific's character occurence in a string.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'foo';
  /// int occ = foo.charCount('o'); // returns 2
  /// ```
  int? charCount(String char) {
    if (this == null) return null;
    if (this!.isEmpty) return 0;
    return this!.split('').fold<int>(0, (previousValue, ch) => previousValue + (ch == char ? 1 : 0));
  }

  /// Returns the String reversed.
  /// ### Example
  /// ```dart
  /// String foo = 'Hello World';
  /// String reversed = foo.reverse; // returns 'dlrow olleH'
  /// ```
  String? get reverse {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    final letters = this!.split('').toList().reversed;
    return letters.reduce((current, next) => current + next);
  }

  /// Returns the first [n] characters of the string.
  ///
  /// n is optional, by default it returns the first character of the string.
  ///
  /// If [n] provided is longer than the string's length, the string will be returned.
  ///
  /// Faster than using
  /// ```dart
  /// substring(0,count)
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'hello world';
  /// String firstChars = foo.first(); // returns 'h'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'hello world';
  /// bool firstChars = foo.first(3); // returns 'hel'
  /// ```
  String? first({int n = 1}) {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (this!.length < n) return this;
    return this!.substring(0, n);
  }

  /// Returns the last [n] characters of the string.
  ///
  /// [n] is optional, by default it returns the first character of the string.
  ///
  /// If [n] provided is longer than the string's length, the string will be returned.
  ///
  /// Faster than using
  /// ```dart
  /// substring(length-n,length)
  /// ```
  /// ### Example 1
  /// ```dart
  /// String foo = 'hello world';
  /// String firstChars = foo.last(); // returns 'd'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'hello world';
  /// bool firstChars = foo.last(3); // returns 'rld'
  /// ```
  String? last({int n = 1}) {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (this!.length < n) return this;
    return this!.substring(this!.length - n, this!.length);
  }

  /// Returns the string to slug case.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'hello world';
  /// String fooSlug = foo.toSlug; // returns 'hello_world'
  /// ```
  String? get toSlug {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    final words = this!.trim().split(RegExp(r'(\s+)'));
    var slugWord = '';
    if (this!.length == 1) {
      return this;
    }
    for (var i = 0; i <= words.length - 1; i++) {
      if (i == words.length - 1) {
        slugWord += words[i];
      } else {
        slugWord += '${words[i]}_';
      }
    }
    return slugWord;
  }

  /// Returns the String in camelcase.
  /// ### Example
  /// ```dart
  /// String foo = 'Find max of array';
  /// String camelCase = foo.toCamelCase; // returns 'findMaxOfArray'
  /// ```
  String? get toCamelCase {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    final words = this!.trim().split(RegExp(r'(\s+)'));
    final result = StringBuffer(words[0].toLowerCase());
    for (var i = 1; i < words.length; i++) {
      result.write(
        words[i].substring(0, 1).toUpperCase() + words[i].substring(1).toLowerCase(),
      );
    }
    return result.toString();
  }

  /// Returns the word title cased.
  ///
  /// ```dart
  /// String foo = 'Hello dear friend how you doing ?';
  /// Sting titleCased = foo.toTitleCase; // returns 'Hello Dear Friend How You Doing'.
  /// ```
  String? get toTitleCase {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    final words = this!.toLowerCase().split(' ');
    for (var i = 0; i < words.length; i++) {
      words[i] = words[i].substring(0, 1).toUpperCase() + words[i].substring(1);
    }
    return words.join(' ');
  }

  /// Converts a `string` to a numeric value if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toNum(); // returns 4;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toNum(); // returns null;
  /// ```
  num? toNum() {
    if (this == null) return null;
    if (this!.isEmpty) return null;
    return num.tryParse(this!);
  }

  /// Converts a `string` to`int` if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toInt(); // returns 4;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toInt(); // returns null;
  /// ```
  /// ```dart
  /// String foo = '4.0';
  /// var fooNull = foo.toInt(); // returns 4;
  /// ```
  int? toInt() {
    if (this == null) return null;
    if (this!.isEmpty) return null;
    return int.tryParse(this!) ?? double.tryParse(this!)?.floor();
  }

  /// Converts a `string` to`double` if possible.
  ///
  /// If conversion fails, `null` is returned.
  ///
  /// ### Example
  /// ```dart
  /// String foo = '4';
  /// int fooInt = foo.toDouble(); // returns 4.0;
  /// ```
  /// ```dart
  /// String foo = '4f';
  /// var fooNull = foo.toDouble(); // returns null;
  /// ```
  double? toDouble() {
    if (this == null) return null;
    if (this!.isEmpty) return null;
    return double.tryParse(this!);
  }

  /// Strips all HTML code from String.
  ///
  /// ### Example
  /// ```dart
  /// String html = '<script>Hacky hacky.</script> <p>Here is some text. <span class="bold">This is bold. </span></p>';
  /// String stripped = foo.stripHtml; // returns 'Hacky hacky. Here is some text. This is bold.';
  /// ```
  String? get stripHtml {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    // ignore: unnecessary_raw_strings
    final regex = RegExp(r'<[^>]*>');
    return this!.replaceAll(regex, '');
  }

  /// Removes the first [n] characters of the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis'
  /// String newFoo = foo.removeFirst(3) // 'ntis';
  /// ```
  String? removeFirst(int n) {
    if (this == null) {
      return null;
    }
    if (this!.isEmpty) {
      return this;
    }
    if (n <= 0) {
      return this;
    }
    if (n >= this!.length) {
      return '';
    }
    return this!.substring(n, this!.length);
  }

  /// Removes the last [n] characters of the `String`.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis';
  /// String newFoo = foo.removeLast(3); // 'esen';
  /// ```
  String? removeLast(int n) {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (n <= 0) return this;
    if (n >= this!.length) return '';

    return this!.substring(0, this!.length - n);
  }

  /// Trims the `String` to have maximum [n] characters.
  ///
  /// ### Example
  /// ```dart
  /// String foo = 'esentis';
  /// String newFoo = foo.maxChars(3); // 'esen';
  /// ```
  String? maxChars(int n) {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (n <= 0) return '';
    if (n >= this!.length) return this;
    return this!.substring(0, n);
  }

  /// Truncates a `String` with more than `length` characters.
  ///
  /// [length] must be more than 0.
  ///
  /// If [length] > String.length the same `String` is returned without truncation.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String f = 'congratulations';
  /// String truncated = f.truncate(3); // Returns 'con...'
  /// ```
  String? truncate(int length) {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (length <= 0) return this;
    if (length > this!.length) return this;
    return '${this!.substring(0, length)}...';
  }

  /// Truncates a long `String` in the middle while retaining the beginning and the end.
  ///
  /// [maxChars] must be more than 0.
  ///
  /// If [maxChars] > String.length the same `String` is returned without truncation.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String f = 'congratulations';
  /// String truncated = f.truncateMiddle(5); // Returns 'con...ns'
  /// ```
  String? truncateMiddle(int maxChars) {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (maxChars <= 0) return this;
    if (maxChars > this!.length) return this;
    final leftChars = (maxChars / 2).ceil();
    final rightChars = maxChars - leftChars;
    return '${this!.first(n: leftChars)}...${this!.last(n: rightChars)}';
  }

  /// Trims leading and trailing spaces, so as extra spaces in between words.
  ///
  /// ### Example
  ///
  /// ```dart
  /// String text = '    esentis    thinks   ';
  /// String trimmed = text.trimAll ; // returns 'esentis thinks'
  /// ```
  String? get trimAll {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    return this!.trim().replaceAll(RegExp(' +'), ' ');
  }

  /// Searches the string for the first occurrence of a [pattern] and returns
  /// everything after that occurrence.
  ///
  /// Returns `''` if no occurrences were found.
  ///
  /// Example:
  /// ```dart
  /// 'value=1'.allAfter('=');                 // '1'
  /// 'i like turtles'.allAfter('like')        // ' turtles'
  /// 'i   like cats'.allAfter(RegExp('\\s+')) // 'like cats'
  /// ```
  String allAfter(Pattern pattern) {
    final matchIterator = pattern.allMatches(this!).iterator;
    if (matchIterator.moveNext()) {
      final match = matchIterator.current;
      final length = match.end - match.start;
      return this!.substring(match.start + length);
    }
    return '';
  }

  /// Searches the string for the last occurrence of a [pattern] and returns
  /// everything before that occurrence.
  ///
  /// Returns `''` if no occurrences were found.
  ///
  /// Example:
  /// ```dart
  /// 'value=1'.allBefore('=');          // 'value'
  /// 'i like turtles'.allBefore('like') // 'i '
  /// ```
  String allBefore(Pattern pattern) {
    final matchIterator = pattern.allMatches(this!).iterator;
    Match? match;
    while (matchIterator.moveNext()) {
      match = matchIterator.current;
    }
    if (match != null) return this!.substring(0, match.start);

    return '';
  }

  /// Searches the string for the first occurrence of [startPattern] and the
  /// last occurrence of [endPattern]. It returns the string between that
  /// occurrences.
  ///
  /// Returns `''` if no occurrences were found.
  ///
  /// Example:
  /// ```dart
  /// 'i like turtles'.allBetween('i ', ' turtles') // 'like'
  /// ```
  String allBetween(Pattern startPattern, Pattern endPattern) {
    return allAfter(startPattern).allBefore(endPattern);
  }

  String? maxLength(int length) {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    if (length <= 0) return this;
    if (length > this!.length) return this;
    return '${this!.substring(0, length)}';
  }

  String? maxWords(int maxWords) {
    if (this == null) return null;
    if (this!.isEmpty) return this;
    final words = this!.split(' ');
    if (words.length <= maxWords) {
      return this;
    } else {
      final limitedWords = words.sublist(0, maxWords);
      return limitedWords.join(' ');
    }
  }
}

extension NullableStringIsNullOrEmptyExtension on String? {
  /// Returns `true` if the string is either `null` or empty.
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}

extension NullableStringIsNotNullOrEmptyExtension on String? {
  /// Returns `true` if the string is neither null nor empty.
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
