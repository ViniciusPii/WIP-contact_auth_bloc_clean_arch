import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/presentation/profile/controller/profile_cubit.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseBlocState<ProfilePage, ProfileCubit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SpacingPage(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => controller.signOut(),
                child: const Text('Deslogar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
