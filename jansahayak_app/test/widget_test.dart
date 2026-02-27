import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jansahayak_app/screens/login_page.dart';

void main() {
  testWidgets('LoginPage has a title and a form', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that the title is present
    expect(find.text('Login'), findsOneWidget);

    // Verify that the form fields are present
    expect(find.byType(TextFormField), findsNWidgets(3)); // Assuming 3 fields for age, occupation, and income
    expect(find.byType(DropdownButton), findsOneWidget); // Assuming one dropdown for gender
  });

  testWidgets('Form validation works', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Enter invalid data
    await tester.enterText(find.byType(TextFormField).first, ''); // Age field
    await tester.tap(find.byType(ElevatedButton)); // Assuming there's a submit button
    await tester.pump();

    // Verify that an error message is shown
    expect(find.text('Please enter your age'), findsOneWidget);
  });
}