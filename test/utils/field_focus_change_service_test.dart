import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/utils/filed_focus_change_service.dart';



void main() {
  late FieldFocusChangeService fieldFocusChangeService;

  setUp(() {
    fieldFocusChangeService = FlutterFieldFocusChangeService();
  });

  testWidgets('fieldFocusChange should unfocus current and focus next',
      (WidgetTester tester) async {
    final currentFocusNode = FocusNode();
    final nextFocusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              TextField(focusNode: currentFocusNode),
              TextField(focusNode: nextFocusNode),
            ],
          ),
        ),
      ),
    );

    // Focus the current field
    currentFocusNode.requestFocus();
    await tester.pumpAndSettle();
    expect(currentFocusNode.hasFocus, isTrue);
    expect(nextFocusNode.hasFocus, isFalse);

    // Use the service to change focus
    fieldFocusChangeService.fieldFocusChange(
      context: tester.element(find.byType(TextField).first),
      currentFocus: currentFocusNode,
      nextFocus: nextFocusNode,
    );
    await tester.pumpAndSettle();

    // Verify the focus has changed
    expect(currentFocusNode.hasFocus, isFalse);
    expect(nextFocusNode.hasFocus, isTrue);
  });
}
