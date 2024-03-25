import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/core/ui/components/snack_bar/snack_bar_component.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/core/utils/masks.dart';
import 'package:contact_auth_bloc/src/presentation/add_contact/controller/add_contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends BaseBlocState<AddContactPage, AddContactCubit> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _phoneEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    _phoneEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicione um contato'),
      ),
      body: SpacingPage(
        child: Center(
          child: Form(
            key: _formKey,
            onChanged: () => _formKey.currentState?.validate() ?? false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _nameEC,
                  textCapitalization: TextCapitalization.sentences,
                  validator: Validatorless.required('Campo obrigatório'),
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Ex: Fulano',
                  ),
                ),
                const SizedBox(
                  height: AppDimension.large,
                ),
                TextFormField(
                  controller: _phoneEC,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [Masks.cepMask],
                  validator: Validatorless.multiple([
                    Validatorless.required('Campo obrigatório'),
                  ]),
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                    hintText: '(##) #####-####',
                  ),
                ),
                const SizedBox(
                  height: AppDimension.mega,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      SnackBarComponent.success(
                        context,
                        message: '${_nameEC.text} - ${Masks.cepMask.unMaskText(_phoneEC.text)}',
                      );
                    }
                  },
                  child: const Text('Adicionar contato'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
