import 'package:contact_auth_bloc/src/core/theme/infra/app_colors.dart';
import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/loader_component.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({
    super.key,
    required this.retryAction,
  });

  final Function() retryAction;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  static bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SpacingPage(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/error.svg',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(
                  height: AppDimension.large,
                ),
                const AppTitle(
                  title: 'Ops! Algo deu errado!',
                ),
                const SizedBox(
                  height: AppDimension.large,
                ),
                const AppLabel(
                  label:
                      'Não se preocupe! As vezes erros acontecem, tente novamente e se persistir o erro, tente novamente mais tarde!',
                ),
                const SizedBox(
                  height: AppDimension.big,
                ),
                LoaderComponent(
                  loading: _isLoading,
                  color: AppColors.neutral800,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        _isLoading = false;
                      });
                      widget.retryAction();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neutral800, // Altere para a cor desejada
                    ),
                    child: const Text('Tentar novamente'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
