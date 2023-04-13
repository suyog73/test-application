import 'package:flutter/material.dart';

import '../screens/auth_screens/login_screen.dart';
import '../screens/auth_screens/signup_screen.dart';
import '../screens/fetching_data.dart';
import '../screens/home_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;

    print(routeSettings.name);
    switch (routeSettings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      // case AllProject.route:
      //   return MaterialPageRoute(builder: (_) => AllProject());
      case LoginScreen.route:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case SignUpScreen.route:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      // case ProfileSetup.route:
      //   return MaterialPageRoute(builder: (_) => ProfileSetup());

      // case ProjectDetail.route:
      //   if (args is ProjectCardModel) {
      //     return MaterialPageRoute(
      //         builder: (_) => ProjectDetail(projectCardModel: args));
      //   }
      //   break;

      // case GetUserData.route:
      //   return MaterialPageRoute(builder: (_) => GetUserData());

      // case UserProfile.route:
      //   if (args is String) {
      //     return MaterialPageRoute(
      //       builder: (_) => UserProfile(uid: args),
      //     );
      //   }
      //   break;

      case FetchingData.route:
        return MaterialPageRoute(builder: (_) => FetchingData());

      default:
        return _errorRoute();
    }

    return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(child: Text("ERROR")),
      );
    },
  );
}
