import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/presentation/welcome/controller/welcome_cubit.dart';
import 'package:contact_auth_bloc/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends BaseBlocState<WelcomePage, WelcomeCubit> {
  //TODO apagar após a validação do usuário
  @override
  void onReady(BuildContext context) async {
    super.onReady(context);
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/welcome.svg',
          height: 350,
          width: 350,
        ),
      ),
    );
  }
}
