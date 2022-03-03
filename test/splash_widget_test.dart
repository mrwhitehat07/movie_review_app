import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_review/screens/auth/register_screen.dart';

void main() {
  testWidgets('splash screen test', (WidgetTester tester) async {
    final center = find.byType(Center);
    final text = find.byType(Text);
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

    expect(center, findsOneWidget);
    expect(text, findsOneWidget);
  });
}
