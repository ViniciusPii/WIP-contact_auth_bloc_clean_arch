import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/snack_bar/snack_bar_component.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
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
  void onReady(BuildContext context) {
    super.onReady(context);
    controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
          bloc: controller,
          listener: (context, state) {
            if (state is HomeStateUserError) {
              return SnackBarComponent.error(context, message: state.message);
            }
          },
          builder: (context, state) {
            if (state is HomeStateUserSucces) {
              return SpacingPage(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppDimension.large,
                    ),
                    const AppLabel(label: 'Olá!'),
                    AppTitle(title: state.user.name)
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: BlocConsumer<HomeCubit, HomeState>(
        bloc: controller,
        listener: (context, state) {
          if (state is HomeStateUserError) {
            return SnackBarComponent.error(context, message: state.message);
          }
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () => {},
            child: const Icon(Icons.logout_rounded),
          );
        },
      ),
    );
  }
}
