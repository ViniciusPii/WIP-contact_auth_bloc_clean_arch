import 'package:contact_auth_bloc/src/core/errors/ui/error_page.dart';
import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/authentication/controller/authentication_cubit.dart';
import 'package:contact_auth_bloc/src/features/auth/presentation/authentication/controller/authentication_state.dart';
import 'package:contact_auth_bloc/src/routes/app_routes.dart';
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
          AuthenticationStateInitial() => context.route(AppRoutes.welcome),
          AuthenticationStateAuthUnauthenticated() => context.route(AppRoutes.login),
          AuthenticationStateAuthAuthenticated() => context.route(AppRoutes.main),
          AuthenticationStateError() => ErrorPage(retryAction: () => controller.isLoggedIn()),
        };
      },
    );
  }
}
