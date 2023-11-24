import 'package:ex/src/extensions/extension_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('List Extensions', () {
    test('Unique with integers', () {
      final originalList = [1, 2, 2, 3, 4, 4, 5];
      final uniqueList = originalList.unique();
      expect(uniqueList, equals([1, 2, 3, 4, 5]));
    });

    test('Unique with custom objects', () {
      final originalList = [
        Person(name: 'Alice', age: 30),
        Person(name: 'Bob', age: 25),
        Person(name: 'Alice', age: 30),
        Person(name: 'Charlie', age: 35),
      ];

      final uniqueList = originalList.unique((person) => person.name);
      expect(uniqueList, hasLength(3));
    });

    test('Unique with nullable id function', () {
      final originalList = [1, 2, 2, 3, 4, 4, 5, null, null, 5];
      final uniqueList = originalList.unique((x) => x);
      expect(uniqueList, hasLength(7));
    });

    test('Limit Length', () {
      final longList = [1, 2, 3, 4, 5, 6];
      final shortList = longList.limitLength(3);
      expect(shortList, equals([1, 2, 3]));
    });
  });
}

class Person {
  Person({required this.name, required this.age});
  String name;

  int age;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person && other.name == name && other.age == age;
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => name.hashCode ^ age.hashCode;
}
