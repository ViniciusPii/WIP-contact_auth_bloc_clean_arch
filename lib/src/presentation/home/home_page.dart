import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/core/ui/components/three_bounce_component.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_state.dart';
import 'package:contact_auth_bloc/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.controller});

  final HomeCubit controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: widget.controller,
      builder: (context, state) {
        if (state is HomeStateLoading) {
          return const Center(
            child: ThreeBounceComponent(),
          );
        }

        if (state is HomeStateUserSucces) {
          return Scaffold(
            body: SafeArea(
              child: SpacingPage(
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
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(AppRoutes.addContact),
              },
              child: const Icon(Icons.add),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
