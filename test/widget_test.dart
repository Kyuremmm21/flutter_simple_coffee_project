import 'package:coffee_flutter/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Splash screen opens the coffee shop', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('BREW & BEAN'), findsOneWidget);
    expect(find.text('BREWING YOUR EXPERIENCE'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
    expect(find.text('How would you like your coffee?'), findsOneWidget);
  });
}
