
// ============================================
// CLASS DEFINITIONS
// ============================================

class Animal {
  String name;

  Animal(this.name);

  void makeSound() {
    print('$name makes a sound');
  }

  void eat() {
    print('$name is eating');
  }
}

// Dog extends Animal — inherits `name`, `eat()`, and overrides `makeSound()`
class Dog extends Animal {
  Dog(String name) : super(name); // must call the parent constructor

  @override
  void makeSound() {
    print('$name barks');
  }
}

// Cat has an extra field of its own (color) in addition to what it inherits
class Cat extends Animal {
  String color;

  Cat(String name, this.color) : super(name);

  @override
  void makeSound() {
    super.makeSound(); // runs Animal's original version first...
    print('...then $name (a $color cat) meows'); // ...then adds its own behavior
  }
}

// Multi-level inheritance: Puppy extends Dog, which extends Animal
class Puppy extends Dog {
  Puppy(String name) : super(name);

  void play() {
    print('$name is playing'); // a method unique to Puppy only
  }
  // makeSound() is NOT overridden here, so Puppy uses Dog's version
}

// Overriding again while still using the parent's (Dog's) behavior via super
class LoudDog extends Dog {
  LoudDog(String name) : super(name);

  @override
  void makeSound() {
    super.makeSound(); // runs Dog's "barks" behavior
    print('...really loudly!'); // then adds more on top
  }
}




void main() {
  // ============================================
  // BASIC INHERITANCE — extends
  // A child class gets all the fields and methods of its parent
  // ============================================

  var animal = Animal('Generic Animal');
  animal.makeSound(); // "Generic Animal makes a sound"

  var dog = Dog('Rex');
  dog.makeSound(); // "Rex barks" — overridden behavior

  // the child class also has everything the parent has
  dog.eat(); // inherited method, not redefined in Dog

  // ============================================
  // super — calling the parent's constructor or methods
  // ============================================

  var cat = Cat('Whiskers', 'Black');
  cat.makeSound(); // uses super to also run the parent's version

  // ============================================
  // @override — required (by convention) when replacing a parent method
  // Dart doesn't force @override, but it catches mistakes at compile time
  // if the signature doesn't actually match anything in the parent
  // ============================================

  // (see Dog.makeSound() and Cat.makeSound() below for examples)

  // ============================================
  // MULTI-LEVEL INHERITANCE — A -> B -> C
  // A class can inherit from a class that itself inherits from another
  // ============================================

  var puppy = Puppy('Buddy');
  puppy.makeSound(); // inherited all the way from Animal, overridden in Dog
  puppy.play(); // defined only in Puppy

  // ============================================
  // POLYMORPHISM — treating different subclasses through their shared parent type
  // This is the real power of inheritance
  // ============================================

  List<Animal> animals = [
    Animal('Generic'),
    Dog('Rex'),
    Cat('Whiskers', 'Black'),
    Puppy('Buddy'),
  ];

  for (var a in animals) {
    a.makeSound(); // each one runs ITS OWN version, automatically
  }

  // ============================================
  // Checking the actual runtime type of an object
  // ============================================

  for (var a in animals) {
    if (a is Dog) {
      print('${a.name} is a Dog');
    } else if (a is Cat) {
      print('${a.name} is a Cat');
    } else {
      print('${a.name} is just an Animal');
    }
  }

  // ============================================
  // Accessing a parent field/method explicitly with super
  // even after overriding it
  // ============================================

  var loudDog = LoudDog('Max');
  loudDog.makeSound(); // calls Dog's bark AND adds something extra
}
