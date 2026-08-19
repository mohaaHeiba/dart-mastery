// ============================================
// CLASS DEFINITIONS
// ============================================

class Person {
  String name;
  int age;

  // basic constructor
  Person(this.name, this.age);

  // named constructor: creates an object with default values
  Person.guest()
      : name = 'Guest',
        age = 0;

  // named constructor: builds an object from external data (e.g. an API response)
  Person.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        age = map['age'];

  void introduce() {
    print('Hi, I am $name, $age years old');
  }

  bool isAdult() {
    return age >= 18;
  }

  @override
  String toString() {
    return 'Person(name: $name, age: $age)';
  }
}

// named + optional parameters, with a default value for age
class UserProfile {
  String name;
  int age;

  UserProfile({required this.name, this.age = 0});
}

class Circle {
  double radius;

  Circle(this.radius);

  // getter — computed on the fly, used without ()
  double get area => 3.14 * radius * radius;

  // setter — used like a property assignment
  set diameter(double d) {
    radius = d / 2;
  }
}

class Counter {
  static int count = 0;

  Counter() {
    count++; // every new Counter object increments the shared static value
  }
}

// class with == and hashCode overridden to compare by VALUE
class ComparablePerson {
  String name;
  int age;

  ComparablePerson(this.name, this.age);

  @override
  bool operator ==(Object other) {
    return other is ComparablePerson && other.name == name && other.age == age;
  }

  @override
  int get hashCode => Object.hash(name, age);
}

// const constructor — all fields must be final for a class to support const
class ConstPoint {
  final int x;
  final int y;

  const ConstPoint(this.x, this.y);
}

void main() {
  // ============================================
  // BASIC CLASS + CONSTRUCTOR
  // ============================================

  var p1 = Person('Ahmed', 25);
  var p2 = Person('Sara', 22);

  print(p1.name); // Ahmed
  print(p2.age); // 22

  p1.introduce(); // "Hi, I am Ahmed, 25 years old"
  print(p1.isAdult()); // true

  // ============================================
  // NAMED CONSTRUCTORS
  // ============================================

  var guest = Person.guest();
  var fromApi = Person.fromMap({'name': 'Omar', 'age': 30});

  print(guest.name); // "Guest"
  print(fromApi.name); // "Omar"

  // ============================================
  // NAMED PARAMETERS in constructor (used everywhere in Flutter)
  // ============================================

  var user1 = UserProfile(name: 'Youssef', age: 28);
  var user2 = UserProfile(name: 'Sara'); // age defaults to 0

  print(user1.name); // Youssef
  print(user2.age); // 0

  // ============================================
  // FINAL FIELDS — can't be reassigned after creation
  // ============================================

  var person = Person('Ahmed', 25);
  person.age = 26; //  allowed, age is not final
  // person.name = 'Sara'; //  would error if name were final

  // ============================================
  // GETTERS & SETTERS
  // ============================================

  var circle = Circle(5);
  print(circle.area); // used like a property, no ()

  circle.diameter = 20; // used like a property assignment
  print(circle.radius); // 10.0

  // ============================================
  // STATIC MEMBERS — belong to the class, not to any single object
  // ============================================

  Counter();
  Counter();
  Counter();
  print(Counter.count); // 3 — accessed via the class itself

  // ============================================
  // toString() — customizes what print() shows for an object
  // ============================================

  var printable = Person('Ahmed', 25);
  print(printable); // "Person(name: Ahmed, age: 25)" thanks to @override

  // ============================================================
  // MEMORY & REFERENCES — the part that trips most people up
  // ============================================================

  // --------------------------------------------
  // Scenario 1: p2 = p1 → NOT a new object, just another
  // reference pointing at the SAME object in memory (the heap)
  // --------------------------------------------

  var a1 = Person('Ahmed', 25);
  var a2 = a1; // a2 now points at the exact same object as a1

  a2.name = 'Modified';
  print(a1.name); // "Modified" too! because a1 and a2 are the same object

  // --------------------------------------------
  // Scenario 2: calling the constructor again → a BRAND NEW object,
  // even if the values are identical
  // --------------------------------------------

  var b1 = Person('Ahmed', 25);
  var b2 = Person('Ahmed', 25); // a completely separate object

  print(b1 == b2); // false — default == compares memory reference, not values
  print(identical(b1, b2)); // false — confirms they are different objects

  b2.name = 'Changed';
  print(b1.name); // still "Ahmed" — b1 was never touched

  // --------------------------------------------
  // identical() — the reliable way to check "is this the SAME object"
  // --------------------------------------------

  print(identical(a1, a2)); // true  — same object
  print(identical(b1, b2)); // false — different objects

  // --------------------------------------------
  // Overriding == to compare by VALUE instead of by reference
  // (see the ComparablePerson class below)
  // --------------------------------------------

  var c1 = ComparablePerson('Ahmed', 25);
  var c2 = ComparablePerson('Ahmed', 25);

  print(c1 == c2); // true now — because == was overridden to compare fields
  print(identical(c1, c2)); // still false — they're still separate objects in memory

  // --------------------------------------------
  // const constructors — identical values + const = same object (canonicalization)
  // Dart reuses the same memory slot for identical const objects
  // --------------------------------------------

  const d1 = ConstPoint(1, 2);
  const d2 = ConstPoint(1, 2);

  print(identical(d1, d2)); // true! — const objects with the same values are canonicalized
}

