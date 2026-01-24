import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/utils/filed_focus_change_service.dart';
import 'package:learning/utils/flush_bar_message_service.dart';
import 'package:learning/utils/snack_bar_message_service.dart';
import 'package:learning/utils/toast_service.dart';
import 'package:learning/utils/utils.dart';
import 'package:mocktail/mocktail.dart';

class MockFieldFocusChangeService extends Mock
    implements FieldFocusChangeService {}

class MockFlushBarMessageService extends Mock
    implements FlushBarMessageService {}

class MockSnackBarMessageService extends Mock
    implements SnackBarMessageService {}
class MockToastService extends Mock implements ToastService{}


void main() {
  late MockFieldFocusChangeService mockService;
  late MockFlushBarMessageService mockFlushBarMessageService;
  late MockSnackBarMessageService mockSnackBarMessageService;
  late MockToastService mockToastService;

  testWidgets("Utils.fieldFocusChange should call service correctly", (
    tester,
  ) async
  {
    mockService = MockFieldFocusChangeService();
    Utils.fieldFocusChangeService = mockService;
    late BuildContext context;

    final currentFocus = FocusNode();
    final nextFocus = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (ctx) {
            context = ctx;
            return const Scaffold(body: SizedBox());
          },
        ),
      ),
    );

    Utils.fieldFocusChange(context, currentFocus, nextFocus);

    verify(
      () => mockService.fieldFocusChange(
        context: context,
        currentFocus: currentFocus,
        nextFocus: nextFocus,
      ),
    ).called(1);

    currentFocus.dispose();
    nextFocus.dispose();
  });

  group('FlushBar Message Service test', () {
    testWidgets('show flush bar message', (tester) async {
      mockFlushBarMessageService = MockFlushBarMessageService();
      Utils.flushBarMessageService = mockFlushBarMessageService;
      const title = 'Info';
      const message = 'This is a flush bar message';

      late BuildContext context;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (ctx) {
              context = ctx;
              return Scaffold();
            },
          ),
        ),
      );

      Utils.flushBarMessage(context, title, message);

      verify(
        () => mockFlushBarMessageService.showFlushBarMessage(
          context,
          title,
          message,
        ),
      ).called(1);
    });
  });

  group('Snack Bar Message Service test', () {
    testWidgets('show snack bar message', (tester) async {
      mockSnackBarMessageService = MockSnackBarMessageService();
      Utils.snackBarMessageService = mockSnackBarMessageService;
      const message = 'This is a snack bar message';

      late BuildContext context;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (ctx) {
              context = ctx;
              return Scaffold();
            },
          ),
        ),
      );

      Utils.snackBarMessage(context, message);

      verify(
        () => mockSnackBarMessageService.showSnackBarMessage(context, message),
      ).called(1);
    });
  });

  group('Toast Service test', (){
    test('show success toast', (){
      mockToastService = MockToastService();
      Utils.toastService = mockToastService;
      const message = 'Operation successful';
      Utils.showToast(message);
      verify(() => Utils.showToast(message)).called(1);
    });
  });
}
