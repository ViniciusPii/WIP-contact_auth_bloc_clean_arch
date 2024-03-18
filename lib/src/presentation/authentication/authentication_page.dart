import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/presentation/authentication/controller/authentication_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/authentication/controller/authentication_state.dart';
import 'package:contact_auth_bloc/src/presentation/home/home_page.dart';
import 'package:contact_auth_bloc/src/presentation/login/login_page.dart';
import 'package:contact_auth_bloc/src/presentation/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends BaseBlocState<AuthenticationPage, AuthenticationCubit> {
  @override
  void onReady(BuildContext context) {
    super.onReady(context);
    controller.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      bloc: controller,
      builder: (context, state) {
        return switch (state) {
          AuthenticationStateInitial() => const WelcomePage(),
          AuthenticationStateAuthAuthenticated() => const HomePage(),
          AuthenticationStateAuthUnauthenticated() => const LoginPage(),
        };
      },
    );
  }
}
