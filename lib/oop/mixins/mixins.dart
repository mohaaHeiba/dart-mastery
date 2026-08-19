void main() {
  // ============================================
  // BASIC MIXIN — adding behavior without using `extends`
  // ============================================

  var fish = Fish();
  fish.swim(); // behavior comes from the Swimmer mixin, not from a parent class

  // ============================================
  // A class can use MULTIPLE mixins at once with `with`
  // (unlike `extends`, which only allows ONE parent)
  // ============================================

  var duck = Duck();
  duck.swim(); // from Swimmer
  duck.fly(); // from Flyer
  duck.makeSound(); // its own method, not from any mixin

  // ============================================
  // extends + mixins TOGETHER — a class can have one parent
  // AND multiple mixins at the same time
  // ============================================

  var robot = RobotDog();
  robot.eat(); // inherited from Animal (extends)
  robot.swim(); // added by the Swimmer mixin (with)
  robot.charge(); // added by the Chargeable mixin (with)

  // ============================================
  // Mixins can have their OWN state (fields), not just methods
  // ============================================

  var athlete = Athlete();
  athlete.run();
  athlete.run();
  print('Total distance: ${athlete.totalDistance}'); // mixin kept track internally

  // ============================================
  // `on` — restricting which classes are allowed to use a mixin
  // Useful when the mixin's behavior only makes sense for certain base types
  // ============================================

  var car = Car();
  car.refuel(); // works — Car extends Vehicle, which Refuelable requires

  // var person = Person();
  // class Person with Refuelable {} //  would error — Person doesn't extend Vehicle
}

// ============================================
// BASIC MIXIN DEFINITION
// ============================================

mixin Swimmer {
  void swim() {
    print('Swimming');
  }
}

mixin Flyer {
  void fly() {
    print('Flying');
  }
}

// `with` adds the mixin's behavior into the class
class Fish with Swimmer {}

// ============================================
// MULTIPLE MIXINS at once — comma-separated after `with`
// ============================================

class Duck with Swimmer, Flyer {
  void makeSound() {
    print('Quack!');
  }
}

// ============================================
// extends (ONE parent) + with (MULTIPLE mixins) together
// ============================================

class Animal {
  void eat() {
    print('Eating');
  }
}

mixin Chargeable {
  void charge() {
    print('Charging battery');
  }
}

class RobotDog extends Animal with Swimmer, Chargeable {}

// ============================================
// MIXIN WITH ITS OWN STATE — mixins can hold fields too
// ============================================

mixin Runner {
  double totalDistance = 0;

  void run() {
    totalDistance += 5;
    print('Ran 5km, total: $totalDistance km');
  }
}

class Athlete with Runner {}

// ============================================
// `on` — restricts the mixin to only be usable by
// classes that extend a specific base class
// ============================================

class Vehicle {
  void drive() {
    print('Driving');
  }
}

mixin Refuelable on Vehicle {
  void refuel() {
    print('Refueling the vehicle');
    drive(); // can call methods from Vehicle because `on Vehicle` guarantees it exists
  }
}

class Car extends Vehicle with Refuelable {}