import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/core/ui/components/loader_component.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/core/utils/masks.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/presentation/add_contact/controller/add_contact_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/add_contact/controller/add_contact_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  inputFormatters: [Masks.phoneMask],
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
                BlocBuilder<AddContactCubit, AddContactState>(
                  bloc: controller,
                  builder: (context, state) {
                    return LoaderComponent(
                      loading: state is AddContactStateLoading,
                      child: ElevatedButton(
                        onPressed: () async {
                          final NavigatorState navigator = Navigator.of(context);

                          if (_formKey.currentState?.validate() ?? false) {
                            await controller.addContact(
                              ContactEntity(
                                name: _nameEC.text.trim(),
                                phoneNumber: _phoneEC.text.trim(),
                              ),
                            );

                            navigator.pop();
                          }
                        },
                        child: const Text('Adicionar contato'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
