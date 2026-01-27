import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/utils/snack_bar_message_service.dart';

void main() {
  testWidgets(
    'FlutterSnackBarMessageService should show SnackBar with correct message',
        (WidgetTester tester) async {
      final service = FlutterSnackBarMessageService();
      const message = 'Hello SnackBar';

      late BuildContext context;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (ctx) {
                context = ctx;
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      // Act
      service.showSnackBarMessage(context, message);

      // allow snack bar animation
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Assert
      expect(find.text(message), findsOneWidget);
    },
  );
}
