import 'package:contact_auth_bloc/src/presentation/login/login_page.dart';
import 'package:contact_auth_bloc/src/presentation/welcome/welcome_page.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  AppRoutes._();

  static String login = '/login';
  static String welcome = '/welcome';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    welcome: (context) => const WelcomePage(),
  };
}
