import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/snack_bar/snack_bar_component.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseBlocState<HomePage, HomeCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: AppTitle(title: 'Home Page'),
        ),
      ),
      floatingActionButton: BlocConsumer<HomeCubit, HomeState>(
        bloc: controller,
        listener: (context, state) {
          if (state is HomeStateError) {
            return SnackBarComponent.error(context, message: state.message);
          }
        },
        builder: (context, state) {
          return FloatingActionButton(
            //TODO apagar após a pagina de detalhes
            onPressed: () => controller.signOut(),
            child: const Icon(Icons.logout_rounded),
          );
        },
      ),
    );
  }
}
