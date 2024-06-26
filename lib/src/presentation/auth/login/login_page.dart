import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/loader_component.dart';
import 'package:contact_auth_bloc/src/core/ui/components/snack_bar/snack_bar_component.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/presentation/auth/login/controller/login_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/auth/login/controller/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseBlocState<LoginPage, LoginCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpacingPage(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/login.svg',
              height: 320,
            ),
            const SizedBox(
              height: AppDimension.large,
            ),
            const AppTitle(
              title: 'Bem vindo ao nosso App!',
            ),
            const SizedBox(
              height: AppDimension.medium,
            ),
            const AppLabel(
              label:
                  'Que legal ter você por aqui! Faça seu login utilizando o Google, é rápido, prático, seguro e você poderá desfrutar do nosso app!',
            ),
            const SizedBox(
              height: AppDimension.big,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              bloc: controller,
              listener: (context, state) {
                if (state is LoginErrorState) {
                  return SnackBarComponent.error(
                    context,
                    message: state.message,
                  );
                }

                if (state is LoginNetworkErrorState) {
                  return SnackBarComponent.info(
                    context,
                    message: state.message,
                  );
                }
              },
              builder: (context, state) {
                return LoaderComponent(
                  loading: state is LoginLoadingState,
                  child: ElevatedButton(
                    onPressed: () => controller.signInWithGoogle(),
                    child: const Text('Faça seu Login'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
