void main() {
  //--------------------------------------------
  // basic string
  //--------------------------------------------

  String text = "Ahmed,Sara,Omar";
  String sentence = "  Hello World  ";

  //--------------------------------------------
  // split - breaks a string into a List
  //--------------------------------------------

  List<String> names = text.split(','); // ["Ahmed", "Sara", "Omar"]
  print(names);

  List<String> words = "Hello World".split(' '); // ["Hello", "World"]
  print(words);

  //--------------------------------------------
  // trim - removes extra spaces
  //--------------------------------------------

  print(sentence.trim()); // "Hello World"
  print(sentence.trimLeft()); // "Hello World  "
  print(sentence.trimRight()); // "  Hello World"

  //--------------------------------------------
  // case conversion
  //--------------------------------------------

  String name = 'ahmed';
  print(name.toUpperCase()); // "AHMED"
  print(name.toUpperCase().toLowerCase()); // "ahmed"

  //--------------------------------------------
  // substring - extract part of a string
  //--------------------------------------------

  String word = "Programming";
  print(word.substring(0, 4)); // "Prog"  ← from index 0 to 4 (exclusive)
  print(word.substring(4)); // "ramming" ← from index 4 to end

  //--------------------------------------------
  // contains / startsWith / endsWith
  //--------------------------------------------

  print(word.contains('gram')); // true
  print(word.startsWith('Pro')); // true
  print(word.endsWith('ing')); // true

  //--------------------------------------------
  // indexOf - find position of a substring
  //--------------------------------------------

  print(word.indexOf('gram')); // 3   ← first occurrence
  print(word.lastIndexOf('m')); // 8   ← last occurrence
  print(word.indexOf('xyz')); // -1  ← not found

  //--------------------------------------------
  // replace
  //--------------------------------------------

  print(word.replaceAll('m', 'M')); // "PrograMMing"
  print(word.replaceFirst('m', 'M')); // "PrograMming"

  //--------------------------------------------
  // length & isEmpty / isNotEmpty
  //--------------------------------------------

  print(word.length); // 11
  print(''.isEmpty); // true
  print(word.isNotEmpty); // true

  //--------------------------------------------
  // join - opposite of split, List → String
  //--------------------------------------------

  List<String> parts = ['Ahmed', 'Sara', 'Omar'];
  String joined = parts.join(' - '); // "Ahmed - Sara - Omar"
  print(joined);

  //--------------------------------------------
  // compareTo - compare two strings alphabetically
  //--------------------------------------------

  print('apple'.compareTo('banana')); // negative → apple comes first
  print('banana'.compareTo('apple')); // positive → banana comes after
  print('apple'.compareTo('apple')); // 0 → equal

  //--------------------------------------------
  // padding - useful for formatting output
  //--------------------------------------------

  print('5'.padLeft(3, '0')); // "005"
  print('5'.padRight(3, '0')); // "500"

  //--------------------------------------------
  // characters as codes (advanced, rarely needed early on)
  //--------------------------------------------

  print('A'.codeUnitAt(0)); // 65  ← ASCII code
  print(String.fromCharCode(65)); // "A"

  //--------------------------------------------
  // string interpolation reminder
  //--------------------------------------------

  int age = 25;
  print('Age is $age, next year is ${age + 1}');
}