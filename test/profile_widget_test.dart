import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_review/screens/navs/profile_screen.dart';
import 'package:movie_review/widgets/profille_tile.dart';

void main() {
  testWidgets('profile page test', (WidgetTester tester) async {
    final tile = find.byType(ProfileCardTile);
    final text = find.byType(Text);
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    expect(text, findsNWidgets(2));
    expect(tile, findsNothing);
  });
}
