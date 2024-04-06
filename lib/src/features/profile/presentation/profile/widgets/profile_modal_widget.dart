import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class ProfileModalWidget extends StatelessWidget {
  const ProfileModalWidget({
    super.key,
    required this.formKey,
    required this.controllerEC,
    required this.onChangeNameAction,
  });

  final GlobalKey<FormState> formKey;
  final Function() onChangeNameAction;
  final TextEditingController controllerEC;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: SizedBox(
          height: 300,
          child: Center(
            child: SpacingPage(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppTitle(title: 'Altere o seu nome de usuário!'),
                  const SizedBox(
                    height: AppDimension.large,
                  ),
                  TextFormField(
                    controller: controllerEC,
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                      hintText: 'Ex Fulano',
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    validator: Validatorless.required('Campo obrigatório!'),
                  ),
                  const SizedBox(
                    height: AppDimension.large,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bool isValid = formKey.currentState?.validate() ?? false;
                      if (isValid) {
                        onChangeNameAction();
                      }
                    },
                    child: const Text('Alterar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
