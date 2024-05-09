// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:birthday_type_calculator/birthday_type_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    DateTime birthday = DateTime(1970, 01, 20);

    var nearestAge = BirthDayTypeCalculator().calculateAge(birthday, "NEAREST");
    var lastAge = BirthDayTypeCalculator().calculateAge(birthday, "LAST");
    var next = BirthDayTypeCalculator().calculateAge(birthday, "NEXT");
    print('Last Age $lastAge');
    print('Nearest Age $nearestAge');
    print('Next Age $next');
  });
}
