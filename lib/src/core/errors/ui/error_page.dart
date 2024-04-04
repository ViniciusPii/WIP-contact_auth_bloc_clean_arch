import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/loader_component.dart';
import 'package:flutter/material.dart';

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppDimension.large,
                  ),
                  Icon(
                    Icons.warning_amber_rounded,
                    size: AppDimension.big,
                  ),
                  SizedBox(
                    height: AppDimension.large,
                  ),
                  AppTitle(
                    title: 'Ops! Algo deu errado!',
                  ),
                  SizedBox(
                    height: AppDimension.large,
                  ),
                  AppLabel(
                    label:
                        'Não se preocupe! As vezes erros acontecem, tente novamente e se persistir o erro, tente novamente mais tarde!',
                    isCenter: false,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppDimension.large),
                child: LoaderComponent(
                  loading: _isLoading,
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
                    child: const Text('Tentar novamente'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
