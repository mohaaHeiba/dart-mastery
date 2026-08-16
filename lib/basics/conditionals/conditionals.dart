void main() {
  // ============================================
  // IF / ELSE — the basics
  // ============================================

  int age = 20;

  if (age >= 18) {
    print('Adult');
  } else {
    print('Minor');
  }

  // ============================================
  // ELSE IF — multiple conditions
  // Dart checks top to bottom and stops at the first true condition
  // ============================================

  int score = 75;

  if (score >= 90) {
    print('Grade A');
  } else if (score >= 80) {
    print('Grade B');
  } else if (score >= 70) {
    print('Grade C');
  } else {
    print('Grade F');
  }

  // ============================================
  // LOGICAL OPERATORS — &&, ||, !
  // ============================================

  int driverAge = 25;
  bool hasLicense = true;

  if (driverAge >= 18 && hasLicense) {
    print('Can drive'); // both conditions must be true
  }

  bool isRaining = false;
  if (driverAge < 18 || !isRaining) {
    print('Condition met'); // only one needs to be true
  }

  print(!isRaining); // true  ← ! flips the boolean value

  // ============================================
  // TERNARY OPERATOR (? :) — shorthand for simple if/else
  // Only use it for simple cases — use full if/else if the logic is complex
  // ============================================

  int checkAge = 20;
  String status = checkAge >= 18 ? 'Adult' : 'Minor';
  print(status); // "Adult"

  // ============================================
  // ?? — null-coalescing operator
  // "If this value is null, use this fallback instead"
  // ============================================

  String? nickname;
  String display = nickname ?? 'Guest';
  print(display); // "Guest"

  // ============================================
  // ??= — conditional assignment
  // Assigns a value ONLY if the variable is currently null
  // ============================================

  String? username;
  username ??= 'DefaultUser';
  print(username); // "DefaultUser"

  username ??= 'AnotherName';
  print(username); // still "DefaultUser" — it wasn't null anymore

  // ============================================
  // SWITCH — alternative to a long if/else if chain
  // Needs `break` after each case, or it "falls through" to the next one
  // ============================================

  String day = 'Monday';

  switch (day) {
    case 'Monday':
      print('Start of week');
      break;
    case 'Friday':
      print('Almost weekend');
      break;
    case 'Saturday':
    case 'Sunday':
      print('Weekend'); // same result for two different cases
      break;
    default:
      print('Regular day');
  }

  // ============================================
  // SWITCH EXPRESSION — modern Dart, shorter and cleaner
  // Returns a value directly, no break needed
  // ============================================

  String result = switch (day) {
    'Monday' => 'Start of week',
    'Friday' => 'Almost weekend',
    'Saturday' || 'Sunday' => 'Weekend',
    _ => 'Regular day', // _ acts like default
  };

  print(result);

  // ============================================
  // NULL CHECKS — different ways to handle possibly-null values
  // ============================================

  String? value;

  // the normal way
  if (value != null) {
    print(value.length);
  }

  // null-aware access — returns null instead of crashing if value is null
  print(value?.length);

  // null assertion (!) — tells Dart "I'm sure this isn't null"
  // ⚠️ dangerous: if it actually IS null, the app crashes
  // String certain = value!;

  // ============================================
  // IS / IS! — type checking
  // ============================================

  dynamic dynamicValue = 'Hello';

  if (dynamicValue is String) {
    // Dart automatically treats dynamicValue as a String inside this block
    print('It is a String, length: ${dynamicValue.length}');
  }

  if (dynamicValue is! int) {
    print('It is not an int');
  }
}