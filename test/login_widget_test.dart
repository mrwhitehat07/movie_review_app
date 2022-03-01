import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_review/screens/auth/login_screen.dart';
import 'package:movie_review/widgets/custom_button.dart';
import 'package:movie_review/widgets/input_box.dart';

void main() {
  testWidgets('login form test', (WidgetTester tester) async {
    final inputFields = find.byType(InputBox);
    final customButton = find.byType(CustomButton);
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    expect(inputFields, findsNWidgets(2));
    expect(customButton, findsOneWidget);
  });
}
