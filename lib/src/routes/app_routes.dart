import 'package:contact_auth_bloc/src/presentation/welcome/welcome_page.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  AppRoutes._();

  static String welcome = '/welcome';

  static Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomePage(),
  };
}
