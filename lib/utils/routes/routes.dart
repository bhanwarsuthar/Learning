import 'package:flutter/material.dart';
import 'package:learning/utils/routes/routes_name.dart';

import '../../view/home_view.dart';
import '../../view/register_view.dart';

class Routes{

  static MaterialPageRoute generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.register:
        return MaterialPageRoute(builder: (context) => RegisterView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      // case '/':
      //   return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(
            builder: (_)=> Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            )
        );
    }
  }
}