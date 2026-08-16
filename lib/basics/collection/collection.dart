void main() {
  //--------------------------------------------
  // List - ordered collection, allows duplicates
  //--------------------------------------------

  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> names = ['Ahmed', 'Sara', 'Omar'];

  // add / remove
  numbers.add(6); // [1,2,3,4,5,6]
  numbers.removeAt(0); // removes index 0 → [2,3,4,5,6]
  numbers.remove(3); // removes the value 3 → [2,4,5,6]

  // access
  print(numbers[0]); // first element
  print(numbers.first); // same as [0]
  print(numbers.last); // last element
  print(numbers.length); // count of elements

  // check
  print(numbers.contains(4)); // true
  print(numbers.isEmpty); // false
  print(numbers.isNotEmpty); // true

  // useful list methods
  numbers.sort(); // sorts ascending in place
  List<int> reversed = numbers.reversed.toList();

  List<int> doubled = numbers.map((n) => n * 2).toList();
  List<int> evensOnly = numbers.where((n) => n.isEven).toList();
  int sum = numbers.fold(0, (prev, n) => prev + n);
  bool anyBig = numbers.any((n) => n > 10);
  bool allPositive = numbers.every((n) => n > 0);

  numbers.forEach((n) => print('Number: $n'));

  // join list into a string
  String joined = names.join(', '); // "Ahmed, Sara, Omar"

  //--------------------------------------------
  // Set - unlike List, no duplicates allowed, unordered
  //--------------------------------------------

  Set<int> uniqueNumbers = {1, 2, 2, 3, 3, 3};
  print(uniqueNumbers); // {1, 2, 3} ← duplicates removed automatically

  uniqueNumbers.add(4);
  uniqueNumbers.remove(1);
  print(uniqueNumbers.contains(2)); // true

  // set operations
  Set<int> setA = {1, 2, 3};
  Set<int> setB = {2, 3, 4};

  print(setA.union(setB)); // {1,2,3,4}
  print(setA.intersection(setB)); // {2,3}
  print(setA.difference(setB)); // {1}

  //--------------------------------------------
  // Map - key/value pairs
  //--------------------------------------------

  Map<String, int> ages = {
    'Ahmed': 25,
    'Sara': 22,
    'Omar': 30,
  };

  // access
  print(ages['Ahmed']); // 25
  print(ages['NotFound']); // null (safe, no crash)

  // add / update
  ages['Youssef'] = 28; // adds new key
  ages['Ahmed'] = 26; // updates existing key

  // remove
  ages.remove('Omar');

  // check
  print(ages.containsKey('Sara')); // true
  print(ages.containsValue(22)); // true

  // iterate
  ages.forEach((key, value) {
    print('$key is $value years old');
  });

  // keys / values only
  print(ages.keys.toList());
  print(ages.values.toList());

  // safe access with default value
  int? unknownAge = ages['NotFound'];
  print(unknownAge ?? 0); // 0 if key doesn't exist
}