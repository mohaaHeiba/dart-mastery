void main() {
  // ============================================
  // ABSTRACT CLASS — a template that CANNOT be instantiated directly
  // Forces every subclass to implement its abstract methods
  // ============================================

  // var shape = Shape(); //  Error! Can't create an object from an abstract class

  var circle = Circle(5);
  var square = Square(4);

  print(circle.calculateArea()); // 78.5
  print(square.calculateArea()); // 16

  // describe() is a NORMAL method with a body, inherited as-is by both
  circle.describe(); // "Area: 78.5"
  square.describe(); // "Area: 16.0"

  // ============================================
  // Polymorphism through an abstract type — same idea as with inheritance
  // ============================================

  List<Shape> shapes = [circle, square, Triangle(6, 4)];

  for (var s in shapes) {
    print('Area: ${s.calculateArea()}');
  }

  // ============================================
  // ABSTRACT CLASS with SOME concrete + SOME abstract methods
  // Shape above already does this: calculateArea() is abstract,
  // describe() is a normal method shared by everyone
  // ============================================

  // ============================================
  // INTERFACES — in Dart, ANY class can be used as an interface
  // via `implements`. Unlike `extends`, `implements` does NOT inherit
  // behavior — it only inherits the "contract" (the method signatures).
  // Every method must be re-implemented from scratch.
  // ============================================

  var bird = Bird();
  var plane = Plane();

  bird.fly(); // "Bird is flying"
  plane.fly(); // "Plane is flying" — completely separate implementation

  // ============================================
  // A class can implement MULTIPLE interfaces at once
  // (but can only extend ONE class)
  // ============================================

  var duck = Duck();
  duck.fly(); // from Flyable
  duck.swim(); // from Swimmable

  // ============================================
  // extends vs implements — the key difference
  // ============================================

  // extends: inherits behavior AND can override selectively
  // implements: inherits ONLY the method signatures, must implement everything

  // ============================================
  // ABSTRACT CLASS AS A CONTRACT — the pattern BLoC is built on
  // Events and States are typically abstract classes, with concrete
  // subclasses representing each specific case
  // ============================================

  CounterEvent event1 = IncrementEvent();
  CounterEvent event2 = DecrementEvent();

  handleEvent(event1); // "Incrementing..."
  handleEvent(event2); // "Decrementing..."
}

// ============================================
// ABSTRACT CLASSES
// ============================================

abstract class Shape {
  // abstract method — no body, every subclass MUST provide one
  double calculateArea();

  // a NORMAL method with a body — shared by all subclasses as-is,
  // can still be overridden if needed, but doesn't have to be
  void describe() {
    print('Area: ${calculateArea()}');
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double calculateArea() => 3.14 * radius * radius;
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double calculateArea() => side * side;
}

class Triangle extends Shape {
  double base, height;
  Triangle(this.base, this.height);

  @override
  double calculateArea() => 0.5 * base * height;
}

// ============================================
// INTERFACES via `implements`
// In Dart, a plain class works fine as an interface definition
// ============================================

class Flyable {
  void fly() {
    print('Flying'); // this default body is IGNORED when implemented,
    // implements only borrows the method signature, not the code
  }
}

class Swimmable {
  void swim() {
    print('Swimming');
  }
}

class Bird implements Flyable {
  @override
  void fly() {
    print('Bird is flying');
  }
}

class Plane implements Flyable {
  @override
  void fly() {
    print('Plane is flying');
  }
}

// implementing multiple interfaces at once — comma-separated
class Duck implements Flyable, Swimmable {
  @override
  void fly() {
    print('Duck is flying');
  }

  @override
  void swim() {
    print('Duck is swimming');
  }
}

// ============================================
// THE BLOC-STYLE PATTERN — abstract class as a contract for
// events/states, with each concrete case as its own small class
// ============================================

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

void handleEvent(CounterEvent event) {
  if (event is IncrementEvent) {
    print('Incrementing...');
  } else if (event is DecrementEvent) {
    print('Decrementing...');
  }
}