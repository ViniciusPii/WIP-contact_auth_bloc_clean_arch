import 'package:contact_auth_bloc/src/core/errors/ui/error_page.dart';
import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/core/ui/components/three_bounce_component.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/home/controller/home_state.dart';
import 'package:contact_auth_bloc/src/presentation/home/widgets/contact_card.dart';
import 'package:contact_auth_bloc/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
    widget.controller.getHomeData();
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

        if (state is HomeStateError) {
          return ErrorPage(retryAction: () => widget.controller.getHomeData());
        }

        if (state is HomeStateSucces) {
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
                    AppTitle(title: state.user.name),
                    state.contacts.isEmpty
                        ? _buildContactEmpty()
                        : _buildContactData(state.contacts),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.addContact),
              child: const Icon(Icons.add),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildContactData(List<ContactEntity> contacts) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppDimension.jumbo,
          ),
          const AppTitle(title: 'Confira seus contatos!'),
          const SizedBox(
            height: AppDimension.large,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final ContactEntity contact = contacts[index];

              return ContactCard(
                contact: contact,
                deleteAction: () => widget.controller.deleteContact(contact),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactEmpty() {
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/empty.svg',
                width: 350,
                height: 350,
              ),
              const SizedBox(
                height: AppDimension.medium,
              ),
              const AppTitle(title: 'Nada por aqui!'),
              const SizedBox(
                height: AppDimension.medium,
              ),
              const AppLabel(
                label:
                    'Não se preocupe! Assim que você cadastrar o seu primeiro contato, logo ele aparecerá por aqui!',
              )
            ],
          ),
        ),
      ),
    );
  }
}
