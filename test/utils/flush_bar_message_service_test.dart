import 'package:flutter/material.dart';
import 'package:learning/utils/flush_bar_message_service.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
  testWidgets('FlutterFlushBarMessageService should show the message', (tester) async{
    final service = FlutterFlushBarMessageService();
    const title = "Hello";
    const message = "message";

    late BuildContext context;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (ctx){
            context = ctx;
            return const SizedBox();
          },),
        ),
      )
    );

    service.showFlushBarMessage(context, title, message);

    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.text(title), findsOneWidget);
  });

}