import 'package:contact_auth_bloc/src/features/auth/presentation/authentication/authentication_page.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/login/login_page.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/welcome/welcome_page.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/add_contact/add_contact_page.dart';
import 'package:contact_auth_bloc/src/features/contact/presentation/main/main_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static String main = '/main';
  static String login = '/login';
  static String welcome = '/welcome';
  static String addContact = '/add/coctact';
  static String authentication = "/authentication";

  static Map<String, WidgetBuilder> routes = {
    main: (context) => const MainPage(),
    login: (context) => const LoginPage(),
    welcome: (context) => const WelcomePage(),
    addContact: (context) => const AddContactPage(),
    authentication: (context) => const AuthenticationPage(),
  };
}

extension RouteGetter on BuildContext {
  Widget route(String routeName) {
    return AppRoutes.routes[routeName]!(this);
  }
}
