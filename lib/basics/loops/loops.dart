void main() {
  // ============================================
  // FOR LOOP — use when you know how many times to repeat
  // Structure: (start; condition; step)
  // ============================================

  for (int i = 0; i < 5; i++) {
    print('for loop: $i'); // 0, 1, 2, 3, 4
  }

  // counting backwards
  for (int i = 5; i > 0; i--) {
    print('countdown: $i'); // 5, 4, 3, 2, 1
  }

  // stepping by more than 1
  for (int i = 0; i <= 10; i += 2) {
    print('even: $i'); // 0, 2, 4, 6, 8, 10
  }

  // ============================================
  // FOR-IN LOOP — walks through every element of a collection
  // No manual index handling needed
  // ============================================

  List<String> names = ['Ahmed', 'Sara', 'Omar'];

  for (var name in names) {
    print('Hello, $name');
  }

  // works on Sets and Map entries too
  Map<String, int> ages = {'Ahmed': 25, 'Sara': 22};

  for (var entry in ages.entries) {
    print('${entry.key} is ${entry.value} years old');
  }

  // if you DO need the index while looping a List, use .asMap()
  for (var entry in names.asMap().entries) {
    print('Index ${entry.key}: ${entry.value}');
  }

  // ============================================
  // WHILE LOOP — checks the condition BEFORE running the body
  // If the condition is false from the start, the body never runs
  // Use when you don't know exactly how many iterations you need
  // ============================================

  int count = 0;
  while (count < 5) {
    print('while: $count');
    count++;
  }

  // example: a condition never met from the start — body is skipped entirely
  int x = 10;
  while (x < 5) {
    print('this will never print');
  }

  // ============================================
  // DO-WHILE LOOP — checks the condition AFTER running the body
  // Guarantees the body runs at least once, even if the condition is false
  // ============================================

  int y = 10;
  do {
    print('do-while runs once even though condition is false: $y');
  } while (y < 5);

  int z = 0;
  do {
    print('do-while normal: $z');
    z++;
  } while (z < 5);

  // ============================================
  // BREAK — exits the loop completely
  // ============================================

  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      break; // stops the loop entirely once i reaches 5
    }
    print('break example: $i'); // prints 0,1,2,3,4 then stops
  }

  // ============================================
  // CONTINUE — skips the current iteration only, loop keeps going
  // ============================================

  for (int i = 0; i < 10; i++) {
    if (i.isOdd) {
      continue; // skips printing for odd numbers
    }
    print('continue example (evens only): $i'); // 0,2,4,6,8
  }

  // ============================================
  // NESTED LOOPS — a loop inside another loop
  // Common in grid/table problems
  // ============================================

  for (int row = 1; row <= 3; row++) {
    for (int col = 1; col <= 3; col++) {
      print('row $row, col $col');
    }
  }

  // ============================================
  // LABELED BREAK — break out of an OUTER loop from inside a nested one
  // Rarely needed, but useful to know
  // ============================================

  outerLoop:
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (j == 1) {
        break outerLoop; // stops BOTH loops, not just the inner one
      }
      print('labeled: i=$i, j=$j');
    }
  }
}