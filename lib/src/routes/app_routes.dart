import 'package:contact_auth_bloc/src/presentation/authentication/authentication_page.dart';
import 'package:contact_auth_bloc/src/presentation/home/home_page.dart';
import 'package:contact_auth_bloc/src/presentation/login/login_page.dart';
import 'package:contact_auth_bloc/src/presentation/navigation/navigation_page.dart';
import 'package:contact_auth_bloc/src/presentation/profile/profile_page.dart';
import 'package:contact_auth_bloc/src/presentation/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static String home = '/home';
  static String login = '/login';
  static String profile = '/profile';
  static String welcome = '/welcome';
  static String authentication = "/authentication";
  static String navigationPage = '/navigation/page';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    profile: (context) => const ProfilePage(),
    welcome: (context) => const WelcomePage(),
    navigationPage: (context) => const NavigationPage(),
    authentication: (context) => const AuthenticationPage(),
  };
}

extension RouteGetter on BuildContext {
  Widget route(String routeName) {
    return AppRoutes.routes[routeName]!(this);
  }
}
