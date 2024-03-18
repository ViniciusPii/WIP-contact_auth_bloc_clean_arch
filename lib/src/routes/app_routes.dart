import 'package:contact_auth_bloc/src/presentation/authentication/authentication_page.dart';
import 'package:contact_auth_bloc/src/presentation/home/home_page.dart';
import 'package:contact_auth_bloc/src/presentation/login/login_page.dart';
import 'package:contact_auth_bloc/src/presentation/welcome/welcome_page.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  AppRoutes._();

  static String home = '/home';
  static String login = '/login';
  static String welcome = '/welcome';
  static String authentication = "/authentication";

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    welcome: (context) => const WelcomePage(),
    authentication: (context) => const AuthenticationPage(),
  };
}
