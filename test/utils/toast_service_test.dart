import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning/utils/toast_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('fluttertoast');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall call) async {
      expect(call.method, 'showToast');
      expect(call.arguments['msg'], 'Hello Toast');
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('FlutterToastService should call fluttertoast platform channel', () {
    final service = FlutterToastService();

    service.showToast('Hello Toast');
  });
}
