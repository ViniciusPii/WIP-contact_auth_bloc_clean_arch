import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/loader_component.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/presentation/profile/controller/profile_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/profile/controller/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileModalWidget extends StatelessWidget {
  const ProfileModalWidget({
    super.key,
    required this.bloc,
    required this.formKey,
    required this.controllerEC,
    required this.onChangeNameAction,
  });

  final ProfileCubit bloc;
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
                  ),
                  const SizedBox(
                    height: AppDimension.large,
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return LoaderComponent(
                        loading: state is ProfileStateUpdateUserLoading,
                        child: ElevatedButton(
                          onPressed: onChangeNameAction,
                          child: const Text('Alterar'),
                        ),
                      );
                    },
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
