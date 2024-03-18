import 'package:contact_auth_bloc/src/core/theme/app_theme.dart';
import 'package:contact_auth_bloc/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        routes: AppRoutes.routes,
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.authentication,
      ),
    );
  }
}
