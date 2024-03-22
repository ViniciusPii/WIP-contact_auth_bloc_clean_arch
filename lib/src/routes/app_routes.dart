import 'package:contact_auth_bloc/src/presentation/authentication/authentication_page.dart';
import 'package:contact_auth_bloc/src/presentation/login/login_page.dart';
import 'package:contact_auth_bloc/src/presentation/main/main_page.dart';
import 'package:contact_auth_bloc/src/presentation/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static String main = '/main';
  static String login = '/login';
  static String welcome = '/welcome';
  static String authentication = "/authentication";

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    welcome: (context) => const WelcomePage(),
    main: (context) => const MainPage(),
    authentication: (context) => const AuthenticationPage(),
  };
}

extension RouteGetter on BuildContext {
  Widget route(String routeName) {
    return AppRoutes.routes[routeName]!(this);
  }
}
