import 'package:flutter/material.dart';
import 'package:learning/utils/routes/routes.dart';
import 'package:learning/utils/routes/routes_name.dart';
import 'package:learning/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutesName.register,
          onGenerateRoute: Routes.generateRoute,
        )
    );
  }
}
