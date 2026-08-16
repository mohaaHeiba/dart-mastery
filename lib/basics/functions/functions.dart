void main() {
  // ============================================
  // BASIC FUNCTION — with parameters and a return type
  // ============================================

  print(add(5, 3)); // 8

  // ============================================
  // VOID FUNCTION — doesn't return anything, just performs an action
  // ============================================

  greet('Ahmed');

  // ============================================
  // OPTIONAL POSITIONAL PARAMETERS — wrapped in [ ]
  // Can be skipped when calling the function
  // ============================================

  print(describePerson('Sara')); // "Sara"
  print(describePerson('Sara', 22)); // "Sara, 22"

  // ============================================
  // NAMED PARAMETERS — wrapped in { }
  // Called using name: value — order doesn't matter, and it's more readable
  // ============================================

  print(createUser(name: 'Omar', age: 30));
  print(createUser(name: 'Omar', age: 30));
  print(createUser(age: 25, name: 'Youssef')); // order doesn't matter here

  // ============================================
  // DEFAULT VALUES — used automatically if the argument is omitted
  // Works with both optional positional [] and named {} parameters
  // ============================================

  print(power(2)); // 4   ← exponent defaults to 2
  print(power(2, 3)); // 8   ← exponent explicitly given

  // ============================================
  // REQUIRED NAMED PARAMETERS — named, but still mandatory
  // ============================================

  print(divide(dividend: 10, divisor: 2)); // 5.0

  // ============================================
  // ARROW FUNCTIONS (=>) — shorthand for a function with a single expression
  // Same as writing `{ return expression; }`
  // ============================================

  print(square(4)); // 16

  // ============================================
  // ANONYMOUS FUNCTIONS — functions without a name, often passed inline
  // Very common with List methods like map(), where(), forEach()
  // ============================================

  List<int> numbers = [1, 2, 3, 4, 5];

  List<int> doubled = numbers.map((n) {
    return n * 2;
  }).toList();
  print(doubled); // [2, 4, 6, 8, 10]

  // same thing, but shorter using an arrow function
  List<int> tripled = numbers.map((n) => n * 3).toList();
  print(tripled); // [3, 6, 9, 12, 15]

  // ============================================
  // HIGHER-ORDER FUNCTIONS — a function that takes another function
  // as a parameter, or returns one
  // ============================================

  print(applyOperation(5, 3, add)); // 8  ← passing the `add` function itself
  print(applyOperation(5, 3, multiply)); // 15

  // passing an anonymous function directly
  print(applyOperation(5, 3, (a, b) => a - b)); // 2

  // ============================================
  // FUNCTION THAT RETURNS A FUNCTION
  // ============================================

  var multiplyBy3 = makeMultiplier(3);
  print(multiplyBy3(10)); // 30

  // ============================================
  // RECURSIVE FUNCTION — a function that calls itself
  // ============================================

  print(factorial(5)); // 120
}

// ============================================
// FUNCTION DEFINITIONS
// ============================================

// basic function: takes two ints, returns an int
int add(int a, int b) {
  return a + b;
}

int multiply(int a, int b) {
  return a * b;
}

// void function: performs an action, returns nothing
void greet(String name) {
  print('Hello, $name!');
}

// optional positional parameter — age is optional, wrapped in [ ]
String describePerson(String name, [int? age]) {
  if (age != null) {
    return '$name, $age';
  }
  return name;
}

// named parameters — both optional here since they have no `required` keyword
String createUser({String? name, int? age}) {
  return 'User: $name, Age: $age';
}

// default value for an optional positional parameter
int power(int base, [int exponent = 2]) {
  int result = 1;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

// required named parameters — must be provided, even though they're named
double divide({required int dividend, required int divisor}) {
  return dividend / divisor;
}

// arrow function — shorthand for a single-expression function body
int square(int n) => n * n;

// higher-order function — takes a function as a parameter
// `int Function(int, int)` describes: a function taking two ints, returning an int
int applyOperation(int a, int b, int Function(int, int) operation) {
  return operation(a, b);
}

// function that returns another function (a closure)
Function(int) makeMultiplier(int factor) {
  return (int value) => value * factor;
}

// recursive function — calls itself until it reaches the base case
int factorial(int n) {
  if (n <= 1) return 1; // base case — stops the recursion
  return n * factorial(n - 1); // recursive case
}