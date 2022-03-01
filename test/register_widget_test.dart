import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_review/screens/auth/register_screen.dart';
import 'package:movie_review/widgets/custom_button.dart';
import 'package:movie_review/widgets/input_box.dart';

void main() {
  testWidgets('register form test', (WidgetTester tester) async {
    final inputFields = find.byType(InputBox);
    final customButton = find.byType(CustomButton);
    final iconButton = find.byType(IconButton);
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

    expect(inputFields, findsNWidgets(4));
    expect(customButton, findsOneWidget);
    expect(iconButton, findsOneWidget);
  });
}
