import 'package:contact_auth_bloc/src/core/theme/app_styles.dart';
import 'package:contact_auth_bloc/src/core/ui/base_bloc_state.dart';
import 'package:contact_auth_bloc/src/di/inject.dart';
import 'package:contact_auth_bloc/src/presentation/home/home_page.dart';
import 'package:contact_auth_bloc/src/presentation/main/controller/main_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/main/controller/main_state.dart';
import 'package:contact_auth_bloc/src/presentation/profile/controller/profile_cubit.dart';
import 'package:contact_auth_bloc/src/presentation/profile/controller/profile_state.dart';
import 'package:contact_auth_bloc/src/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends BaseBlocState<MainPage, MainCubit> {
  late ProfileCubit profileController;

  @override
  void initState() {
    super.initState();
    profileController = getIt.get<ProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: controller,
      builder: (context, navigationState) {
        return BlocListener<ProfileCubit, ProfileState>(
          bloc: profileController,
          listener: (context, profilsState) {
            if (profilsState is ProfileStateUpdateUserLoading) {
              controller.hideNavigation(isHide: true, pageIndex: navigationState.currentPage);
            } else {
              controller.hideNavigation(isHide: false, pageIndex: navigationState.currentPage);
            }
          },
          child: Scaffold(
            body: _getPages(index: navigationState.currentPage),
            bottomNavigationBar: navigationState.hideNavigation
                ? null
                : BottomNavigationBar(
                    backgroundColor: AppStyles.background,
                    unselectedItemColor: AppStyles.textLightColor,
                    selectedItemColor: AppStyles.secondary,
                    currentIndex: navigationState.currentPage,
                    onTap: (index) {
                      controller.changePage(pageIndex: index);
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
          ),
        );
      },
    );
  }

  Widget _getPages({required int index}) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return ProfilePage(controller: profileController);
      default:
        return const HomePage();
    }
  }
}
