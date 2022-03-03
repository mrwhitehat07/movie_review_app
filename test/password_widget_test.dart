import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_review/screens/form/change_password.dart';
import 'package:movie_review/widgets/custom_input_box.dart';

void main() {
  testWidgets('password change form test', (WidgetTester tester) async {
    final inputFields = find.byType(CustomInputBox);
    final column = find.byType(Column);
    final sizedBox = find.byType(SizedBox);
    await tester.pumpWidget(const MaterialApp(home: ChangePasswordScreen()));

    expect(inputFields, findsNWidgets(3));
    expect(sizedBox, findsNWidgets(12));
    expect(column, findsNWidgets(5));
  });
}
