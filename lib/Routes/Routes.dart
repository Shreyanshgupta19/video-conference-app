
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Ui/HomePage.dart';
import '../Ui/JoinWithCodePage.dart';
import '../Ui/NewMeetingsPage.dart';
import '../Ui/VideoCallPage.dart';

class Routes {
  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case '/HomePage':
        return MaterialPageRoute(builder: (context) => const HomePage());

      case '/JoinWithCodePage':
        return MaterialPageRoute(builder: (context) => const JoinWithCodePage());

      case '/NewMeetingsPage':
        return MaterialPageRoute(builder: (context) =>  NewMeetingsPage());

      // case '/VideoCallPage':
      //   return MaterialPageRoute(builder: (context) => VideoCallPage());


      default:
        return null;
    }
  }
}


