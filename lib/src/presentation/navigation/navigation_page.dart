import 'package:contact_auth_bloc/src/core/theme/app_styles.dart';
import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/presentation/navigation/controller/navigation_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/navigation/controller/navigation_state.dart';
import 'package:contact_auth_bloc/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends BaseBlocState<NavigationPage, NavigationCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      bloc: controller,
      builder: (context, state) {
        return Scaffold(
          body: _getPages(index: state.currentPageIndex),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppStyles.background,
            unselectedItemColor: AppStyles.textLightColor,
            selectedItemColor: AppStyles.secondary,
            currentIndex: state.currentPageIndex,
            onTap: (index) {
              controller.changePage(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Perfil',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _getPages({required int index}) {
    switch (index) {
      case 0:
        return context.route(AppRoutes.home);
      case 1:
        return context.route(AppRoutes.profile);
      default:
        return context.route(AppRoutes.home);
    }
  }
}
