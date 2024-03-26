import 'package:contact_auth_bloc/src/core/theme/app_styles.dart';
import 'package:contact_auth_bloc/src/core/theme/infra/app_colors.dart';
import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/core/ui/components/spacing_page.dart';
import 'package:contact_auth_bloc/src/core/ui/components/three_bounce_component.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
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
                    const SizedBox(
                      height: AppDimension.jumbo,
                    ),
                    const AppTitle(title: 'Confira seus contatos!'),
                    const SizedBox(
                      height: AppDimension.large,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) {
                          final ContactEntity contact = state.contacts[index];

                          return _BuildCard(contact: contact);
                        },
                      ),
                    )
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

class _BuildCard extends StatelessWidget {
  const _BuildCard({
    required this.contact,
  });

  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppStyles.primary,
        child: AppTitle(
          title: contact.name.substring(0, 1),
          color: AppColors.white,
        ),
      ),
      title: AppTitle(
        title: contact.name,
        type: TitleType.medium,
      ),
      subtitle: AppLabel(
        isCenter: false,
        type: LabelType.medium,
        label: contact.phoneNumber,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            // TODO implementar
            onPressed: () {},
            icon: const Icon(
              Icons.edit_note,
            ),
          ),
          IconButton(
            // TODO implementar
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outlined,
            ),
          )
        ],
      ),
    );
  }
}
