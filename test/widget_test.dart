import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task1/main.dart';

void main() {
  testWidgets('search filters recipes by name and ingredients', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), 'linguine');
    await tester.pumpAndSettle();

    expect(find.text('Lemon Herb Pasta'), findsOneWidget);
    expect(find.text('Avocado Toast'), findsNothing);
  });

  testWidgets('category chips filter recipes', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.widgetWithText(ChoiceChip, 'Dinner'));
    await tester.pumpAndSettle();

    expect(find.text('Honey Glazed Salmon'), findsOneWidget);
    expect(find.text('Avocado Toast'), findsNothing);
  });

  testWidgets('favorites filter shows saved recipes', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Add to favorites').first);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Favorites'));
    await tester.pumpAndSettle();

    expect(find.text('Avocado Toast'), findsOneWidget);
    expect(find.text('Lemon Herb Pasta'), findsNothing);
  });

  testWidgets('selecting a recipe opens its details', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Lemon Herb Pasta'));
    await tester.tap(find.text('Lemon Herb Pasta'));
    await tester.pumpAndSettle();

    expect(find.text('Ingredients'), findsOneWidget);
    expect(find.text('250 g linguine'), findsOneWidget);
    expect(find.text('How to make it'), findsOneWidget);
  });
}
