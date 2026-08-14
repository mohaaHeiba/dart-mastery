import 'dart:math';

void main() {
  // ============================================
  // INT — whole numbers (no decimal point)
  // ============================================

  int age = 25;
  int iNegative = -10;
  int zero = 0;

  int a = 10;
  int b = 3;

  print(a + b); // 13
  print(a - b); // 7
  print(a * b); // 30
  print(a ~/ b); // 3      ← integer division (drops the remainder)
  print(a % b); // 1      ← modulo (the remainder itself)
  print(a / b); // 3.333... ← normal division ALWAYS returns a double,
  //            even when dividing two ints

  // ============================================
  // DOUBLE — decimal numbers
  // ============================================

  double pi = 3.14;
  double e = 2.71;
  double dNegative = -0.5;

  print(pi + e); // 5.85

  // ============================================
  // CONVERTING between int <-> double
  // ============================================

  int x = 10;
  double y = x.toDouble(); // 10.0

  double z = 9.9;
  int zInt = z.toInt(); // 9   ← toInt() just CUTS the decimal part, doesn't round!

  // These 4 look similar but behave differently — this is a common bug source:
  int rounded = 9.9.round(); // 10  ← rounds to the nearest whole number
  int floored = 9.9.floor(); // 9   ← always rounds DOWN
  int ceiled = 9.1.ceil(); // 10  ← always rounds UP
  int truncated = 9.9.truncate(); // 9   ← same as toInt(), just chops the decimal

  // ============================================
  // NUM — the parent type of both int and double
  // Use it only when a value could be either one (e.g. a generic function)
  // ============================================

  num n1 = 10; // holds an int
  num n2 = 10.5; // holds a double
  // Prefer int/double directly in normal variables — num gives up
  // compile-time safety (you lose the guarantee that a value stays whole)

  // ============================================
  // USEFUL INT METHODS
  // ============================================

  int num1 = -7;

  print(num1.abs()); // 7     ← absolute value (removes the sign)
  print(num1.isNegative); // true
  print(num1.sign); // -1    ← returns 1, -1, or 0 depending on the sign

  int num2 = 8;
  print(num2.isEven); // true
  print(num2.isOdd); // false

  // clamp(min, max) — forces a value to stay within a range
  int score = 150;
  print(score.clamp(0, 100)); // 100  ← capped at the max

  // ============================================
  // USEFUL DOUBLE METHODS
  // ============================================

  double price = 19.999;

  print(price.toStringAsFixed(2)); // "20.00" ← rounds AND formats as text,
  //     great for displaying prices to users
  print(price.toStringAsPrecision(3)); // "20.0" ← total number of significant digits

  double invalidValue = 0 / 0;
  print(invalidValue.isNaN); // true  ← "Not a Number" (invalid math result)

  double infinite = 1 / 0;
  print(infinite.isInfinite); // true

  // ============================================
  // PARSING — converting String -> number
  // Very common when handling user input or API data
  // ============================================

  String numberText = '42';
  int parsed = int.parse(numberText); // 42
  double parsedD = double.parse('3.14'); // 3.14

  // parse() CRASHES the app if the text isn't a valid number.
  // tryParse() is the safe version — returns null instead of crashing.
  String invalidText = 'abc';
  int? safeParsed = int.tryParse(invalidText); // null, no crash

  print(safeParsed ?? 'Invalid number'); // "Invalid number" (fallback value)

  // ============================================
  // MATH FUNCTIONS — require `import 'dart:math'`
  // ============================================

  print(sqrt(16)); // 4.0   ← square root
  print(pow(2, 3)); // 8     ← 2 to the power of 3
  print(max(10, 20)); // 20
  print(min(10, 20)); // 10

  // ============================================
  // COMPARING numbers
  // ============================================

  int x1 = 5;
  int x2 = 10;

  print(x1.compareTo(x2)); // -1  ← negative means x1 is smaller
  print(x2.compareTo(x1)); //  1  ← positive means x2 is bigger
  print(x1.compareTo(x1)); //  0  ← equal

  // ============================================
  // STRING — text
  // ============================================

  String name = 'Ahmed';
  String message = "Hello, World!"; // single or double quotes both work

  int myAge = 22;
  print('$name is $myAge years old'); // $variable inserts its value directly
  print('Next year: ${myAge + 1}'); // ${expression} works for any expression

  // triple quotes let a string span multiple lines
  String multiLine = '''
  Line one
  Line two
  ''';

  // ============================================
  // BOOL — only true or false
  // ============================================

  bool isLoggedIn = true;
  bool isAdmin = false;

  // ============================================
  // VAR — type is inferred once, from the first value
  // ============================================

  var city = 'Cairo'; // Dart infers this as String forever
  var year = 2026; // Dart infers this as int forever
  // city = 100;     // ❌ would be an error — the type can't change after inference

  // ============================================
  // FINAL vs CONST — the difference that trips people up most
  // ============================================

  // FINAL: value is set only ONCE, but it's resolved at RUNTIME.
  // Use it when the value depends on something that happens while the app runs
  // (like the current time, a calculation, or data coming from the user/API).
  final DateTime now = DateTime.now();
  // now = DateTime.now(); // ❌ error — can't reassign a final variable

  // CONST: value must be known at COMPILE TIME — before the app even runs.
  // Use it for values that are truly fixed and never depend on runtime data.
  const double appPi = 3.14159;
  // const DateTime now2 = DateTime.now(); // ❌ error — DateTime.now() isn't
  // known until the app actually runs, so it can NEVER be const

  // Rule of thumb:
  // - Value fixed and known while writing the code   → const
  // - Value fixed but only known once the app runs    → final
  // - Value that might change later                   → var (or a plain type)

  // ============================================
  // NULLABLE variables (the `?`)
  // ============================================

  String? nickname; // the `?` means this variable is allowed to be null
  print(nickname ?? 'No name'); // ?? provides a fallback if the value is null

  // ============================================
  // DYNAMIC — type can change at runtime (use sparingly)
  // ============================================

  dynamic value = 'hello'; // starts as a String
  value = 42; // ✅ allowed — dynamic gives up type safety entirely
  // Prefer var/final/explicit types whenever possible; dynamic should be
  // a deliberate choice, not a default.
}