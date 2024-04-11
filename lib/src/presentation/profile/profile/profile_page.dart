import 'package:contact_auth_bloc/src/core/errors/ui/error_page.dart';
import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/snack_bar/snack_bar_component.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/core/ui/components/three_bounce_component.dart';
import 'package:contact_auth_bloc/src/presentation/profile/profile/controller/profile_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/profile/profile/controller/profile_state.dart';
import 'package:contact_auth_bloc/src/presentation/profile/profile/widgets/profile_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.controller,
  });

  final ProfileCubit controller;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.controller.getUser();
  }

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SpacingPage(
        child: Scaffold(
          body: BlocConsumer<ProfileCubit, ProfileState>(
            bloc: widget.controller,
            listener: (context, state) {
              if (state is ProfileUpdateUserErrorState) {
                return SnackBarComponent.info(context, message: state.message);
              }

              if (state is ProfileUpdateUserSuccessState) {
                return SnackBarComponent.success(context, message: state.message);
              }
            },
            builder: (context, state) {
              if (state is ProfileUpdateUserLoadingState || state is ProfileSignOutLoadingState) {
                return const Center(
                  child: ThreeBounceComponent(),
                );
              }

              if (state is ProfileUserErrorState) {
                return ErrorPage(retryAction: () => widget.controller.getUser());
              }

              if (state is ProfileSignOutErrorState) {
                return ErrorPage(retryAction: () => widget.controller.signOut());
              }

              if (state is ProfileUserSuccessState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTitle(title: state.user.name),
                    const SizedBox(
                      height: AppDimension.small,
                    ),
                    AppLabel(label: state.user.email),
                    const SizedBox(
                      height: AppDimension.mega,
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => ProfileModalWidget(
                            formKey: _formKey,
                            controllerEC: _nameEC,
                            onChangeNameAction: () async {
                              Navigator.of(context).pop();
                              await widget.controller.updateUserName(_nameEC.text);
                              widget.controller.getUser();
                            },
                          ),
                        ),
                      },
                      child: const Text('Alterar dados'),
                    ),
                    TextButton(
                      onPressed: () => widget.controller.signOut(),
                      child: const Text('Deslogar'),
                    )
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
